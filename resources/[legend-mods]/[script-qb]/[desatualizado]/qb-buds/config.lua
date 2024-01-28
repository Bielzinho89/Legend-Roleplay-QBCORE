Config = {}

--[[TODO
Config.GaragePedLocations = {
    --{coords = vector4(-1178.588, -891.9196, 13.799622, 302.58825)}, (unused)
}
]]

Config.SQL = 'oxmysql' --- oxmysql or ghmattisql

Config.DebugPolys = false

Config.Items = {
label = "Shop",
    slots = 23,
    items = {
        [1] = {
            name = "lighter",
            price = 2,
            amount = 20,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "rolling_paper",
            price = 5,
            amount = 20,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 2,
            amount = 20,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weed_purple-haze",
            price = 2,
            amount = 20,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weed_ak47",
            price = 5,
            amount = 20,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weed_white-widow",
            price = 3,
            amount = 20,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weed_og-kush",
            price = 5,
            amount = 20,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}