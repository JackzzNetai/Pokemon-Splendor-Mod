-- ==============================================================================
-- Splendor: Pokemon - Global Game Manager (Static Configuration)
-- ==============================================================================

local CONSTANTS = {
    DECK_Y  = 1.692,
    TOKEN_Y = 2.29,
    TOKEN_Z = -5.81
}

CONFIG = {
    TAGS = {
        stage1     = "stage1",
        stage2     = "stage2",
        stage3     = "stage3",
        rare       = "rare",
        legendary  = "legendary",
        pokeball   = "pokeball",
        greatball  = "greatball",
        ultraball  = "ultraball",
        healball   = "healball",
        quickball  = "quickball",
        masterball = "masterball"
    },

    DECK_POSITIONS = {
        stage1     = {-8.87, CONSTANTS.DECK_Y, -2.30},
        stage2     = {-8.87, CONSTANTS.DECK_Y, 1.78},
        stage3     = {-8.87, CONSTANTS.DECK_Y, 5.86},
        rare       = {8.91,  CONSTANTS.DECK_Y, -0.55},
        legendary  = {8.91,  CONSTANTS.DECK_Y, 4.10}
    },

    DECK_SIZES = {
        stage1     = 35,
        stage2     = 30,
        stage3     = 15,
        rare       = 5,
        legendary  = 5
    },

    DEAL_LAYOUT = {
        startX     = -4.789,
        offsetX    = 3.2,
        rowY       = 1.560, 
        stackY     = 2.0    
    },
    
    TOKEN_POSITIONS = {
        pokeball   = {-8.55, CONSTANTS.TOKEN_Y, CONSTANTS.TOKEN_Z},
        greatball  = {-5.35, CONSTANTS.TOKEN_Y, CONSTANTS.TOKEN_Z},
        ultraball  = {-2.15, CONSTANTS.TOKEN_Y, CONSTANTS.TOKEN_Z},
        healball   = {1.05,  CONSTANTS.TOKEN_Y, CONSTANTS.TOKEN_Z},
        quickball  = {4.25,  CONSTANTS.TOKEN_Y, CONSTANTS.TOKEN_Z},
        masterball = {8.62,  CONSTANTS.TOKEN_Y, CONSTANTS.TOKEN_Z}
    },

    TOKEN_URLS = {
        pokeball   = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747487116/6ABDC58B0C26DB01261D924D8D5342E984E248F3/",
        greatball  = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747689168/B775EA9F88ECA17ADDD0874E27B12F50B755CA2E/",
        ultraball  = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747710332/FE96ADE7D02539570DC79CE61314DAD0595610FB/",
        healball   = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747739226/BA6678C3E7A0627E90E5CEC977143EA5E35C2E18/",
        quickball  = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747771209/96EF37E96F383B860E5F3C6F6E35B9474AD13C22/",
        masterball = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747791835/9EFE78E35647914052CC8B910E9BB9FE863E851F/"
    },

    SPRITE_URLS = {
        pokeball   = "https://steamusercontent-a.akamaihd.net/ugc/14709198635150254395/76550AD8A092D6BAE143F1E18E1E56C17411E555/",
        greatball  = "https://steamusercontent-a.akamaihd.net/ugc/13650033029954106742/93B32286CF47427B25FEB5E89F64A5125B07DA39/",
        ultraball  = "https://steamusercontent-a.akamaihd.net/ugc/13344432982333503541/D68F78909F91DCC0FFAC40655FED2F647D687263/",
        healball   = "https://steamusercontent-a.akamaihd.net/ugc/11552130010477945832/45659CD84BFDE0A5364C2847FF46D2F7EEB066E8/",
        quickball  = "https://steamusercontent-a.akamaihd.net/ugc/15889652890499942729/F5CE1600119C55E03F681988E0A3F24930993F09/",
        masterball = "https://steamusercontent-a.akamaihd.net/ugc/14594657176534589402/580242A96F317EC13984541BEA50FB7DB2540B8A/"
    },
    
    EXCLUDE_ZONE = {
        xMin = 3.3,
        xMax = 10.7,
        zMin = 15.8,
        zMax = 22.3
    },

    PLAYER_ZONES = {
        Purple = {
            cards = { "", "", "", "", "" },
            balls = "",
        },
        Red = {
            cards = { "", "", "", "", "" },
            balls = "",
        },
        Green = {
            cards = { "671ca5", "319bdb", "28ca61", "23c633", "68c2da" },
            balls = "b38317",
        },
        Pink = {
            cards = { "", "", "", "", "" },
            balls = "",
        },
    },

    STATS_MATS = {
        Purple = "",
        Red    = "",
        Green  = "674b1c", -- confirm in TTS
        Pink   = "",
    },

    -- Local to each mat (same for every seat). Tune once.
    STATS_TEXT = {
        fontSize  = 60,
        fontColor = {1, 1, 1},
        rotationOffset = {90, 0, 0},
        -- y sits just above the bar; x/z lined up under each icon
        offsets = {
            pokeball   = {-0.16004, 0.51, 0.05},
            greatball  = {-0.01459, 0.51, 0.05},
            ultraball  = {0.13085, 0.51, 0.05},
            healball   = {0.27630, 0.51, 0.05},
            quickball  = {0.42174, 0.51, 0.05},
            masterball = {-0.30548, 0.51, 0.05},
        },
    },
}

