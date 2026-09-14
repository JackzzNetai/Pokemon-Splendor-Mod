local constants = Global.getTable("CONSTANTS")
local config = Global.getTable("CONFIG")

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
        thickness = 0.15,
        stackable = true
    })
    object.addTag(tag)
    return object
end

local function spawnTokenStack(tokenKey, count)
    local tag = config.TAGS[tokenKey]
    local spawnPos = config.TOKEN_POSITIONS[tokenKey]
    local url = config.TOKEN_TILE_URLS[tokenKey]
    
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if obj.type == "Tile" and not obj.isDestroyed() then
            obj.destroy()
        end
    end
    
    local baseToken = spawnCircularTile(url, tag)
    baseToken.setPosition(spawnPos)
    
    for i = 1, count - 1 do
        local newToken = spawnCircularTile(url, tag)
        newToken.setPosition({spawnPos[1], spawnPos[2] + (i * 0.3), spawnPos[3]})
        
        baseToken.putObject(newToken)
    end
end

-- Does not collect Cards/Decks inside CONFIG.EXCLUDE_ZONE.
local function collectCardsAndDecks()
    local zone = config.EXCLUDE_ZONE
    local cards = {}
    local decks = {}
    for _, obj in ipairs(getObjects()) do
        if Global.call("isAlive", obj) then
            local objType = obj.type
            if objType == "Card" or objType == "Deck" then
                local pos = obj.getPosition()
                if not Global.call("inXZZone", { pos = pos, zone = zone }) then
                    if objType == "Card" then
                        table.insert(cards, obj)
                    else
                        table.insert(decks, obj)
                    end
                end
            end
        end
    end
    return { cards = cards, decks = decks }
end

local function placeCardByTag(card)
    if not Global.call("isAlive", card) then
        return
    end
    local tag = Global.call("firstTag", card)
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

local function redistributeGiantDeck(giant, onDone)
    if not Global.call("isAlive", giant) then
        onDone()
        return
    end
    if giant.type == "Card" then
        placeCardByTag(giant)
        onDone()
        return
    end
    local pos = giant.getPosition()
    giant.takeObject({
        position = {pos.x, pos.y + 1.5, pos.z},
        rotation = giant.getRotation(),
        smooth = false,
        callback_function = function(taken)
            placeCardByTag(taken)
            local remainder = giant.remainder
            if Global.call("isAlive", remainder) then
                placeCardByTag(remainder)
                onDone()
                return
            end
            if not Global.call("isAlive", giant) then
                onDone()
                return
            end
            Wait.frames(function()
                redistributeGiantDeck(giant, onDone)
            end, 1)
        end
    })
end

local function mergeToCenterGiantDeck(collected, onDone)
    local all = {}
    for _, card in ipairs(collected.cards) do
        if Global.call("isAlive", card) then
            table.insert(all, card)
        end
    end
    for _, deck in ipairs(collected.decks) do
        if Global.call("isAlive", deck) then
            table.insert(all, deck)
        end
    end
    if #all == 0 then
        onDone(nil)
        return
    end
    if #all == 1 then
        local giant = all[1]
        giant.setPosition({0, constants.DECK_Y, 0})
        onDone(giant)
        return
    end
    local grouped = group(all)
    local giant = grouped ~= nil and grouped[1] or nil
    Wait.frames(function()
        if Global.call("isAlive", giant) then
            giant.setPosition({0, constants.DECK_Y, 0})
        end
        onDone(giant)
    end, 1)
end

local function findDeckWithExactCount(tag, zone, expected)
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if obj.type == "Deck" and Global.call("isAlive", obj) then
            local pos = obj.getPosition()
            if not Global.call("inXZZone", { pos = pos, zone = zone }) then
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

    Wait.condition(
        function()
            local newDeck = findDeckWithExactCount(tag, zone, expected)
            if not newDeck then
                onComplete()
                return
            end

            newDeck.setRotation({180, 0, 0}) -- face-down
            newDeck.randomize()
            newDeck.setPositionSmooth(targetPos, false, false)

            for i = 0, dealCount - 1 do
                local card = newDeck.takeObject()
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
            return findDeckWithExactCount(tag, zone, expected) ~= nil
        end,
        5,
        function()
            printToAll("setupDeck timed out for " .. deckKey, constants.COLOR_ORANGE)
            onComplete()
        end
    )
end

local function startFinishSetupDecks()
    local pending = 5
    local function onTierDone()
        pending = pending - 1
        if pending == 0 then
            printToAll("初始化完毕", constants.COLOR_GREEN)
            Global.call("setGameInitialized", true)
        end
    end
    finishSetupDeck("stage1", 4, true, onTierDone)
    finishSetupDeck("stage2", 4, true, onTierDone)
    finishSetupDeck("stage3", 4, true, onTierDone)
    finishSetupDeck("rare", 1, false, onTierDone)
    finishSetupDeck("legendary", 1, false, onTierDone)
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

    spawnTokenStack("pokeball", standardTokenCount)
    spawnTokenStack("greatball", standardTokenCount)
    spawnTokenStack("ultraball", standardTokenCount)
    spawnTokenStack("healball", standardTokenCount)
    spawnTokenStack("quickball", standardTokenCount)
    spawnTokenStack("masterball", 5)

    local collected = collectCardsAndDecks()
    mergeToCenterGiantDeck(collected, function(giant)
        local function afterRedistribute()
            startFinishSetupDecks()
        end
        if giant == nil then
            afterRedistribute()
            return
        end
        redistributeGiantDeck(giant, afterRedistribute)
    end)
end