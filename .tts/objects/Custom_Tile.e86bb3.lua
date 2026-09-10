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

function spawnCircularTile(imageUrl, tag)
    local object = spawnObject({
        type = "Custom_Tile"
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

function spawnTokenStack(tokenKey, count, config)
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
    baseToken.setRotation({0, 180, 0})
    
    for i = 1, count - 1 do
        local newToken = spawnCircularTile(url, tag)
        newToken.setPosition({spawnPos[1], spawnPos[2] + (i * 0.5), spawnPos[3]})
        newToken.setRotation({0, 180, 0})
        
        baseToken.putObject(newToken)
    end
end

function findReadyDeck(tag, zone, expected, allowExtra)
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if obj.type == "Deck" and not obj.isDestroyed() then
            local pos = obj.getPosition()
            if not Global.call("inXZZone", { pos = pos, zone = zone }) then
                local quantity = obj.getQuantity()
                if allowExtra then
                    if quantity >= expected then
                        return obj
                    end
                elseif quantity == expected then
                    return obj
                end
            end
        end
    end
    return nil
end

function setupDeck(deckKey, dealCount, isRowDeal, config)
    local tag = config.TAGS[deckKey]
    local targetPos = config.DECK_POSITIONS[deckKey]
    local expected = config.DECK_SIZES[deckKey]
    local allowExtra = (deckKey == "rare" or deckKey == "legendary")
    local zone = config.EXCLUDE_ZONE
    local cardList = {}

    -- 1. Gather all cards OUTSIDE the exclude zone
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        local pos = obj.getPosition()
        if not Global.call("inXZZone", { pos = pos, zone = zone }) then
            table.insert(cardList, obj)
        end
    end

    if #cardList == 0 then return end
    group(cardList)

    -- 2. Wait until the merged deck reaches the expected quantity
    -- Wait.condition(toRunFunc, conditionFunc, timeout, timeoutFunc)
    Wait.condition(
        function()
            local newDeck = findReadyDeck(tag, zone, expected, allowExtra)
            if not newDeck then return end

            if allowExtra and newDeck.getQuantity() > expected then
                printToAll(
                    "Warning: " .. deckKey .. " deck has " .. newDeck.getQuantity() ..
                    " cards (expected " .. expected .. ").",
                    {1, 0.6, 0}
                )
            end

            -- 3. Move, shuffle, and deal
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
        end,
        function()
            return findReadyDeck(tag, zone, expected, allowExtra) ~= nil
        end,
        5,
        function()
            printToAll("setupDeck timed out for " .. deckKey, {1, 0.4, 0})
        end
    )
end

function onSetupButtonClicked(clickedObject, playerColor, isAltClick)
    Global.call("setGameInitialized", false)
    Global.call("clearPlayerStats")

    local config = Global.getTable("CONFIG")

    -- Seated players minus spectators.
    -- Game rules: 4 → 7, 3 → 5, 2 → 4. Masterball stack is always 5.
    local activePlayerCount = #Player.getPlayers() - #Player.getSpectators()
    local standardTokenCount = 7
    
    if activePlayerCount == 3 then
        standardTokenCount = 5
    elseif activePlayerCount < 3 then
        standardTokenCount = 4
    end

    setupDeck("stage1", 4, true, config)
    setupDeck("stage2", 4, true, config)
    setupDeck("stage3", 4, true, config)
    setupDeck("rare", 1, false, config)
    setupDeck("legendary", 1, false, config)

    spawnTokenStack("pokeball", standardTokenCount, config)
    spawnTokenStack("greatball", standardTokenCount, config)
    spawnTokenStack("ultraball", standardTokenCount, config)
    spawnTokenStack("healball", standardTokenCount, config)
    spawnTokenStack("quickball", standardTokenCount, config)
    spawnTokenStack("masterball", 5, config)

    printToAll("初始化完毕", {0.2, 0.8, 0.2})
    Global.call("setGameInitialized", true)
end