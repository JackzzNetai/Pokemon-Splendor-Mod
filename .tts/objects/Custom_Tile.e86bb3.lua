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
        tooltip        = "随机设置起始卡片\n并据人数设置筹码",
    }
    self.createButton(buttonParams)
end

function spawnCircularTile(imageUrl, tag)
    local object = spawnObject({
        type = "Custom_Tile"
    })
    object.setCustomObject({
        image = imageUrl,
        type = 2,           -- 2 forces the square image into a Circle
        thickness = 0.15,
        stackable = true
    })
    object.addTag(tag)
    return object
end

function spawnTokenStack(tokenKey, count, config)
    local tag = config.TAGS[tokenKey]
    local spawnPos = config.TOKEN_POSITIONS[tokenKey]
    local url = config.TOKEN_URLS[tokenKey]
    
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

function SetupDeck(deckKey, dealCount, isRowDeal, config)
    local tag = config.TAGS[deckKey]
    local targetPos = config.DECK_POSITIONS[deckKey]
    local cardList = {}

    -- 1. Gather all cards OUTSIDE the exclude zone
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        local pos = obj.getPosition()
        local zone = config.EXCLUDE_ZONE
        local inExcludeZone = (pos.x >= zone.xMin and pos.x <= zone.xMax and 
                               pos.z >= zone.zMin and pos.z <= zone.zMax)
        
        if not inExcludeZone then
            table.insert(cardList, obj)
        end
    end

    if #cardList == 0 then return end
    group(cardList)

    -- 2. Wait for physics to merge the new deck
    Wait.time(function()
        local newDeck = nil
        local zone = config.EXCLUDE_ZONE

        for _, obj in ipairs(getObjectsWithTag(tag)) do
            -- obj.type is the modern standard, obj.tag is the legacy fallback
            if obj.type == "Deck" or obj.tag == "Deck" then 
                local pos = obj.getPosition()
                local inExcludeZone = (pos.x >= zone.xMin and pos.x <= zone.xMax and 
                                       pos.z >= zone.zMin and pos.z <= zone.zMax)
                
                -- 3. ONLY grab the deck if it is safely outside the exclude zone
                if not inExcludeZone then
                    newDeck = obj 
                    break 
                end
            end
        end

        -- 4. Move, shuffle, and deal
        if newDeck and not newDeck.isDestroyed() then
            newDeck.setRotation({180, 0, 0})
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
        end
    end, 0.6)
end

function onSetupButtonClicked(clickedObject, playerColor, isAltClick)
    local config = Global.getTable("CONFIG")
    if not config then
        printToColor("Error: CONFIG table not found in Global script.", playerColor, {1,0,0})
        return
    end

    local activePlayerCount = #Player.getPlayers() - #Player.getSpectators()
    local standardTokenCount = 7
    
    if activePlayerCount == 3 then
        standardTokenCount = 5
    elseif activePlayerCount < 3 then
        standardTokenCount = 4
    end

    SetupDeck("stage1", 4, true, config)
    SetupDeck("stage2", 4, true, config)
    SetupDeck("stage3", 4, true, config)
    SetupDeck("rare", 1, false, config)
    SetupDeck("legendary", 1, false, config)

    spawnTokenStack("masterball", 5, config)
    spawnTokenStack("quickball", standardTokenCount, config)
    spawnTokenStack("healball", standardTokenCount, config)
    spawnTokenStack("ultraball", standardTokenCount, config)
    spawnTokenStack("greatball", standardTokenCount, config)
    spawnTokenStack("pokeball", standardTokenCount, config)

    printToAll("初始化完毕", {0.2, 0.8, 0.2})
end