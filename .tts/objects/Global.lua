-- ==============================================================================
-- Splendor: Pokemon - Global Game Manager (Static Configuration)
-- CONSTANTS: numbers we chose to name and reuse (not every literal).
-- CONFIG: parameters the mod needs to run (tags, URLs, GUIDs, sizes, zones).
--         Those parameters may still contain one-off numbers.
-- ==============================================================================

local CONSTANTS = {
    COLOR_ORANGE = {1, 0.6, 0},
    COLOR_WHITE = {1, 1, 1},
    COLOR_GREEN = {0, 0.75, 0},
    COLOR_RED = {1, 0.2, 0.2},
    COLOR_GOLD = {1, 0.82, 0.2},
    STATS_BUTTON_COLOR = {0.18, 0.18, 0.22},

    STATS_TEXT_FONT_SIZE = {
        DISCOUNT = 60,
        COST_N_TOKEN = 90,
        VP = 100,
        BUTTON_LABEL = 30
    },
    STATS_BUTTON_WIDTH = 60,
    STATS_BUTTON_HEIGHT = 100,

    STATS_TEXT_ROTATION = {90, 0, 0},
    
    STATS_TEXT_X = {
        pokeball   = -0.16004,
        greatball  = -0.01459,
        ultraball  = 0.13085,
        healball   = 0.27630,
        quickball  = 0.42174,
        masterball = -0.30548
    },
    STATS_TEXT_VP_X = -0.43,
    STATS_TEXT_COST_N_TOKEN_X_DELTA = 0.035,
    STATS_TEXT_Y = 0.51,
    STATS_TEXT_Z = {
        DISCOUNT = 0.05,
        COST_N_TOKEN = -0.15
    },
    STATS_ICON_Y = 27,
    STATS_BUTTON_LABEL_Z_DELTA = 0.047,
    DECK_Y  = 1.692,
    TOKEN_Y = 2.29,
    TOKEN_Z = -5.81,
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

    -- Custom_Tile image
    TOKEN_TILE_URLS = {
        pokeball   = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747487116/6ABDC58B0C26DB01261D924D8D5342E984E248F3/",
        greatball  = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747689168/B775EA9F88ECA17ADDD0874E27B12F50B755CA2E/",
        ultraball  = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747710332/FE96ADE7D02539570DC79CE61314DAD0595610FB/",
        healball   = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747739226/BA6678C3E7A0627E90E5CEC977143EA5E35C2E18/",
        quickball  = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747771209/96EF37E96F383B860E5F3C6F6E35B9474AD13C22/",
        masterball = "https://steamusercontent-a.akamaihd.net/ugc/2323362210747791835/9EFE78E35647914052CC8B910E9BB9FE863E851F/"
    },

    TOKEN_SPRITE_URLS = {
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

    MARKET_ZONE = {
        xMin = -11.9464,
        xMax =  11.9797,
        zMin =  -7.9778,
        zMax =   8.9238
    },

    PLAYER_ZONES = {
        Purple = {
            cards = { "6aae89", "43b47b", "48e1cf", "28ec3a", "389f10" },
            tokens = "fd7598"
        },
        Red = {
            cards = { "eb4ecc", "595551", "e98ba9", "7af763", "b29bbc" },
            tokens = "3e3fd0"
        },
        Green = {
            cards = { "671ca5", "319bdb", "28ca61", "23c633", "68c2da" },
            tokens = "b38317"
        },
        Pink = {
            cards = { "1e9803", "c7daeb", "fe3b7f", "ba85cb", "edc134" },
            tokens = "0ed047"
        }
    },

    STATS_MATS = {
        Purple = "2a66d4",
        Red    = "264624",
        Green  = "674b1c",
        Pink   = "565e01"
    },

    -- offsets are built in spawnDisplayTexts from STATS_TEXT_X / Y / Z / X_DELTA
    DISCOUNT_DISPLAY = {
        fontSize = CONSTANTS.STATS_TEXT_FONT_SIZE.DISCOUNT,
        z = CONSTANTS.STATS_TEXT_Z.DISCOUNT,
        includeMasterball = false
    },
    COST_DISPLAY = {
        fontSize = CONSTANTS.STATS_TEXT_FONT_SIZE.COST_N_TOKEN,
        z = CONSTANTS.STATS_TEXT_Z.COST_N_TOKEN,
        xDelta = -CONSTANTS.STATS_TEXT_COST_N_TOKEN_X_DELTA
    },
    TOKEN_DISPLAY = {
        fontSize = CONSTANTS.STATS_TEXT_FONT_SIZE.COST_N_TOKEN,
        z = CONSTANTS.STATS_TEXT_Z.COST_N_TOKEN,
        xDelta = CONSTANTS.STATS_TEXT_COST_N_TOKEN_X_DELTA
    },
    SLASH_DISPLAY = {
        fontSize = CONSTANTS.STATS_TEXT_FONT_SIZE.COST_N_TOKEN,
        z = CONSTANTS.STATS_TEXT_Z.COST_N_TOKEN
    },
    VP_DISPLAY = {
        fontSize = CONSTANTS.STATS_TEXT_FONT_SIZE.VP,
        offset = {CONSTANTS.STATS_TEXT_VP_X, CONSTANTS.STATS_TEXT_Y, 0.43}
    },

    EVO_HINT_BUTTON = {
        label    = "进化提示",
        position = {-CONSTANTS.STATS_TEXT_VP_X, CONSTANTS.STATS_TEXT_Y, -0.042}
    },
    PAY_BUTTON = {
        label    = "支付",
        position = {-CONSTANTS.STATS_TEXT_VP_X, CONSTANTS.STATS_TEXT_Y, -0.305}
    },
    USE_MASTER_BUTTON = {
        label    = "使用大师球",
        position = {-CONSTANTS.STATS_TEXT_X.masterball, CONSTANTS.STATS_TEXT_Y, -0.042}
    }
}

CARD_DATABASE = {
    -- Keys are the GM notes on each card in game.
    --
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

local STAGE_TIERS = {stage1 = true, stage2 = true, stage3 = true}
local NON_STAGE_TIERS = {rare = true, legendary = true}

local function getDiscount(parts)
    local discountType = parts[1]
    -- Stage cards grant 1; rare/legendary grant 2.
    local amount = STAGE_TIERS[parts[2]] and 1 or 2
    return { [discountType] = amount }
end

local function getVp(parts)
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
-- Shared utils
-- ============================================================================

local function isAlive(object)
    return object ~= nil and not object.isDestroyed()
end

local function printWarning(message)
    printToAll(message, CONSTANTS.COLOR_ORANGE)
end

local function posXYZ(position)
    return position[1] or position.x, position[2] or position.y, position[3] or position.z
end

local function firstTag(object)
    local tags = object.getTags()
    if tags == nil then
        return nil
    end
    return tags[1]
end

-- True if pos.x/z is inside zone {xMin,xMax,zMin,zMax}.
-- Also accepts {pos=, zone=} so object scripts can Global.call this.
function inXZZone(pos, zone)
    if zone == nil then
        zone = pos.zone
        pos = pos.pos
    end
    return pos.x >= zone.xMin and pos.x <= zone.xMax
       and pos.z >= zone.zMin and pos.z <= zone.zMax
end

local function handCards(player)
    if player == nil or player.getHandCount() < 1 then
        return {}
    end
    local hand = player.getHandObjects()
    if hand == nil then
        return {}
    end
    return hand
end

-- ============================================================================
-- Market refill (stage rows + rare/legendary piles) — raycast occupancy
-- ============================================================================

local SLOT_COUNT = 4
local RAY_ORIGIN_Y_OFFSET = 4
local RAY_MAX_DISTANCE = 7
local SNAP_SETTLE_SECONDS = 0.1

-- Skipping false→true in onLoad: no player input there, and onLoad only reads/configures.
gameInitialized = true
local pendingMarketRefills = {}

local function castDownAt(position)
    local x, y, z = posXYZ(position)
    return Physics.cast({
        origin       = {x, y + RAY_ORIGIN_Y_OFFSET, z},
        direction    = {0, -1, 0},
        type         = 1, -- Ray
        max_distance = RAY_MAX_DISTANCE,
        debug        = false
    })
end

local function faceUpCardObjectAt(position)
    local hits = castDownAt(position)
    for _, hit in ipairs(hits) do
        local obj = hit.hit_object
        if isAlive(obj) and obj.type == "Card" and not obj.is_face_down then
            return obj
        end
    end
    return nil
end

local function isObjectAt(position, object)
    if not isAlive(object) then
        return false
    end
    local guid = object.getGUID()
    local hits = castDownAt(position)
    for _, hit in ipairs(hits) do
        local obj = hit.hit_object
        if isAlive(obj) and obj.getGUID() == guid then
            return true
        end
    end
    return false
end

local function deckSourceAt(position)
    local hits = castDownAt(position)
    for _, hit in ipairs(hits) do
        local obj = hit.hit_object
        if isAlive(obj) then
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

-- Stage first (row slots), then non-stage (pile).
local function findMarketTake(object)
    if not isAlive(object) then
        return nil
    end
    -- Safe at pickup: a card cannot leave MARKET_ZONE in the same instant it is picked up.
    if not inXZZone(object.getPosition(), CONFIG.MARKET_ZONE) then
        return nil
    end
    local tier = firstTag(object)
    if STAGE_TIERS[tier] then
        for i = 0, SLOT_COUNT - 1 do
            local slotPos = getSlotPosition(tier, i)
            if isObjectAt(slotPos, object) then
                return { kind = "row", tier = tier, slotIndex = i, position = slotPos }
            end
        end
        return nil
    end
    -- Face-down: the pile deck, not the revealed card.
    if object.is_face_down then
        return nil
    end
    if not NON_STAGE_TIERS[tier] then
        return nil
    end
    local pilePos = getPileRevealPosition(tier)
    if isObjectAt(pilePos, object) then
        return { kind = "pile", tier = tier, position = pilePos }
    end
    return nil
end

local function findTierDeck(tier)
    return deckSourceAt(CONFIG.DECK_POSITIONS[tier])
end

local function takeFromDeckTo(deck, destPosition)
    if not isAlive(deck) then
        return
    end
    if deck.type == "Deck" then
        if deck.getQuantity() < 1 then
            return
        end
        local card = deck.takeObject()
        if card then
            card.flip()
            card.setPositionSmooth(destPosition, false, false)
        end
    else
        -- Last card in a pile is type Card, not Deck.
        if deck.is_face_down then
            deck.flip()
        end
        deck.setPositionSmooth(destPosition, false, false)
    end
end

local function refillSlot(tier, slotIndex)
    takeFromDeckTo(findTierDeck(tier), getSlotPosition(tier, slotIndex))
end

local function revealPileTop(tier)
    takeFromDeckTo(findTierDeck(tier), getPileRevealPosition(tier))
end

function onObjectPickUp(playerColor, object)
    if not gameInitialized then
        return
    end
    if not isAlive(object) then
        return
    end
    if object.type ~= "Card" then
        return
    end
    local pending = findMarketTake(object)
    if pending == nil then
        return
    end
    pendingMarketRefills[object.getGUID()] = pending
end

function onObjectDrop(playerColor, object)
    if not isAlive(object) then
        return
    end
    local guid = object.getGUID()
    if guid == nil or guid == "" then
        return
    end

    if not gameInitialized then
        pendingMarketRefills[guid] = nil
        return
    end

    local pending = pendingMarketRefills[guid]
    if pending == nil then
        return
    end
    -- Clear immediately so a second drop event cannot double-refill; decide after snap settles
    pendingMarketRefills[guid] = nil

    Wait.time(function()
        if not gameInitialized then
            return
        end
        if faceUpCardObjectAt(pending.position) then
            return
        end
        if pending.kind == "row" then
            refillSlot(pending.tier, pending.slotIndex)
        elseif pending.kind == "pile" then
            revealPileTop(pending.tier)
        end
    end, SNAP_SETTLE_SECONDS)
end

function onObjectDestroy(object)
    if object == nil then
        return
    end
    local guid = object.getGUID()
    if guid == nil or guid == "" then
        return
    end
    pendingMarketRefills[guid] = nil
end

-- ============================================================================
-- Player token counts (one Layout Zone per color)
-- Player card discount / VP (five Layout Zones per color, joined)
-- ============================================================================

-- Token types used by zeroCountsByTokenType and per-token loops.
local TOKEN_TYPES = {
    pokeball   = true,
    greatball  = true,
    ultraball  = true,
    healball   = true,
    quickball  = true,
    masterball = true
}

-- Wiped by clearTokenState.
local playerTokens = {}
-- Wiped by clearCardState.
local playerDiscounts = {}
local playerVp = {}
local playerCards = {}
local evolveTargets = {} -- [color][target(truncated)] = source.evolution_cost
-- Wiped by clearHoverCosts.
local lastAdjustedHoverCosts = {}
local useMasterAsWild = {}
-- Zone GUID → owner color.
local tokensZoneGuidToColor = {}
local cardsZoneGuidToColor = {}
local matGuidToColor = {}
-- Spawned stats number 3DTexts.
local discountTexts = {}
local costTexts = {}
local tokenTexts = {}
local slashTexts = {}
local vpTexts = {}
-- Spawned button-label 3DTexts.
local evoHintTexts = {}
local payTexts = {}
local useMasterTexts = {}
-- Tags for those 3DTexts (clear/find by tag).
local DISCOUNT_TEXT_TAG = "stats_discount_text"
local COST_TEXT_TAG = "stats_cost_text"
local TOKEN_TEXT_TAG = "stats_token_text"
local SLASH_TEXT_TAG = "stats_slash_text"
local VP_TEXT_TAG = "stats_vp_text"
local EVO_HINT_TEXT_TAG = "stats_evo_hint_text"
local PAY_TEXT_TAG = "stats_pay_text"
local USE_MASTER_TEXT_TAG = "stats_use_master_text"

local function zeroCountsByTokenType()
    local counts = {}
    for tokenType, _ in pairs(TOKEN_TYPES) do
        counts[tokenType] = 0
    end
    return counts
end

local function clearHoverCosts()
    lastAdjustedHoverCosts = {} -- Same as looping lastAdjustedHoverCosts[color] = nil
    useMasterAsWild = {} -- Practically same as looping useMasterAsWild[color] = false
    for _, obj in pairs(useMasterTexts) do
        if isAlive(obj) then
            obj.TextTool.setFontColor(CONSTANTS.COLOR_WHITE)
        end
    end
end

local function clearCardState()
    for color, _ in pairs(CONFIG.PLAYER_ZONES) do
        playerDiscounts[color] = zeroCountsByTokenType()
        playerVp[color] = 0
        playerCards[color] = {}
        evolveTargets[color] = {}
    end
end

local function clearTokenState()
    for color, _ in pairs(CONFIG.PLAYER_ZONES) do
        playerTokens[color] = zeroCountsByTokenType()
    end
end

local function setUseMasterAsWild(color, enabled)
    useMasterAsWild[color] = enabled
    local obj = useMasterTexts[color]
    if isAlive(obj) then
        if enabled then
            obj.TextTool.setFontColor(CONSTANTS.COLOR_GOLD)
        else
            obj.TextTool.setFontColor(CONSTANTS.COLOR_WHITE)
        end
    end
end

local function matOwnerColor(object)
    if not isAlive(object) then
        return nil
    end
    return matGuidToColor[object.getGUID()]
end

local function tokenTypeOf(object)
    if not isAlive(object) then
        return nil
    end
    local tag = firstTag(object)
    if tag ~= nil and TOKEN_TYPES[tag] then
        return tag
    end
    return nil
end

local function buildPlayerZoneIndexes()
    tokensZoneGuidToColor = {}
    cardsZoneGuidToColor = {}
    matGuidToColor = {}
    for color, zones in pairs(CONFIG.PLAYER_ZONES) do
        tokensZoneGuidToColor[zones.tokens] = color
        for _, guid in ipairs(zones.cards) do
            cardsZoneGuidToColor[guid] = color
        end
    end
    for color, matGuid in pairs(CONFIG.STATS_MATS) do
        matGuidToColor[matGuid] = color
    end
end

local function forEachZoneObject(guid, fn)
    local zone = getObjectFromGUID(guid)
    if zone == nil then
        return
    end
    for _, obj in ipairs(zone.getObjects()) do
        fn(obj)
    end
end

local function warnMissingCardDatabase(color, id, object)
    printWarning(
        "Warning: " .. tostring(color) .. " card GM note '" .. tostring(id)
            .. "' (GUID " .. object.getGUID() .. ") not in CARD_DATABASE."
    )
end

-- Returns id, entry; or nil, nil (silent skip / warned miss).
local function resolveCard(object, color)
    if not isAlive(object) then
        return nil, nil
    end
    local id = object.getGMNotes()
    if id == nil or id == "" then
        return nil, nil
    end
    local entry = CARD_DATABASE[id]
    if entry == nil then
        warnMissingCardDatabase(color, id, object)
        return nil, nil
    end
    return id, entry
end

local function setTextToolValue(obj, value)
    if not isAlive(obj) then
        return
    end
    obj.TextTool.setValue(tostring(value))
end

local function setDisplayTextValue(store, color, tokenType, count)
    local byColor = store[color]
    if byColor == nil then
        return
    end
    setTextToolValue(byColor[tokenType], count)
end

local function nonNegative(raw)
    return math.max(0, raw)
end

-- When useMasterAsWild[color] is true: each non-masterball cost is capped at tokens owned;
-- any unpaid remainder is added onto the masterball cost.
local function catchCostToShow(color, tokenType)
    local adjusted = lastAdjustedHoverCosts[color]
    if useMasterAsWild[color] then
        local tokens = playerTokens[color]
        if tokenType == "masterball" then
            local shown = nonNegative(adjusted.masterball)
            for otherType, _ in pairs(TOKEN_TYPES) do
                if otherType ~= "masterball" then
                    local overflow = nonNegative(adjusted[otherType]) - tokens[otherType]
                    if overflow > 0 then
                        shown = shown + overflow
                    end
                end
            end
            return shown
        end
        return math.min(nonNegative(adjusted[tokenType]), tokens[tokenType])
    end
    return nonNegative(adjusted[tokenType])
end

local function setCostDisplay(color, tokenType)
    local byColor = costTexts[color]
    if byColor == nil then
        return
    end
    local obj = byColor[tokenType]
    if not isAlive(obj) then
        return
    end
    local adjusted = lastAdjustedHoverCosts[color]
    if adjusted == nil then
        obj.TextTool.setValue("0")
        obj.TextTool.setFontColor(CONSTANTS.COLOR_WHITE)
        return
    end
    local shown = catchCostToShow(color, tokenType)
    obj.TextTool.setValue(tostring(shown))
    if shown <= playerTokens[color][tokenType] then
        obj.TextTool.setFontColor(CONSTANTS.COLOR_GREEN)
    else
        obj.TextTool.setFontColor(CONSTANTS.COLOR_RED)
    end
end

local function writeCostDisplays(color)
    for tokenType, _ in pairs(TOKEN_TYPES) do
        setCostDisplay(color, tokenType)
    end
end

local function setVpDisplayTextValue(color, count)
    setTextToolValue(vpTexts[color], count)
end

local function countOrZero(map, color, key)
    local byColor = map[color]
    if byColor == nil then
        return 0
    end
    return byColor[key] or 0
end

-- Returns clamped value; warns if delta would go negative.
local function applyClampedDelta(current, delta, warning)
    local nextCount = current + delta
    if nextCount < 0 then
        printWarning(warning)
        return 0
    end
    return nextCount
end

local function ensurePlayerTokenState(color)
    if playerTokens[color] == nil then
        playerTokens[color] = zeroCountsByTokenType()
    end
end

local function applyTokenDelta(color, object, sign)
    local tokenType = tokenTypeOf(object)
    if tokenType == nil then
        return
    end
    ensurePlayerTokenState(color)
    local counts = playerTokens[color]
    local nextCount = applyClampedDelta(
        counts[tokenType],
        sign,
        "Warning: " .. color .. " " .. tokenType .. " count would go negative; clamped to 0."
    )
    counts[tokenType] = nextCount
    setDisplayTextValue(tokenTexts, color, tokenType, nextCount)
    local remembered = lastAdjustedHoverCosts[color]
    if remembered ~= nil then
        setCostDisplay(color, tokenType)
        if useMasterAsWild[color] and tokenType ~= "masterball" then
            setCostDisplay(color, "masterball")
        end
    end
end

local function initPlayerTokensFromZones()
    clearTokenState()
    for color, zones in pairs(CONFIG.PLAYER_ZONES) do
        local counts = playerTokens[color]
        forEachZoneObject(zones.tokens, function(obj)
            local tokenType = tokenTypeOf(obj)
            if tokenType ~= nil then
                counts[tokenType] = counts[tokenType] + 1
            end
        end)
    end
end

local function ensurePlayerCardState(color)
    if playerDiscounts[color] == nil then
        playerDiscounts[color] = zeroCountsByTokenType()
    end
    if playerVp[color] == nil then
        playerVp[color] = 0
    end
    if playerCards[color] == nil then
        playerCards[color] = {}
    end
    if evolveTargets[color] == nil then
        evolveTargets[color] = {}
    end
end

-- Card identity for looking up evolution (not full GM notes):
--   Full id:     discount_tier_family_index  (e.g. pokeball_stage1_1_2)
--   Truncated:   discount_tier_family       (drops index when present; stage3/rare/legendary stay as-is)
-- playerCards[color][truncated] = how many prints of that family at that stage the player owns.
-- evolveTargets[color][next-stage truncated id] = cost to evolve into that card.
-- Cost comes from the first print (..._1) of the same family, one stage lower.
-- Example: player owns a stage1 print of family 1 (GM notes pokeball_stage1_1_1, _2, or _3).
-- Truncated ownership key is pokeball_stage1_1.
-- evolveTargets then stores the next stage using truncated id pokeball_stage2_1 as the key,
-- and the cost is CARD_DATABASE["pokeball_stage1_1_1"].evolution_cost (always the _1 print).
-- Same pattern for stage2 → stage3. Stage3, rare, and legendary do not add a target.
local function truncatedCardId(id)
    local truncated = id:match("^([^_]+_[^_]+_[^_]+)_%d+$")
    if truncated ~= nil then
        return truncated
    end
    return id
end

-- Next-stage truncated id for stage1/stage2; nil otherwise.
local function evolveTargetOf(key)
    local discount, stage, family = key:match("^([^_]+)_stage([12])_(%d+)$")
    if discount == nil then
        return nil
    end
    return discount .. "_stage" .. (tonumber(stage) + 1) .. "_" .. family
end

local function applyCardDelta(color, object, sign)
    local id, entry = resolveCard(object, color)
    if id == nil then
        return
    end
    ensurePlayerCardState(color)

    local discounts = playerDiscounts[color]
    for tokenType, amount in pairs(entry.discount) do
        local nextCount = applyClampedDelta(
            discounts[tokenType],
            sign * amount,
            "Warning: " .. color .. " " .. tokenType
                .. " discount would go negative; clamped to 0."
        )
        discounts[tokenType] = nextCount
        setDisplayTextValue(discountTexts, color, tokenType, -nextCount) -- display as negative
    end

    local nextVp = applyClampedDelta(
        playerVp[color],
        sign * (entry.vp or 0),
        "Warning: " .. color .. " VP would go negative; clamped to 0."
    )
    playerVp[color] = nextVp
    setVpDisplayTextValue(color, nextVp)

    local key = truncatedCardId(id)
    local cards = playerCards[color]
    local targets = evolveTargets[color]
    if sign > 0 then
        local isNew = cards[key] == nil
        cards[key] = (cards[key] or 0) + 1
        if isNew then
            local target = evolveTargetOf(key)
            if target ~= nil then
                local sourceId = key .. "_1"
                local sourceEntry = CARD_DATABASE[sourceId]
                if sourceEntry == nil then
                    printWarning(
                        "Warning: " .. tostring(color) .. " card GM note '" .. sourceId
                            .. "' not in CARD_DATABASE."
                    )
                else
                    targets[target] = sourceEntry.evolution_cost
                end
            end
        end
    else
        local count = cards[key]
        if count == nil then
            printWarning(
                "Warning: " .. tostring(color) .. " card '" .. tostring(key)
                    .. "' left a layout zone but was not in playerCards."
            )
        else
            count = count - 1
            if count == 0 then
                cards[key] = nil
                local target = evolveTargetOf(key)
                if target ~= nil then
                    targets[target] = nil
                end
            else
                cards[key] = count
            end
        end
    end
end

local function initPlayerCardsFromZones()
    clearCardState()

    for color, zones in pairs(CONFIG.PLAYER_ZONES) do
        for _, guid in ipairs(zones.cards) do
            forEachZoneObject(guid, function(obj)
                applyCardDelta(color, obj, 1)
            end)
        end
    end
end

-- ============================================================================
-- Stats 3DText spawn + mat buttons/labels
-- ============================================================================

local function clearTaggedTexts(tag)
    for _, obj in ipairs(getObjectsWithTag(tag)) do
        if isAlive(obj) then
            obj.destruct()
        end
    end
end

local function addRotations(a, b)
    return {
        (a[1] or a.x or 0) + (b[1] or b.x or 0),
        (a[2] or a.y or 0) + (b[2] or b.y or 0),
        (a[3] or a.z or 0) + (b[3] or b.z or 0)
    }
end

local function configureStatsText(obj, config, tag, value)
    obj.TextTool.setValue(tostring(value))
    obj.TextTool.setFontSize(config.fontSize)
    obj.TextTool.setFontColor(CONSTANTS.COLOR_WHITE)
    obj.addTag(tag)
    obj.setLock(true)
    obj.interactable = false
end

local function spawnLockedText(mat, worldRot, offset, config, tag, value, onReady)
    spawnObject({
        type              = "3DText",
        position          = mat.positionToWorld(offset),
        rotation          = worldRot,
        sound             = false,
        callback_function = function(obj)
            if not isAlive(obj) then
                return
            end
            configureStatsText(obj, config, tag, value)
            onReady(obj)
        end
    })
end

local function buildStatsOffsets(config)
    local offsets = {}
    local xDelta = config.xDelta or 0
    local includeMasterball = config.includeMasterball ~= false
    for tokenType, x in pairs(CONSTANTS.STATS_TEXT_X) do
        if includeMasterball or tokenType ~= "masterball" then
            offsets[tokenType] = {x + xDelta, CONSTANTS.STATS_TEXT_Y, config.z}
        end
    end
    return offsets
end

-- config.offset -> one text per mat; else one text per token from CONSTANTS.STATS_TEXT_X
local function spawnDisplayTexts(config, tag, store, valueFor)
    local rotOff = CONSTANTS.STATS_TEXT_ROTATION
    local single = config.offset ~= nil
    if not single and config.offsets == nil then
        config.offsets = buildStatsOffsets(config)
    end

    for color, matGuid in pairs(CONFIG.STATS_MATS) do
        local mat = getObjectFromGUID(matGuid)
        if mat ~= nil then
            local worldRot = addRotations(mat.getRotation(), rotOff)
            local colorKey = color
            if single then
                spawnLockedText(
                    mat, worldRot, config.offset, config, tag, valueFor(colorKey),
                    function(obj)
                        store[colorKey] = obj
                    end
                )
            else
                store[color] = {}
                for key, offset in pairs(config.offsets) do
                    local ballKey = key
                    spawnLockedText(
                        mat, worldRot, offset, config, tag, valueFor(colorKey, ballKey),
                        function(obj)
                            if store[colorKey] == nil then
                                store[colorKey] = {}
                            end
                            store[colorKey][ballKey] = obj
                        end
                    )
                end
            end
        end
    end
end

local function spawnStatsTexts()
    for _, tag in ipairs({
        DISCOUNT_TEXT_TAG, COST_TEXT_TAG, TOKEN_TEXT_TAG, SLASH_TEXT_TAG, VP_TEXT_TAG
    }) do
        clearTaggedTexts(tag)
    end
    discountTexts, costTexts, tokenTexts, slashTexts, vpTexts = {}, {}, {}, {}, {}

    spawnDisplayTexts(CONFIG.DISCOUNT_DISPLAY, DISCOUNT_TEXT_TAG, discountTexts, function(color, tokenType)
        return -countOrZero(playerDiscounts, color, tokenType)
    end)
    spawnDisplayTexts(CONFIG.COST_DISPLAY, COST_TEXT_TAG, costTexts, function()
        return 0
    end)
    spawnDisplayTexts(CONFIG.TOKEN_DISPLAY, TOKEN_TEXT_TAG, tokenTexts, function(color, tokenType)
        return countOrZero(playerTokens, color, tokenType)
    end)
    spawnDisplayTexts(CONFIG.SLASH_DISPLAY, SLASH_TEXT_TAG, slashTexts, function()
        return "/"
    end)
    spawnDisplayTexts(CONFIG.VP_DISPLAY, VP_TEXT_TAG, vpTexts, function(color)
        return playerVp[color] or 0
    end)
end

local function addStatsMatButton(mat, config, clickFunction)
    mat.createButton({
        click_function = clickFunction,
        function_owner = self,
        position       = config.position,
        width          = CONSTANTS.STATS_BUTTON_WIDTH,
        height         = CONSTANTS.STATS_BUTTON_HEIGHT,
        color          = CONSTANTS.STATS_BUTTON_COLOR
    })
end

local function labelDisplayFromButton(buttonCfg)
    local x, y, z = posXYZ(buttonCfg.position)
    return {
        fontSize = CONSTANTS.STATS_TEXT_FONT_SIZE.BUTTON_LABEL,
        offset = { -x, y, z + CONSTANTS.STATS_BUTTON_LABEL_Z_DELTA }
    }
end

local function spawnStatsMatLabels()
    for _, tag in ipairs({EVO_HINT_TEXT_TAG, PAY_TEXT_TAG, USE_MASTER_TEXT_TAG}) do
        clearTaggedTexts(tag)
    end
    evoHintTexts, payTexts, useMasterTexts = {}, {}, {}

    local specs = {
        { CONFIG.EVO_HINT_BUTTON, EVO_HINT_TEXT_TAG, evoHintTexts },
        { CONFIG.PAY_BUTTON, PAY_TEXT_TAG, payTexts },
        { CONFIG.USE_MASTER_BUTTON, USE_MASTER_TEXT_TAG, useMasterTexts }
    }
    for _, spec in ipairs(specs) do
        local buttonCfg = spec[1]
        spawnDisplayTexts(
            labelDisplayFromButton(buttonCfg),
            spec[2], spec[3],
            function() return buttonCfg.label end
        )
    end
end

local function spawnStatsMatButtons()
    for _, matGuid in pairs(CONFIG.STATS_MATS) do
        local mat = getObjectFromGUID(matGuid)
        if mat ~= nil then
            mat.clearButtons()
            addStatsMatButton(mat, CONFIG.EVO_HINT_BUTTON, "onEvoHintClicked")
            addStatsMatButton(mat, CONFIG.PAY_BUTTON, "onPayClicked")
            addStatsMatButton(mat, CONFIG.USE_MASTER_BUTTON, "onUseMasterClicked")
        end
    end
    spawnStatsMatLabels()
end

-- ============================================================================
-- Zone enter/leave → token/card deltas
-- ============================================================================

local function handleZoneObject(zone, object, sign)
    if not gameInitialized then
        return
    end
    if zone == nil or object == nil then
        return
    end
    local guid = zone.getGUID()
    local tokenColor = tokensZoneGuidToColor[guid]
    if tokenColor ~= nil then
        applyTokenDelta(tokenColor, object, sign)
        return
    end
    local cardColor = cardsZoneGuidToColor[guid]
    if cardColor ~= nil then
        applyCardDelta(cardColor, object, sign)
    end
end

function onObjectEnterZone(zone, object)
    handleZoneObject(zone, object, 1)
end

function onObjectLeaveZone(zone, object)
    handleZoneObject(zone, object, -1)
end

-- ============================================================================
-- Hover: catchable card catch costs
-- ============================================================================

local function cardInPlayerHand(object, color)
    local guid = object.getGUID()
    for _, obj in ipairs(handCards(Player[color])) do
        if isAlive(obj) and obj.getGUID() == guid then
            return true
        end
    end
    return false
end

-- Hand: any orientation. Market: face-up in MARKET_ZONE only.
local function showsCatchCostOnHover(object, color)
    if not isAlive(object) or object.type ~= "Card" then
        return false
    end
    if cardInPlayerHand(object, color) then
        return true
    end
    if object.is_face_down then
        return false
    end
    return inXZZone(object.getPosition(), CONFIG.MARKET_ZONE)
end

local function applyCatchCostsFromEntry(color, entry)
    if costTexts[color] == nil then
        return
    end
    ensurePlayerCardState(color)
    ensurePlayerTokenState(color)
    local catch = entry.catch_cost or {}
    local discounts = playerDiscounts[color]
    local adjusted = {}
    for tokenType, _ in pairs(TOKEN_TYPES) do
        adjusted[tokenType] = (catch[tokenType] or 0) - discounts[tokenType]
    end
    lastAdjustedHoverCosts[color] = adjusted
    writeCostDisplays(color)
end

function onObjectHover(playerColor, hoveredObject)
    if not showsCatchCostOnHover(hoveredObject, playerColor) then
        return
    end
    if costTexts[playerColor] == nil then
        return
    end
    local id = hoveredObject.getGMNotes()
    if id == nil or id == "" then
        printWarning(
            "Warning: " .. tostring(playerColor) .. " card has empty GM note (GUID "
                .. hoveredObject.getGUID() .. "); not in CARD_DATABASE."
        )
        return
    end
    local entry = CARD_DATABASE[id]
    if entry == nil then
        warnMissingCardDatabase(playerColor, id, hoveredObject)
        return
    end
    applyCatchCostsFromEntry(playerColor, entry)
end

-- ============================================================================
-- Mat-owner clicks: evo hint, pay, use-master
-- ============================================================================

local function collectEvoHintCandidates(player)
    local cards = {}
    for _, tier in ipairs({"stage2", "stage3"}) do
        for slotIndex = 0, SLOT_COUNT - 1 do
            local card = faceUpCardObjectAt(getSlotPosition(tier, slotIndex))
            if card ~= nil then
                table.insert(cards, card)
            end
        end
    end
    for _, card in ipairs(handCards(player)) do
        if isAlive(card) and card.type == "Card" then
            table.insert(cards, card)
        end
    end
    return cards
end

local function canEvolveWithDiscounts(color, cost)
    for tokenType, amount in pairs(cost) do
        if countOrZero(playerDiscounts, color, tokenType) < amount then
            return false
        end
    end
    return true
end

local function pingEvoHintCards(color, player, cards, shouldPing)
    for _, card in ipairs(cards) do
        local id = card.getGMNotes()
        if id == nil or id == "" then
            printWarning(
                "Warning: " .. tostring(color) .. " card has empty GM note (GUID "
                    .. card.getGUID() .. "); not in CARD_DATABASE."
            )
        elseif shouldPing(truncatedCardId(id)) then
            player.pingTable(card.getPosition())
        end
    end
end

function onEvoHintClicked(obj, playerColor, isAltClick)
    local color = matOwnerColor(obj)
    if color == nil then
        return
    end
    ensurePlayerCardState(color)
    local player = Player[color]
    if player == nil then
        return
    end

    local shouldPing
    if isAltClick then
        -- right click
        shouldPing = function(key)
            local cost = evolveTargets[color][key]
            return cost and canEvolveWithDiscounts(color, cost)
        end
    else
        -- left click
        shouldPing = function(key)
            return evolveTargets[color][key]
        end
    end
    pingEvoHintCards(color, player, collectEvoHintCandidates(player), shouldPing)
end

local function trySpendCatchCostsToShow(color)
    if lastAdjustedHoverCosts[color] == nil then
        return
    end
    ensurePlayerTokenState(color)
    local tokens = playerTokens[color]
    local pay = {}
    for tokenType, _ in pairs(TOKEN_TYPES) do
        local amount = catchCostToShow(color, tokenType)
        pay[tokenType] = amount
        if amount > tokens[tokenType] then
            local player = Player[color]
            if player ~= nil then
                player.broadcast("精灵球不足", CONSTANTS.COLOR_RED)
            end
            return
        end
    end

    local needed = {}
    for tokenType, amount in pairs(pay) do
        needed[tokenType] = amount
    end
    local moving = {}
    local tokenZone = getObjectFromGUID(CONFIG.PLAYER_ZONES[color].tokens)
    if isAlive(tokenZone) then
        for _, obj in ipairs(tokenZone.getObjects()) do
            local tokenType = tokenTypeOf(obj)
            if tokenType ~= nil and needed[tokenType] > 0 then
                table.insert(moving, { obj = obj, tokenType = tokenType })
                needed[tokenType] = needed[tokenType] - 1
            end
        end
    end
    for tokenType, left in pairs(needed) do
        if left > 0 then
            printWarning(
                "Warning: " .. color .. " " .. tokenType
                    .. " zone cannot supply payment; needed "
                    .. tostring(pay[tokenType]) .. "."
            )
            return
        end
    end

    for _, item in ipairs(moving) do
        item.obj.setPositionSmooth(CONFIG.TOKEN_POSITIONS[item.tokenType], false, false)
    end
    tokenZone.LayoutZone.layout()

    lastAdjustedHoverCosts[color] = nil
    if useMasterAsWild[color] then
        setUseMasterAsWild(color, false)
    end
    writeCostDisplays(color)
end

function onPayClicked(obj, playerColor, isAltClick)
    local color = matOwnerColor(obj)
    if color == nil then
        return
    end
    trySpendCatchCostsToShow(color)
end

function onUseMasterClicked(obj, playerColor, isAltClick)
    local color = matOwnerColor(obj)
    if color == nil then
        return
    end
    setUseMasterAsWild(color, not useMasterAsWild[color])
    writeCostDisplays(color)
end

-- ============================================================================
-- onLoad / clearPlayerStats / setGameInitialized
-- ============================================================================

function setGameInitialized(value)
    gameInitialized = value and true or false
    if not gameInitialized then
        pendingMarketRefills = {}
    end
end

function clearPlayerStats()
    clearHoverCosts()
    clearCardState()
    clearTokenState()
    for color, _ in pairs(CONFIG.PLAYER_ZONES) do
        for tokenType, _ in pairs(TOKEN_TYPES) do
            setDisplayTextValue(tokenTexts, color, tokenType, 0)
            setDisplayTextValue(discountTexts, color, tokenType, 0)
            setCostDisplay(color, tokenType) -- writes "0" and forces white font color
        end
        setVpDisplayTextValue(color, 0)
    end
end

local function getTokenUiAssets()
    local assets = {}
    for name, url in pairs(CONFIG.TOKEN_SPRITE_URLS) do
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

local function applyStatsMatIconOffsets()
    local y = CONSTANTS.STATS_ICON_Y
    for _, matGuid in pairs(CONFIG.STATS_MATS) do
        local mat = getObjectFromGUID(matGuid)
        if mat ~= nil then
            for tokenType, x in pairs(CONSTANTS.STATS_TEXT_X) do
                mat.UI.setAttribute(
                    tokenType .. "_icon",
                    "offsetXY",
                    string.format("%.3f %s", x * 100, tostring(y))
                )
            end
        end
    end
end

function onLoad()
    for cardId, entry in pairs(CARD_DATABASE) do
        local parts = {}
        for part in string.gmatch(cardId, "[^_]+") do
            table.insert(parts, part)
        end
        entry.discount = getDiscount(parts)
        entry.vp = getVp(parts)
    end
    registerTokenUiAssets()
    applyStatsMatIconOffsets()
    buildPlayerZoneIndexes()
    clearHoverCosts()
    initPlayerTokensFromZones()
    initPlayerCardsFromZones()
    spawnStatsTexts()
    spawnStatsMatButtons()
end