CARD_DATABASE = {
    -- Template format:
    -- ["[discount]_[tier]_[family]_[index]"] = {
    --     catch_cost = { [token_type]=amount, ... },
    --     evolution_cost = { [token_type]=amount, ... } 
    -- }

    -- Poke Ball
    ["pokeball_stage1_1_1"] = { -- 喇叭芽
        catch_cost = { ultraball=2, greatball=1 },
        evolution_cost = { healball=2 } 
    },

    ["pokeball_stage1_1_2"] = {
        catch_cost = { quickball=3 },
        evolution_cost = { healball=2 } 
    },

    ["pokeball_stage1_1_3"] = {
        catch_cost = { healball=2, pokeball=2 },
        evolution_cost = { healball=2 } 
    },

    ["pokeball_stage1_2_1"] = { -- 腕力
        catch_cost = { greatball=1, quickball=1, healball=1, ultraball=1 },
        evolution_cost = { quickball=3 } 
    },

    ["pokeball_stage1_2_2"] = {
        catch_cost = { quickball=2, healball=1, ultraball=1 },
        evolution_cost = { quickball=3 } 
    },

    ["pokeball_stage1_3_1"] = { -- 杰尼龟
        catch_cost = { pokeball=4 },
        evolution_cost = { ultraball=3 } 
    },

    ["pokeball_stage1_3_2"] = {
        catch_cost = { healball=3, greatball=2 },
        evolution_cost = { ultraball=3 } 
    },

    ["pokeball_stage2_1_1"] = { -- 口呆花
        catch_cost = { pokeball=3, ultraball=2, quickball=2 },
        evolution_cost = { healball=4 } 
    },

    ["pokeball_stage2_1_2"] = {
        catch_cost = { healball=3, quickball=2, ultraball=2},
        evolution_cost = { healball=4 } 
    },

    ["pokeball_stage2_2_1"] = { -- 豪力
        catch_cost = { quickball=4, ultraball=2, greatball=1 },
        evolution_cost = { greatball=3 } 
    },

    ["pokeball_stage2_2_2"] = {
        catch_cost = { pokeball=5, healball=2 },
        evolution_cost = { greatball=3 } 
    },

    ["pokeball_stage2_3_1"] = { -- 卡咪龟
        catch_cost = { pokeball=6 },
        evolution_cost = { healball=4 } 
    },

    ["pokeball_stage2_3_2"] = {
        catch_cost = { greatball=4, ultraball=4, healball=1 },
        evolution_cost = { healball=4 } 
    },

    ["pokeball_stage3_1"] = { -- 大食花
        catch_cost = { pokeball=5, ultraball=2, greatball=2 },
        evolution_cost = {  } 
    },

    ["pokeball_stage3_2"] = { -- 怪力
        catch_cost = { quickball=6, healball=4 },
        evolution_cost = {  } 
    },

    ["pokeball_stage3_3"] = { -- 水箭龟
        catch_cost = { greatball=7, ultraball=3 },
        evolution_cost = {  } 
    },

    ["pokeball_rare_1"] = { -- 拉普拉斯
        catch_cost = { masterball=1, ultraball=3, greatball=2 },
        evolution_cost = {  } 
    },

    ["pokeball_rare_2"] = { -- 火箭队的喵喵
        catch_cost = { masterball=1, ultraball=3, greatball=2 },
        evolution_cost = {  } 
    },

    ["pokeball_legendary_1"] = { -- 闪电鸟
        catch_cost = { masterball=1, healball=3, greatball=3, quickball=3 },
        evolution_cost = {  } 
    },

    ["pokeball_legendary_2"] = { -- 比克提尼
        catch_cost = { masterball=1, healball=3, greatball=3, quickball=3 },
        evolution_cost = {  } 
    },


    -- Great Ball
    ["greatball_stage1_1_1"] = { -- 波波
        catch_cost = { quickball=2, ultraball=1 },
        evolution_cost = { pokeball=2 } 
    },

    ["greatball_stage1_1_2"] = {
        catch_cost = { healball=3 },
        evolution_cost = { pokeball=2 } 
    },

    ["greatball_stage1_1_3"] = {
        catch_cost = { greatball=2, pokeball=2 },
        evolution_cost = { pokeball=2 } 
    },

    ["greatball_stage1_2_1"] = { -- 小拳石
        catch_cost = { ultraball=1, quickball=1, healball=1, pokeball=1 },
        evolution_cost = { healball=3 } 
    },

    ["greatball_stage1_2_2"] = {
        catch_cost = { pokeball=2, quickball=1, greatball=1 },
        evolution_cost = { healball=3 } 
    },

    ["greatball_stage1_3_1"] = { -- 小火龙
        catch_cost = { greatball=4 },
        evolution_cost = { quickball=3 } 
    },

    ["greatball_stage1_3_2"] = {
        catch_cost = { ultraball=3, healball=2 },
        evolution_cost = { quickball=3 } 
    },

    ["greatball_stage2_1_1"] = { -- 比比鸟
        catch_cost = { greatball=3, healball=2, ultraball=2 },
        evolution_cost = { pokeball=4 } 
    },

    ["greatball_stage2_1_2"] = {
        catch_cost = { pokeball=3, quickball=2, healball=2 },
        evolution_cost = { pokeball=4 } 
    },

    ["greatball_stage2_2_1"] = { -- 隆隆石
        catch_cost = { healball=4, quickball=2, ultraball=1 },
        evolution_cost = { ultraball=3 } 
    },

    ["greatball_stage2_2_2"] = {
        catch_cost = { greatball=5, pokeball=2 },
        evolution_cost = { ultraball=3 } 
    },

    ["greatball_stage2_3_1"] = { -- 火恐龙
        catch_cost = { greatball=6 },
        evolution_cost = { pokeball=4 } 
    },

    ["greatball_stage2_3_2"] = {
        catch_cost = { quickball=4, ultraball=4, pokeball=1 },
        evolution_cost = { pokeball=4 } 
    },

    ["greatball_stage3_1"] = { -- 大比鸟
        catch_cost = { greatball=5, ultraball=2, quickball=2 },
        evolution_cost = {  } 
    },

    ["greatball_stage3_2"] = { -- 隆隆岩
        catch_cost = { healball=6, pokeball=4 },
        evolution_cost = {  } 
    },

    ["greatball_stage3_3"] = { -- 喷火龙
        catch_cost = { ultraball=7, quickball=3 },
        evolution_cost = {  } 
    },

    ["greatball_rare_1"] = { -- 百变怪
        catch_cost = { masterball=1, healball=3, quickball=2 },
        evolution_cost = {  } 
    },

    ["greatball_rare_2"] = { -- 火箭队的果然翁
        catch_cost = { masterball=1, healball=3, quickball=2 },
        evolution_cost = {  } 
    },

    ["greatball_legendary_1"] = { -- 梦幻
        catch_cost = { masterball=1, ultraball=3, quickball=3, pokeball=3 },
        evolution_cost = {  } 
    },

    ["greatball_legendary_2"] = { -- 凯路迪欧
        catch_cost = { masterball=1, ultraball=3, quickball=3, pokeball=3 },
        evolution_cost = {  } 
    },


    -- Ultra Ball
    ["ultraball_stage1_1_1"] = { -- 走路草
        catch_cost = { healball=2, pokeball=1 },
        evolution_cost = { quickball=2 } 
    },

    ["ultraball_stage1_1_2"] = {
        catch_cost = { greatball=3 },
        evolution_cost = { quickball=2 } 
    },

    ["ultraball_stage1_1_3"] = {
        catch_cost = { quickball=2, ultraball=2 },
        evolution_cost = { quickball=2 } 
    },

    ["ultraball_stage1_2_1"] = { -- 独角虫
        catch_cost = { pokeball=1, quickball=1, healball=1, greatball=1 },
        evolution_cost = { pokeball=3 } 
    },

    ["ultraball_stage1_2_2"] = {
        catch_cost = { greatball=2, pokeball=1, healball=1 },
        evolution_cost = { pokeball=3 } 
    },

    ["ultraball_stage1_3_1"] = { -- 迷你龙
        catch_cost = { ultraball=4 },
        evolution_cost = { greatball=3 } 
    },

    ["ultraball_stage1_3_2"] = {
        catch_cost = { quickball=3, pokeball=2 },
        evolution_cost = { greatball=3 } 
    },

    ["ultraball_stage2_1_1"] = { -- 臭臭花
        catch_cost = { ultraball=3, greatball=2, pokeball=2 },
        evolution_cost = { quickball=4 } 
    },

    ["ultraball_stage2_1_2"] = {
        catch_cost = { quickball=3, greatball=2, pokeball=2 },
        evolution_cost = { quickball=4 } 
    },

    ["ultraball_stage2_2_1"] = { -- 铁壳蛹
        catch_cost = { pokeball=4, greatball=2, healball=1 },
        evolution_cost = { healball=3 } 
    },

    ["ultraball_stage2_2_2"] = {
        catch_cost = { ultraball=5, quickball=2 },
        evolution_cost = { healball=3 } 
    },

    ["ultraball_stage2_3_1"] = { -- 哈克龙
        catch_cost = { ultraball=6 },
        evolution_cost = { quickball=4 } 
    },

    ["ultraball_stage2_3_2"] = {
        catch_cost = { greatball=4, healball=4, quickball=1 },
        evolution_cost = { quickball=4 } 
    },

    ["ultraball_stage3_1"] = { -- 霸王花
        catch_cost = { ultraball=5, greatball=2, healball=2 },
        evolution_cost = {  } 
    },

    ["ultraball_stage3_2"] = { -- 大针蜂
        catch_cost = { pokeball=6, quickball=4 },
        evolution_cost = {  } 
    },

    ["ultraball_stage3_3"] = { -- 快龙
        catch_cost = { healball=7, greatball=3 },
        evolution_cost = {  } 
    },

    ["ultraball_rare_1"] = { -- 伊布
        catch_cost = { masterball=1, quickball=3, pokeball=2 },
        evolution_cost = {  } 
    },

    ["ultraball_rare_2"] = { -- 小刚的大岩蛇
        catch_cost = { masterball=1, quickball=3, pokeball=2 },
        evolution_cost = {  } 
    },

    ["ultraball_legendary_1"] = { -- 超梦
        catch_cost = { masterball=1, healball=3, pokeball=3, greatball=3 },
        evolution_cost = {  } 
    },

    ["ultraball_legendary_2"] = { -- 美洛耶塔
        catch_cost = { masterball=1, healball=3, pokeball=3, greatball=3 },
        evolution_cost = {  } 
    },


    -- Heal Ball
    ["healball_stage1_1_1"] = { -- 蚊香蝌蚪
        catch_cost = { greatball=2, quickball=1 },
        evolution_cost = { ultraball=2 } 
    },

    ["healball_stage1_1_2"] = {
        catch_cost = { pokeball=3 },
        evolution_cost = { ultraball=2 } 
    },

    ["healball_stage1_1_3"] = {
        catch_cost = { healball=2, ultraball=2 },
        evolution_cost = { ultraball=2 } 
    },

    ["healball_stage1_2_1"] = { -- 绿毛虫
        catch_cost = { greatball=1, quickball=1, pokeball=1, ultraball=1 },
        evolution_cost = { greatball=3 } 
    },

    ["healball_stage1_2_2"] = {
        catch_cost = { ultraball=2, greatball=1, quickball=1 },
        evolution_cost = { greatball=3 } 
    },

    ["healball_stage1_3_1"] = { -- 凯西
        catch_cost = { healball=4 },
        evolution_cost = { pokeball=3 } 
    },

    ["healball_stage1_3_2"] = {
        catch_cost = { greatball=3, quickball=2 },
        evolution_cost = { pokeball=3 } 
    },

    ["healball_stage2_1_1"] = { -- 蚊香君
        catch_cost = { healball=3, greatball=2, quickball=2 },
        evolution_cost = { ultraball=4 } 
    },

    ["healball_stage2_1_2"] = {
        catch_cost = { ultraball=3, greatball=2, pokeball=2 },
        evolution_cost = { ultraball=4 } 
    },

    ["healball_stage2_2_1"] = { -- 铁甲蛹
        catch_cost = { greatball=4, pokeball=2, quickball=1 },
        evolution_cost = { quickball=3 } 
    },

    ["healball_stage2_2_2"] = {
        catch_cost = { healball=5, ultraball=2 },
        evolution_cost = { quickball=3 } 
    },

    ["healball_stage2_3_1"] = { -- 勇基拉
        catch_cost = { healball=6 },
        evolution_cost = { ultraball=4 } 
    },

    ["healball_stage2_3_2"] = {
        catch_cost = { pokeball=4, quickball=4, ultraball=1 },
        evolution_cost = { ultraball=4 } 
    },

    ["healball_stage3_1"] = { -- 蚊香泳士
        catch_cost = { healball=5, quickball=2, pokeball=2 },
        evolution_cost = {  } 
    },

    ["healball_stage3_2"] = { -- 巴大蝶
        catch_cost = { greatball=6, ultraball=4 },
        evolution_cost = {  } 
    },

    ["healball_stage3_3"] = { -- 胡地
        catch_cost = { quickball=7, pokeball=3 },
        evolution_cost = {  } 
    },

    ["healball_rare_1"] = { -- 卡比兽
        catch_cost = { masterball=1, pokeball=3, ultraball=2 },
        evolution_cost = {  } 
    },

    ["healball_rare_2"] = { -- 小霞的可达鸭
        catch_cost = { masterball=1, pokeball=3, ultraball=2 },
        evolution_cost = {  } 
    },

    ["healball_legendary_1"] = { -- 火焰鸟
        catch_cost = { masterball=1, greatball=3, quickball=3, ultraball=3 },
        evolution_cost = {  } 
    },

    ["healball_legendary_2"] = { -- 蒂安希
        catch_cost = { masterball=1, greatball=3, quickball=3, ultraball=3 },
        evolution_cost = {  } 
    },


    -- Quick Ball
    ["quickball_stage1_1_1"] = { -- 尼多兰
        catch_cost = { pokeball=2, healball=1 },
        evolution_cost = { greatball=2 } 
    },

    ["quickball_stage1_1_2"] = {
        catch_cost = { ultraball=3 },
        evolution_cost = { greatball=2 } 
    },

    ["quickball_stage1_1_3"] = {
        catch_cost = { greatball=2, quickball=2 },
        evolution_cost = { greatball=2 } 
    },

    ["quickball_stage1_2_1"] = { -- 鬼斯
        catch_cost = { greatball=1, pokeball=1, healball=1, ultraball=1 },
        evolution_cost = { ultraball=3 } 
    },

    ["quickball_stage1_2_2"] = {
        catch_cost = { healball=2, ultraball=1, pokeball=1 },
        evolution_cost = { ultraball=3 } 
    },

    ["quickball_stage1_3_1"] = { -- 妙蛙种子
        catch_cost = { quickball=4 },
        evolution_cost = { healball=3 } 
    },

    ["quickball_stage1_3_2"] = {
        catch_cost = { pokeball=3, ultraball=2 },
        evolution_cost = { healball=3 } 
    },

    ["quickball_stage2_1_1"] = { -- 尼多娜
        catch_cost = { quickball=3, healball=2, pokeball=2 },
        evolution_cost = { greatball=4 } 
    },

    ["quickball_stage2_1_2"] = {
        catch_cost = { greatball=3, healball=2, ultraball=2 },
        evolution_cost = { greatball=4 } 
    },

    ["quickball_stage2_2_1"] = { -- 鬼斯通
        catch_cost = { ultraball=4, healball=2, pokeball=1 },
        evolution_cost = { pokeball=3 } 
    },

    ["quickball_stage2_2_2"] = {
        catch_cost = { quickball=5, greatball=2 },
        evolution_cost = { pokeball=3 } 
    },

    ["quickball_stage2_3_1"] = { -- 妙蛙草
        catch_cost = { quickball=6 },
        evolution_cost = { greatball=4 } 
    },

    ["quickball_stage2_3_2"] = {
        catch_cost = { pokeball=4, healball=4, greatball=1 },
        evolution_cost = { greatball=4 } 
    },

    ["quickball_stage3_1"] = { -- 尼多后
        catch_cost = { quickball=5, pokeball=2, healball=2 },
        evolution_cost = {  } 
    },

    ["quickball_stage3_2"] = { -- 耿鬼
        catch_cost = { ultraball=6, greatball=4 },
        evolution_cost = {  } 
    },

    ["quickball_stage3_3"] = { -- 妙蛙花
        catch_cost = { pokeball=7, healball=3 },
        evolution_cost = {  } 
    },

    ["quickball_rare_1"] = { -- 化石翼龙
        catch_cost = { masterball=1, greatball=3, healball=2 },
        evolution_cost = {  } 
    },

    ["quickball_rare_2"] = { -- 小智的皮卡丘
        catch_cost = { masterball=1, greatball=3, healball=2 },
        evolution_cost = {  } 
    },

    ["quickball_legendary_1"] = { -- 急冻鸟
        catch_cost = { masterball=1, pokeball=3, healball=3, ultraball=3 },
        evolution_cost = {  } 
    },

    ["quickball_legendary_2"] = { -- 捷拉奥拉
        catch_cost = { masterball=1, pokeball=3, healball=3, ultraball=3 },
        evolution_cost = {  } 
    }
}


