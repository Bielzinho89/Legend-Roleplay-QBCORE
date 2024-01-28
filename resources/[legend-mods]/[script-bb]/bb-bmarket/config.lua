Config = {}

Config.Products = {
    ["heistlaptop3"] = {
        price = 20000,
    },
    ["thermite"] = {
        price = 1000,
    },
    ["thermitecharge"] = {
        price = 2000,
    },
    ["advancedlockpick"] = {
        price = 1500,
    },
    ["cokelabkey"] = {
        price = 350000,
    },
    ["bobcatsecuritycard"] = {
        price = 100000,
    },
    ["towingrope"] = {
        price = 10000,
    }
}



local setLocPick = 1 

Config.Loc1 = {
    [1] = {
        ["x"] = 2729.29,
        ["y"] = 4138.58,
        ["z"] = 44.05,
        ["h"] = 169.45,
    },
} 

Config.Locations = {
    ["market"] = {
        ["label"] = "market",
        ["type"] = "mark",
        ["coords"] = {
            [1] = {
                ["x"] = tonumber(Config.Loc1[setLocPick]["x"]),
                ["y"] = tonumber(Config.Loc1[setLocPick]["y"]),
                ["z"] = tonumber(Config.Loc1[setLocPick]["z"]),
                ["h"] = tonumber(Config.Loc1[setLocPick]["h"]),
            },
        },
        ["products"] = Config.Products,
    },
}

--------------------------- 2nd Market
Config.Products2 = {
    ["armor"] = {
        price = 325,
    },
    ["handcuffs"] = {
        price = 325,
    },
    ["methlabkey"] = {
        price = 500000,
    },
    ["pistol_suppressor"] = {
        price = 300,
    },
    ["pistol_extendedclip"] = {
        price = 500,
    },
    ["smg_flashlight"] = {
        price = 250,
    },
    ["smg_scope"] = {
        price = 1000,
    },
    ["pistol_ammo"] = {
        price = 15,
    },
    ["smg_ammo"] = {
        price = 35,
    },
    ["rifle_ammo"] = {
        price = 50,
    },
    ["weapon_assaultrifle"] = {
        price = 50,
    },
    ["weapon_smg"] = {
        price = 50,
    },
    ["weapon_microsmg"] = {
        price = 50,
    },
    ["weapon_pistol"] = {
        price = 50,
    },
}

local setLocPick2 = 1

Config.Loc2 = {
    [1] = {
        ["x"] = 711.27,
        ["y"] = 4185.32,
        ["z"] = 41.08,
        ["h"] = 88.90,
    },
} 

Config.Locations2 = {
    ["market"] = {
        ["label"] = "market",
        ["type"] = "mark",
        ["coords"] = {
            [1] = {
                ["x"] = tonumber(Config.Loc2[setLocPick2]["x"]),
                ["y"] = tonumber(Config.Loc2[setLocPick2]["y"]),
                ["z"] = tonumber(Config.Loc2[setLocPick2]["z"]),
                ["h"] = tonumber(Config.Loc2[setLocPick2]["h"]),
            },
        },
        ["products"] = Config.Products2,
    },
}