Config = {}

Config.Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


Config.Products = {
    ["normal"] = {
        [1] = {
            name = "tosti",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "kurkakola",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "snikkel_candy",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "sandwich",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "beer",
            price = 7,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "whiskey",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "vodka",
            price = 12,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "bandage",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "rolling_paper",
            price = 2,
            amount = 5000,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "syphoningkit",
            price = 5000,
            amount = 5,
            info = { gasamount = 0 }, -- This must be included or, your item will not store fuel properly!
            type = "item",
            slot = 10,
        }, -- CDN-Fuel / CDN-Syphoning
        [14] = {
            name = "jerrycan",
            price = 750,
            amount = 5,
            info = { gasamount = 0 }, -- This must be included or, your item will not store fuel properly!
            type = "item",
            slot = 11,
        }, -- CDN-Fuel
    },

    
    ["huntingshop"] = {
        [1] = {
            name = 'weapon_sniperrifle2',
            price = 1500,
            amount = 10,
            info = {},
            type = 'weapon',
            slot = 1,
            requiresLicense = true
        },
        [2] = {
            name = 'snp_ammo',
            price = 100,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
            requiresLicense = true
        },
        [3] = {
            name = 'huntingbait',
            price = 150,
            amount = 150,
            info = {},
            type = 'item',
            slot = 3
        },
        [4] = {
            name = 'weapon_knife',
            price = 500,
            amount = 50,
            info = {},
            type = 'item',
            slot = 4
        }
    },
    ["uwu"] = {
        [1] = {
            name = "uwububbleteablueberry",
            price = 6,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "uwububbletearose",
            price = 6,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "uwububbleteamint",
            price = 6,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "uwucupcake",
            price = 6,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "uwuvanillasandy",
            price = 8,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "uwuchocsandy",
            price = 8,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "uwupancake",
            price = 12,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "uwusushi",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "uwumisosoup",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "uwubudhabowl",
            price = 12,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
    },
    ["mechanic"] = {
        [1] = {
            name = "engine0",
            price = 800,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
            requiredJob = { "mechanic" }
        },
        [2] = {
            name = "engine1",
            price = 1350,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
            requiredJob = { "mechanic" }
        },
        [3] = {
            name = "engine2",
            price = 6000,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
            requiredJob = { "mechanic" }
        },
        [4] = {
            name = "engine3",
            price = 11000,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
            requiredJob = { "mechanic" }
        },
        [5] = {
            name = "engine4",
            price = 16000,
            amount = 2,
            info = {},
            type = "item",
            slot = 5,
            requiredJob = { "mechanic" }
        },
        [6] = {
            name = "brake0",
            price = 375,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
            requiredJob = { "mechanic" }
        },
        [7] = {
            name = "brake1",
            price = 1000,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
            requiredJob = { "mechanic" }
        },
        [8] = {
            name = "brake2",
            price = 2250,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
            requiredJob = { "mechanic" }
        },
        [9] = {
            name = "brake3",
            price = 3750,
            amount = 5,
            info = {},
            type = "item",
            slot = 9,
            requiredJob = { "mechanic" }
        },
        [11] = {
            name = "transmission0",
            price = 700,
            amount = 5,
            info = {},
            type = "item",
            slot = 11,
            requiredJob = { "mechanic" }
        },
        [12] = {
            name = "transmission1",
            price = 1500,
            amount = 5,
            info = {},
            type = "item",
            slot = 12,
            requiredJob = { "mechanic" }
        },
        [13] = {
            name = "transmission2",
            price = 3250,
            amount = 5,
            info = {},
            type = "item",
            slot = 13,
            requiredJob = { "mechanic" }
        },
        [14] = {
            name = "transmission3",
            price = 4250,
            amount = 5,
            info = {},
            type = "item",
            slot = 14,
            requiredJob = { "mechanic" }
        },
        [16] = {
            name = "suspension0",
            price = 300,
            amount = 5,
            info = {},
            type = "item",
            slot = 16,
            requiredJob = { "mechanic" }
        },
        [17] = {
            name = "suspension1",
            price = 880,
            amount = 5,
            info = {},
            type = "item",
            slot = 17,
            requiredJob = { "mechanic" }
        },
        [18] = {
            name = "suspension2",
            price = 2250,
            amount = 5,
            info = {},
            type = "item",
            slot = 18,
            requiredJob = { "mechanic" }
        },
        [19] = {
            name = "suspension3",
            price = 4750,
            amount = 5,
            info = {},
            type = "item",
            slot = 19,
            requiredJob = { "mechanic" }
        },
        [20] = {
            name = "turbo0",
            price = 500,
            amount = 5,
            info = {},
            type = "item",
            slot = 20,
            requiredJob = { "mechanic" }
        },
        [21] = {
            name = "turbo1",
            price = 5000,
            amount = 5,
            info = {},
            type = "item",
            slot = 21,
            requiredJob = { "mechanic" }
        },
        [22] = {
            name = "cleaningkit",
            price = 18,
            amount = 50,
            info = {},
            type = "item",
            slot = 22,
            requiredJob = { "mechanic" }
        },
    },
    ["hardware"] = {
        [1] = {
            name = "lockpick",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_wrench",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hammer",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "repairkit",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
            requiredJob = { "mechanic", "police" }
        },
        [5] = {
            name = "screwdriverset",
            price = 350,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "phone",
            price = 850,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "radio",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "firework1",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "firework2",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "firework3",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "firework4",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "fitbit",
            price = 400,
            amount = 150,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "advancedrepairkit",
            price = 500,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
            requiredJob = { "mechanic" }
        },
        [16] = {
            name = "empty_weed_bag",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "rolling_paper",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 17,
        },      
    },
    ["coffeeshop"] = {
        [1] = {
            name = "joint",
            price = 10,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 100,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 20,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "rolling_paper",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
    },

    ["weed123"] = {
        [1] = {
            name = "joint",
            price = 10,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 100,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 20,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "rolling_paper",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
    },

    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "jerry_can",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },    
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        -- [4] = {
        --     name = "smoketrailred",
        --     price = 250,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 4,
        -- },
    },
    ["weapons"] = {
        [1] = {
            name = "weapon_knife",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_bat",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hatchet",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
            requiredJob = { "mechanic", "police" }
        },
        [4] = {
            name = "weapon_pistol",
            price = 2500,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
            requiresLicense = true
        },
        [5] = {
            name = "weapon_snspistol",
            price = 1500,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
            requiresLicense = true
        },
        [6] = {
            name = "weapon_vintagepistol",
            price = 4000,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
            requiresLicense = true
        },
        [7] = {
            name = "pistol_ammo",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 7,
            requiresLicense = true
        },
    },
    ["coffeeplace"] = {
        [1] = {
            name = "coffee",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["casino"] = {
        [1] = {
            name = 'casinochips',
            price = 100,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 1,
        }
    },

    ["mechanicshop1"] = {
        [1] = {
            name = 'metalscrap',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'plastic',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'steel',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 3,
        },
        [4] = {
            name = 'aluminum',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 4,
        },
        [5] = {
            name = 'copper',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 5,
        },
        [6] = {
            name = 'repairkit',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 6,
        },
        
        [7] = {
            name = 'advancedrepairkit',
            price = 0,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 7,
        }
        
        
    },

    ["coc"] = {
        [1] = { name = "coca", price = 50, amount = 10, info = {}, type = "item", slot = 1 },
        [2] = { name = "hydriodicacid", price = 50, amount = 10, info = {}, type = "item", slot = 2 },
        [3] = { name = "hydroacid",  price = 50, amount = 10, info = {}, type = "item", slot = 3 },
        [4] = { name = "ammonia",  price = 50, amount = 10, info = {}, type = "item", slot = 4 },
        [5] = { name = "pseudoephedrine",  price = 50, amount = 10, info = {}, type = "item", slot = 5 },
        [6] = { name = "acetone",  price = 50, amount = 10, info = {}, type = "item", slot = 6 },
        [7] = { name = "iodine_crystals",  price = 50, amount = 10, info = {}, type = "item", slot = 7 },
        [8] = { name = "sulfuricacid",  price = 50, amount = 10, info = {}, type = "item", slot = 8 },
        [9] = { name = "glucose",  price = 50, amount = 10, info = {}, type = "item", slot = 9 },
        [10] = { name = "rawmeth",  price = 50, amount = 10, info = {}, type = "item", slot = 10 },
        [11] = { name = "drymeth",  price = 50, amount = 10, info = {}, type = "item", slot = 11 },
        [12] = { name = "methbag",  price = 50, amount = 10, info = {}, type = "item", slot = 12 },
        [13] = { name = "meth10g",  price = 50, amount = 10, info = {}, type = "item", slot = 13 }
     
    },

    ["tuner"] = {
        [1] = {
            name = "engine0",
            price = 800,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
            requiredJob = { "tuner" }
        },
        [2] = {
            name = "engine1",
            price = 1350,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
            requiredJob = { "tuner" }
        },
        [3] = {
            name = "engine2",
            price = 6000,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
            requiredJob = { "tuner" }
        },
        [4] = {
            name = "engine3",
            price = 11000,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
            requiredJob = { "tuner" }
        },
        [5] = {
            name = "engine4",
            price = 16000,
            amount = 2,
            info = {},
            type = "item",
            slot = 5,
            requiredJob = { "tuner" }
        },
        [6] = {
            name = "brake0",
            price = 375,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
            requiredJob = { "tuner" }
        },
        [7] = {
            name = "brake1",
            price = 1000,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
            requiredJob = { "tuner" }
        },
        [8] = {
            name = "brake2",
            price = 2250,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
            requiredJob = { "tuner" }
        },
        [9] = {
            name = "brake3",
            price = 3750,
            amount = 5,
            info = {},
            type = "item",
            slot = 9,
            requiredJob = { "tuner" }
        },
        [11] = {
            name = "transmission0",
            price = 700,
            amount = 5,
            info = {},
            type = "item",
            slot = 11,
            requiredJob = { "tuner" }
        },
        [12] = {
            name = "transmission1",
            price = 1500,
            amount = 5,
            info = {},
            type = "item",
            slot = 12,
            requiredJob = { "tuner" }
        },
        [13] = {
            name = "transmission2",
            price = 3250,
            amount = 5,
            info = {},
            type = "item",
            slot = 13,
            requiredJob = { "tuner" }
        },
        [14] = {
            name = "transmission3",
            price = 4250,
            amount = 5,
            info = {},
            type = "item",
            slot = 14,
            requiredJob = { "tuner" }
        },
        [16] = {
            name = "suspension0",
            price = 300,
            amount = 5,
            info = {},
            type = "item",
            slot = 16,
            requiredJob = { "tuner" }
        },
        [17] = {
            name = "suspension1",
            price = 880,
            amount = 5,
            info = {},
            type = "item",
            slot = 17,
            requiredJob = { "tuner" }
        },
        [18] = {
            name = "suspension2",
            price = 2250,
            amount = 5,
            info = {},
            type = "item",
            slot = 18,
            requiredJob = { "tuner" }
        },
        [19] = {
            name = "suspension3",
            price = 4750,
            amount = 5,
            info = {},
            type = "item",
            slot = 19,
            requiredJob = { "tuner" }
        },
        [20] = {
            name = "turbo0",
            price = 500,
            amount = 5,
            info = {},
            type = "item",
            slot = 20,
            requiredJob = { "tuner" }
        },
        [21] = {
            name = "turbo1",
            price = 5000,
            amount = 5,
            info = {},
            type = "item",
            slot = 21,
            requiredJob = { "tuner" }
        },
        [22] = {
            name = "cleaningkit",
            price = 18,
            amount = 50,
            info = {},
            type = "item",
            slot = 22,
            requiredJob = { "tuner" }
        },
        [23] = {
            name = "stancerkit",
            price = 18,
            amount = 50,
            info = {},
            type = "item",
            slot = 23,
            requiredJob = { "tuner" }
        },
        [24] = {
            name = "nitrous",
            price = 18,
            amount = 50,
            info = {},
            type = "item",
            slot = 24,
            requiredJob = { "tuner" }
        }
    },
  
}



Config.Locations = {
    ["mechanicshop1"] = {
        ["label"] = "Mechanic Shop",
        ["type"] = "item",
        ["coords"] = {
            [1] = vector3(-319.32, -131.88, 38.98)
        },
        ["ped"] = 'ig_hunter',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Hunting Shop",
        ["products"] = Config.Products["mechanicshop1"],
        ["showblip"] = false,
    
    },

    ["huntingshop"] = {
        ["label"] = "Hunting Shop",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-679.86, 5838.83, 17.34)
        },
        ["ped"] = 'ig_hunter',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Hunting Shop",
        ["products"] = Config.Products["huntingshop"],
        ["showblip"] = false,
    
    },

    ["tuner"] = {
        ["label"] = "Tuner Shop",
        ["type"] = "item",
        ["coords"] = {
            [1] = vector3(148.36, -3050.99, 7.04)
        },
        ["products"] = Config.Products["tuner"],
        ["showblip"] = false,
        ["blipsprite"] = 402
    },


    ["coc"] = {
        ["label"] = "Pharmacy",
        ["type"] = "item",
        ["coords"] = {
            [1] = vector3(2885.22, 1519.04, 24.97)
        },
        ["ped"] = 'ig_hunter',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Hunting Shop",
        ["products"] = Config.Products["coc"],
        ["showblip"] = false,
    
    },
    ["beancoffee"] = {
        ["label"] = "Bean Machine Coffee",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-633.72, 236.15, 81.88)
        },
        ["products"] = Config.Products["coffeeplace"],
        ["showblip"] = true,
    },
    ["casino"] = {
        ["label"] = "Diamond Casino",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(948.3834, 34.21247, 71.839)
        },
        ["products"] = Config.Products["casino"],
        ["showblip"] = true,
    },
    ["ltdgasoline"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-48.44, -1757.86, 29.42),
            [2] = vector3(-47.23, -1756.58, 29.42)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(25.7, -1347.3, 29.49),
            [2] = vector3(25.7, -1344.99, 29.49)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor6"] = {
        ["label"] = "Casino Bar",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(936.1185, 28.61719, 71.833)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1222.77, -907.19, 12.32)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-707.41, -912.83, 19.21),
            [2] = vector3(-707.32, -914.65, 19.21)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor2"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1487.7, -378.53, 40.16)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["ltdgasoline3"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1820.33, 792.66, 138.1),
            [2] = vector3(-1821.55, 793.98, 138.1)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor3"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-2967.79, 391.64, 15.04)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket2"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-3038.71, 585.9, 7.9),
            [2] = vector3(-3041.04, 585.11, 7.9)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket3"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-3241.47, 1001.14, 12.83),
            [2] = vector3(-3243.98, 1001.35, 12.83)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket4"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1728.66, 6414.16, 35.03),
            [2] = vector3(1729.72, 6416.27, 35.03)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket5"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1697.99, 4924.4, 42.06),
            [2] = vector3(1699.44, 4923.47, 42.06)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket6"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1961.48, 3739.96, 32.34),
            [2] = vector3(1960.22, 3742.12, 32.34)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor4"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1165.28, 2709.4, 38.15)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket7"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(547.79, 2671.79, 42.15),
            [2] = vector3(548.1, 2669.38, 42.15)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket8"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(2679.25, 3280.12, 55.24),
            [2] = vector3(2677.13, 281.38, 55.24)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(2557.94, 382.05, 108.62),
            [2] = vector3(2555.53, 382.18, 108.62)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["delvecchioliquor"] = {
        ["label"] = "Del Vecchio Liquor",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-159.36, 6321.59, 31.58),
            [2] = vector3(-160.66, 6322.85, 31.58)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["donscountrystore"] = {
        ["label"] = "Don's Country Store",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(161.41, 6640.78, 31.69),
            [2] = vector3(163.04, 6642.45, 31.70)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["ltdgasoline4"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1163.7, -323.92, 69.2),
            [2] = vector3(1163.4, -322.24, 69.2)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor5"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1135.66, -982.76, 46.41)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket10"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(373.55, 325.56, 103.56),
            [2] = vector3(374.29, 327.9, 103.56)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["hardware"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(45.55, -1749.01, 29.6)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
    },
    ["hardware2"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(2747.8, 3472.86, 55.67)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
    },
    ["hardware3"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(-421.84, 6136.09, 31.78)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
    },   
    ["coffeeshop"] = {
        ["label"] = "Superfly",
        ["type"] = "item",
        ["coords"] = {
            [1] = vector3(-1172.43, -1572.24, 4.66)
        },
        ["products"] = Config.Products["coffeeshop"],
        ["showblip"] = true,
    },
    ["ammunation1"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-662.1, -935.3, 21.8)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation2"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(810.2, -2157.3, 29.6)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation3"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(1693.4, 3759.5, 34.7)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation4"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-330.2, 6083.8, 31.4)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation5"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(252.3, -50.0, 69.9)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation6"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(22.0, -1107.2, 29.8)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation7"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(2567.6, 294.3, 108.7)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation8"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-1117.5, 2698.6, 18.5)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation9"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(842.4, -1033.4, 28.1)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["seaword1"] = {
        ["label"] = "Sea Word",
        ["type"] = "sea",
        ["coords"] = {
            [1] = vector3(-1686.9, -1072.23, 13.15)
        },
        ["products"] = Config.Products["gearshop"],
        ["showblip"] = true,
    },
    ["leisureshop"] = {
        ["label"] = "Leisure Shop",
        ["type"] = "leisure",
        ["coords"] = {
            [1] = vector3(-1505.91, 1511.78, 115.29)
        },
        ["products"] = Config.Products["leisureshop"],
        ["showblip"] = true,
    },

    ["weed123"] = {
        ["label"] = "Stuff",
        ["type"] = "item",
        ["coords"] = {
            [1] = vector3(-1177.91, -1564.17, 4.49)
        },
        ["products"] = Config.Products["weed123"],
        ["showblip"] = true,
    },
    -- ["tunershop"] = {
    --     ["label"] = "Tuner Shop",
    --     ["type"] = "normal",
    --     ["coords"] = {
    --         [1] = vector3(148.36, -3050.99, 7.04)
    --     },
    --     ["products"] = Config.Products["mechanic"],
    --     ["showblip"] = false,
    --     ["blipsprite"] = 402
    -- },
}