function getDiscount(parts)
    local discount_type = parts[1]
    local amount = 1
    local tier = parts[2]
    if tier == "rare" or tier == "legendary" then
        amount = 2
    end
    return { [discount_type] = amount }
end

function getVp(parts)
    local tier = parts[2]
    if tier == "rare" then
        return 0
    end
    if tier == "legendary" then
        return 2
    end
    local stage = tonumber(tier:match("^stage(%d+)$"))
    local family = tonumber(parts[3])
    if stage == 1 then
        return (family == 3) and 1 or 0
    end
    if stage == 2 then
        return family
    end
    if stage == 3 then
        return family + 2
    end
end

-- ============================================================================
-- Market refill (stage rows + rare/legendary piles) — raycast occupancy
-- ============================================================================

local SLOT_COUNT = 4
local ROW_TIERS = {"stage1", "stage2", "stage3"}
local PILE_TIERS = {"rare", "legendary"}
local RAY_ORIGIN_Y_OFFSET = 2
local RAY_MAX_DISTANCE = 5

gameInitialized = false
local pendingTakes = {}

function setGameInitialized(value)
    gameInitialized = value and true or false
    if not gameInitialized then
        pendingTakes = {}
    end
end

local function posXYZ(position)
    return position[1] or position.x, position[2] or position.y, position[3] or position.z
