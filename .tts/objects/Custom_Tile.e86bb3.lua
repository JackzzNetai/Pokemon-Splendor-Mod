local constants = Global.getTable("CONSTANTS")
local config = Global.getTable("CONFIG")

-- Mirrors Global (avoid Global.call in hot paths).
local function isAlive(object)
    return object ~= nil and not object.isDestroyed()
end

local function inXZZone(pos, zone)
    if zone == nil then
        zone = pos.zone
        pos = pos.pos
    end
    return pos.x >= zone.xMin and pos.x <= zone.xMax
       and pos.z >= zone.zMin and pos.z <= zone.zMax
end

local STANDARD_TOKEN_KEYS = {
    "pokeball", "greatball", "ultraball", "healball", "quickball"
}

local DECK_JOBS = {
    { key = "stage1",    deal = 4, row = true },
    { key = "stage2",    deal = 4, row = true },
    { key = "stage3",    deal = 4, row = true },
    { key = "rare",      deal = 1, row = false },
    { key = "legendary", deal = 1, row = false }
}

function onLoad()
    local buttonParams = {
        click_function = "onSetupButtonClicked",
        function_owner = self,
        label          = "",
        position       = {0, -0.1, 0},
        rotation       = {0, 0, 0},
        width          = 900,
        height         = 900,
        font_size      = 340,
        color          = {0.5, 0.5, 0.5},
        font_color     = {1, 1, 1},
        tooltip        = "随机设置起始卡片\n并据人数设置筹码"
    }
    self.createButton(buttonParams)
end

local function spawnCircularTile(imageUrl, tag)
    local object = spawnObject({
        type = "Custom_Tile",
        rotation = {0, 180, 0}
    })
    object.setCustomObject({
        image = imageUrl,
        type = 2, -- forces the square image into a Circle
        thickness = 0.15
    })
    object.addTag(tag)
    return object
end

local function spawnTokenStack(tokenKey, count)
    local tag = config.TAGS[tokenKey]
    local spawnPos = config.TOKEN_POSITIONS[tokenKey]
    local url = config.TOKEN_TILE_URLS[tokenKey]

    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if obj.type == "Tile" and isAlive(obj) then
            obj.destroy()
        end
    end

    for i = 0, count - 1 do
        local token = spawnCircularTile(url, tag)
        token.setPosition({
            spawnPos[1],
            spawnPos[2] + (i * constants.TOKEN_STACK_Y_OFFSET),
            spawnPos[3]
        })
    end
end

-- Does not collect Cards/Decks inside CONFIG.EXCLUDE_ZONE.
local function collectCardObjects()
    local zone = config.EXCLUDE_ZONE
    local objects = {}
    for _, obj in ipairs(getObjects()) do
        if isAlive(obj) then
            local objType = obj.type
            if objType == "Card" or objType == "Deck" then
                if not inXZZone(obj.getPosition(), zone) then
                    table.insert(objects, obj)
                end
            end
        end
    end
    return objects
end

local function placeCardByTag(card)
    if not isAlive(card) then
        return
    end
    local tags = card.getTags()
    local tag = tags ~= nil and tags[1] or nil
    local dest = tag ~= nil and config.DECK_POSITIONS[tag] or nil
    if dest == nil then
        local notes = card.getGMNotes()
        if notes == nil or notes == "" then
            notes = "(empty GM notes)"
        end
        printToAll(
            "Warning: card '" .. notes .. "' has unknown tag '"
                .. tostring(tag) .. "'.",
            constants.COLOR_ORANGE
        )
        return
    end
    card.setPosition(dest)
end

local function redistributeCenterDeck(centerDeck, onDone)
    if not isAlive(centerDeck) then
        onDone()
        return
    end
    if centerDeck.type == "Card" then
        placeCardByTag(centerDeck)
        onDone()
        return
    end
    local pos = centerDeck.getPosition()
    centerDeck.takeObject({
        position = {pos.x, pos.y + 1.5, pos.z},
        rotation = centerDeck.getRotation(),
        smooth = false,
        callback_function = function(taken)
            placeCardByTag(taken)
            local remainder = centerDeck.remainder
            if isAlive(remainder) then
                placeCardByTag(remainder)
                onDone()
                return
            end
            if not isAlive(centerDeck) then
                onDone()
                return
            end
            redistributeCenterDeck(centerDeck, onDone)
        end
    })