end

local function castDownAt(position)
    local x, y, z = posXYZ(position)
    return Physics.cast({
        origin       = {x, y + RAY_ORIGIN_Y_OFFSET, z},
        direction    = {0, -1, 0},
        type         = 1, -- Ray
        max_distance = RAY_MAX_DISTANCE,
        debug        = false,
    })
end

local function faceUpCardAt(position)
    local hits = castDownAt(position)
    for _, hit in ipairs(hits) do
        local obj = hit.hit_object
        if obj ~= nil and not obj.isDestroyed() and obj.type == "Card" and not obj.is_face_down then
            return true
        end
    end
    return false
end

local function objectAt(position, object)
    if object == nil or object.isDestroyed() then
        return false
    end
    local guid = object.getGUID()
    local hits = castDownAt(position)
    for _, hit in ipairs(hits) do
        local obj = hit.hit_object
        if obj ~= nil and not obj.isDestroyed() and obj.getGUID() == guid then
            return true
        end
    end
    return false
end

local function deckSourceAt(position)
    local hits = castDownAt(position)
    for _, hit in ipairs(hits) do
        local obj = hit.hit_object
        if obj ~= nil and not obj.isDestroyed() then
            if obj.type == "Deck" then
                return obj
            end
            if obj.type == "Card" and obj.is_face_down then
                return obj
            end
        end
    end
    return nil
end

local function getSlotPosition(tier, slotIndex)
    local layout = CONFIG.DEAL_LAYOUT
    local deckPos = CONFIG.DECK_POSITIONS[tier]
    return {
        layout.startX + layout.offsetX * slotIndex,
        layout.rowY,
        deckPos[3]
    }
end

local function getPileRevealPosition(tier)
    local deckPos = CONFIG.DECK_POSITIONS[tier]
    return {
        deckPos[1],
        CONFIG.DEAL_LAYOUT.stackY,
        deckPos[3]
    }
end

local function findRowSlot(object)
    if object == nil or object.isDestroyed() then
        return nil
    end
    for _, tier in ipairs(ROW_TIERS) do
        if object.hasTag(CONFIG.TAGS[tier]) then
            for i = 0, SLOT_COUNT - 1 do
                local slotPos = getSlotPosition(tier, i)
                if objectAt(slotPos, object) then
                    return { kind = "row", tier = tier, slotIndex = i, position = slotPos }
                end
            end
        end
    end
    return nil
end

local function findPileFaceUp(object)
    if object == nil or object.isDestroyed() then
        return nil
    end
    if object.is_face_down then
        return nil
    end
    for _, tier in ipairs(PILE_TIERS) do
        if object.hasTag(CONFIG.TAGS[tier]) then
            local pilePos = getPileRevealPosition(tier)
            if objectAt(pilePos, object) then
                return { kind = "pile", tier = tier, position = pilePos }
            end
        end
    end
    return nil