end

local function buildCenterDeck(objects, onDone)
    if #objects == 0 then
        onDone(nil)
        return
    end
    if #objects == 1 then
        local centerDeck = objects[1]
        centerDeck.setPosition({0, constants.DECK_Y, 0})
        onDone(centerDeck)
        return
    end
    local grouped = group(objects)
    local centerDeck = grouped ~= nil and grouped[1] or nil
    Wait.frames(function()
        if isAlive(centerDeck) then
            centerDeck.setPosition({0, constants.DECK_Y, 0})
        end
        onDone(centerDeck)
    end, 1)
end

local function findDeckWithExactCount(tag, zone, expected)
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if obj.type == "Deck" and isAlive(obj) then
            if not inXZZone(obj.getPosition(), zone) then
                if obj.getQuantity() == expected then
                    return obj
                end
            end
        end
    end
    return nil
end

local function finishSetupDeck(deckKey, dealCount, isRowDeal, onComplete)
    local tag = config.TAGS[deckKey]
    local targetPos = config.DECK_POSITIONS[deckKey]
    local expected = config.DECK_SIZES[deckKey]
    local zone = config.EXCLUDE_ZONE
    local foundDeck = nil

    Wait.condition(
        function()
            if not isAlive(foundDeck) then
                onComplete()
                return
            end

            foundDeck.setRotation({180, 0, 0}) -- face-down
            foundDeck.randomize()
            foundDeck.setPositionSmooth(targetPos, false, false)

            for i = 0, dealCount - 1 do
                local card = foundDeck.takeObject()
                if card then
                    card.flip()
                    if isRowDeal then
                        local dealX = config.DEAL_LAYOUT.startX + (config.DEAL_LAYOUT.offsetX * i)
                        card.setPositionSmooth({dealX, config.DEAL_LAYOUT.rowY, targetPos[3]}, false, false)
                    else
                        card.setPositionSmooth({targetPos[1], config.DEAL_LAYOUT.stackY, targetPos[3]}, false, false)
                    end
                end
            end
            onComplete()
        end,
        function()
            foundDeck = findDeckWithExactCount(tag, zone, expected)
            return foundDeck ~= nil
        end,
        5,
        function()
            printToAll("setupDeck timed out for " .. deckKey, constants.COLOR_ORANGE)
            onComplete()
        end
    )
end

local function startFinishSetupDecks()
    local pending = #DECK_JOBS
    local function onTierDone()
        pending = pending - 1
        if pending == 0 then
            printToAll("初始化完毕", constants.COLOR_GREEN)
            Global.call("setGameInitialized", true)
        end
    end
    for _, job in ipairs(DECK_JOBS) do
        finishSetupDeck(job.key, job.deal, job.row, onTierDone)
    end
end

function onSetupButtonClicked(clickedObject, playerColor, isAltClick)
    Global.call("setGameInitialized", false)
    Global.call("clearPlayerStats")

    -- Seated players minus spectators.
    -- Game rules: 4 → 7, 3 → 5, 2 → 4. Masterball stack is always 5.
    local activePlayerCount = #Player.getPlayers() - #Player.getSpectators()
    local standardTokenCount = 7

    if activePlayerCount == 3 then
        standardTokenCount = 5
    elseif activePlayerCount < 3 then
        standardTokenCount = 4
    end

    for _, key in ipairs(STANDARD_TOKEN_KEYS) do
        spawnTokenStack(key, standardTokenCount)
    end
    spawnTokenStack("masterball", 5)

    buildCenterDeck(collectCardObjects(), function(centerDeck)
        if centerDeck == nil then
            startFinishSetupDecks()
            return
        end
        redistributeCenterDeck(centerDeck, startFinishSetupDecks)
    end)
end