end

local function findTierDeck(tier)
    return deckSourceAt(CONFIG.DECK_POSITIONS[tier])
end

local function refillSlot(tier, slotIndex)
    local deck = findTierDeck(tier)
    if deck == nil or deck.isDestroyed() then
        return
    end

    local slotPos = getSlotPosition(tier, slotIndex)

    if deck.type == "Deck" then
        if deck.getQuantity() < 1 then
            return
        end
        local card = deck.takeObject()
        if card then
            card.flip()
            card.setPositionSmooth(slotPos, false, false)
        end
    else
        if deck.is_face_down then
            deck.flip()
        end
        deck.setPositionSmooth(slotPos, false, false)
    end
end

local function revealPileTop(tier)
    local deck = findTierDeck(tier)
    if deck == nil or deck.isDestroyed() then
        return
    end

    local revealPos = getPileRevealPosition(tier)

    if deck.type == "Deck" then
        if deck.getQuantity() < 1 then
            return
        end
        local card = deck.takeObject()
        if card then
            card.flip()
            card.setPositionSmooth(revealPos, false, false)
        end
    else
        if deck.is_face_down then
            deck.flip()
        end
        deck.setPositionSmooth(revealPos, false, false)
    end
end

function onObjectPickUp(player_color, object)
    if not gameInitialized then
        return
    end
    if object == nil or object.isDestroyed() then
        return
    end
    if object.type ~= "Card" then
        return
    end
    local pending = findRowSlot(object)
    if pending == nil then
        pending = findPileFaceUp(object)
    end
    if pending == nil then
        return
    end
    pendingTakes[object.getGUID()] = pending
end

function onObjectDrop(player_color, object)
    if object == nil or object.isDestroyed() then
        return
    end
    local guid = object.getGUID()

    if not gameInitialized then
        pendingTakes[guid] = nil
        return
    end

    local pending = pendingTakes[guid]
    if pending == nil then
        return
    end
    -- Clear immediately so a second drop event cannot double-refill; decide after snap settles
    pendingTakes[guid] = nil

    Wait.time(function()
        if not gameInitialized then
            return
        end
        if faceUpCardAt(pending.position) then
            return
        end
        if pending.kind == "row" then
            refillSlot(pending.tier, pending.slotIndex)
        elseif pending.kind == "pile" then
            revealPileTop(pending.tier)
        end
    end, 0.5)
end

function onObjectDestroy(object)
    if object == nil then
        return
    end
    pendingTakes[object.getGUID()] = nil
end

-- ============================================================================
-- Player ball token counts (one Layout Zone per color)
-- ============================================================================

local BALL_TYPES = {
    pokeball   = true,
    greatball  = true,
    ultraball  = true,
    healball   = true,
    quickball  = true,
    masterball = true,
}

playerBalls = {}
local ballsZoneGuidToColor = {}
local statsTexts = {}
local STATS_COUNT_TAG = "stats_count_text"

local function emptyBallCounts()
    local counts = {}
    for ballType, _ in pairs(BALL_TYPES) do
        counts[ballType] = 0
    end
    return counts
end

local function ballTypeOf(object)
    if object == nil or object.isDestroyed() then
        return nil
    end
    local tags = object.getTags()
    if tags == nil then
        return nil
    end
    local tag = tags[1]
    if tag ~= nil and BALL_TYPES[tag] then
        return tag
    end
    return nil
end

local function buildBallsZoneIndex()
    ballsZoneGuidToColor = {}
    for color, zones in pairs(CONFIG.PLAYER_ZONES) do
        local guid = zones.balls
        if guid ~= nil and guid ~= "" then
            ballsZoneGuidToColor[guid] = color
        end
    end
end

local function setStatsTextValue(color, ballType, count)
    local byColor = statsTexts[color]
    if byColor == nil then
        return
    end
    local obj = byColor[ballType]
    if obj == nil or obj.isDestroyed() then
        return
    end
    obj.TextTool.setValue(tostring(count))
end

local function applyBallDelta(color, object, sign)
    local ballType = ballTypeOf(object)
    if ballType == nil then
        return
    end
    if playerBalls[color] == nil then
        playerBalls[color] = emptyBallCounts()
    end
    local counts = playerBalls[color]
    local nextCount = counts[ballType] + sign
    if nextCount < 0 then
        printToAll(
            "Warning: " .. color .. " " .. ballType .. " count would go negative; clamped to 0.",
            {1, 0.6, 0}
        )
        counts[ballType] = 0
        setStatsTextValue(color, ballType, 0)
        return
    end
    counts[ballType] = nextCount
    setStatsTextValue(color, ballType, nextCount)
end

local function initPlayerBallsFromZones()
    buildBallsZoneIndex()
    playerBalls = {}

    for color, zones in pairs(CONFIG.PLAYER_ZONES) do
        local counts = emptyBallCounts()
        local guid = zones.balls
        if guid ~= nil and guid ~= "" then
            local zone = getObjectFromGUID(guid)
            if zone ~= nil then
                for _, obj in ipairs(zone.getObjects()) do
                    local ballType = ballTypeOf(obj)
                    if ballType ~= nil then
                        counts[ballType] = counts[ballType] + 1
                    end
                end
            end
        end
        playerBalls[color] = counts
    end
end

local function clearStatsTexts()
    for _, obj in ipairs(getObjectsWithTag(STATS_COUNT_TAG)) do
        if obj ~= nil and not obj.isDestroyed() then
            obj.destruct()
        end
    end
    statsTexts = {}
end

local function addRotations(a, b)
    return {
        (a[1] or a.x or 0) + (b[1] or b.x or 0),
        (a[2] or a.y or 0) + (b[2] or b.y or 0),
        (a[3] or a.z or 0) + (b[3] or b.z or 0),
    }
end

local function spawnStatsTexts()
    clearStatsTexts()
    local cfg = CONFIG.STATS_TEXT
    local rotOff = cfg.rotationOffset or {0, 0, 0}

    for color, matGuid in pairs(CONFIG.STATS_MATS) do
        if matGuid ~= nil and matGuid ~= "" then
            local mat = getObjectFromGUID(matGuid)
            if mat ~= nil then
                statsTexts[color] = {}
                local matRot = mat.getRotation()
                local worldRot = addRotations(matRot, rotOff)
                for ballType, offset in pairs(cfg.offsets) do
                    local colorKey = color
                    local ballKey = ballType
                    spawnObject({
                        type              = "3DText",
                        position          = mat.positionToWorld(offset),
                        rotation          = worldRot,
                        sound             = false,
                        callback_function = function(obj)
                            if obj == nil or obj.isDestroyed() then
                                return
                            end
                            local count = 0
                            if playerBalls[colorKey] ~= nil then
                                count = playerBalls[colorKey][ballKey] or 0
                            end
                            obj.TextTool.setValue(tostring(count))
                            obj.TextTool.setFontSize(cfg.fontSize)
                            obj.TextTool.setFontColor(cfg.fontColor)
                            obj.addTag(STATS_COUNT_TAG)
                            obj.setLock(true)
                            obj.interactable = false
                            if statsTexts[colorKey] == nil then
                                statsTexts[colorKey] = {}
                            end
                            statsTexts[colorKey][ballKey] = obj
                        end,
                    })
                end
            end
        end
    end
end

function onObjectEnterZone(zone, object)
    if zone == nil or object == nil then
        return
    end
    local color = ballsZoneGuidToColor[zone.getGUID()]
    if color == nil then
        return
    end
    applyBallDelta(color, object, 1)
end

function onObjectLeaveZone(zone, object)
    if zone == nil or object == nil then
        return
    end
    local color = ballsZoneGuidToColor[zone.getGUID()]
    if color == nil then
        return
    end
    applyBallDelta(color, object, -1)
end

local function getTokenUiAssets()
    local assets = {}
    for name, url in pairs(CONFIG.SPRITE_URLS) do
        table.insert(assets, { name = name, url = url })
    end
    return assets
end

local function registerTokenUiAssets()
    local assets = getTokenUiAssets()
    UI.setCustomAssets(assets)
    -- Object UI has its own asset list; reuse the same sprites on every mat.
    for _, obj in ipairs(getObjects()) do
        local xml = obj.UI.getXml()
        if xml ~= nil and xml ~= "" then
            obj.UI.setCustomAssets(assets)
        end
    end
end

function onLoad()
    for card_id, entry in pairs(CARD_DATABASE) do
        local parts = {}
        for part in string.gmatch(card_id, "[^_]+") do
            table.insert(parts, part)
        end
        entry.discount = getDiscount(parts)
        entry.vp = getVp(parts)
    end
    registerTokenUiAssets()
    initPlayerBallsFromZones()
    spawnStatsTexts()
end


-- ============================================================================
-- GM hover debug (Black): print card id and stats
-- ============================================================================

showDetails = false

local BALL_COLORS = {
    pokeball   = "FF0000",
    greatball  = "0096FF",
    ultraball  = "000000",
    healball   = "FF80C8",
    quickball  = "FFFF00",
    masterball = "A855F7",
}

local function formatCost(cost)
    if cost == nil then
        return ""
    end
    local parts = {}
    for ball, amount in pairs(cost) do
        local hex = BALL_COLORS[ball] or "FFFFFF"
        table.insert(parts, "[" .. hex .. "]" .. ball .. "=" .. tostring(amount) .. "[-]")
    end
    return table.concat(parts, ", ")
end

local function formatVpDiscount(entry)
    local ball, amount = next(entry.discount)
    local hex = BALL_COLORS[ball] or "FFFFFF"
    return tostring(entry.vp) .. ", [" .. hex .. "]" .. ball .. " *" .. tostring(amount) .. "[-]"
end

local function hasCost(cost)
    if cost == nil then
        return false
    end
    return next(cost) ~= nil
end

function onObjectHover(player_color, hovered_object)
    -- 1. Restrict the trigger strictly to the Game Master
    if player_color == "Black" then
        
        -- 2. When the cursor moves off an object onto the table, TTS passes 'nil'.
        -- We must verify an object actually exists under the cursor to prevent errors.
        if hovered_object ~= nil then
            
            local gmNote = hovered_object.getGMNotes()
            
            -- 3. Check if the string exists and is not empty
            if gmNote ~= nil and gmNote ~= "" then
                printToColor("id: " .. gmNote, "Black", {1, 0.8, 0})
                if showDetails then
                    local entry = CARD_DATABASE[gmNote]
                    if entry ~= nil then
                        local lines = {
                            formatVpDiscount(entry),
                            formatCost(entry.catch_cost),
                        }
                        if hasCost(entry.evolution_cost) then
                            table.insert(lines, "evolution_cost: " .. formatCost(entry.evolution_cost))
                        end
                        printToColor(table.concat(lines, "\n"), "Black", {1, 1, 1})
                    end
                end
            end
        end
    end
end

-- ============================================================================