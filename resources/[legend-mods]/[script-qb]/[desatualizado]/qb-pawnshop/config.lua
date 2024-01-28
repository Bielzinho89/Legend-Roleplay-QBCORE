Config = {}

Config.PawnLocation = vector3(412.34, 314.81, 103.13)
Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time
Config.SendMeltingEmail = true

Config.PawnItems = {
    [1] = {
        item = "goldchain",
        price = math.random(2500,5000)
    },
    [2] = {
        item = "diamond_ring",
        price = math.random(2500,5000)
    },
    [3] = {
        item = "rolex",
        price = math.random(2500,5000)
    },
    [4] = {
        item = "10kgoldchain",
        price = math.random(10000,25000)
    },
    [5] = {
        item = "tablet",
        price = math.random(1000,2500)
    },
    [6] = {
        item = "iphone",
        price = math.random(10000,25000)
    },
    [7] = {
        item = "samsungphone",
        price = math.random(10000,25000)
    },
    [8] = {
        item = "laptop",
        price = math.random(10000,25000)
    },
    [9] = {
        item = "tv",
        price = math.random(10000,25000)
    },
    [10] = {
        item = "art",
        price = math.random(10000,25000)
    },
    [11] = {
        item = "microwave",
        price = math.random(100,250)
    },
    [12] = {
        item = "telescope",
        price = math.random(50,100)
    },
    [13] = {
        item = "coffeemaker",
        price = math.random(50,100)
    }
    
}

Config.MeltingItems = { -- meltTime is amount of time in minutes per item
    [1] = {
        item = "goldchain",
        rewards = {
            [1] = {
                item = "goldbar",
                amount = 2
            }
        },
        meltTime = 0.15
    },
    [2] = {
        item = "diamond_ring",
        rewards = {
            [1] = {
                item = "diamond",
                amount = 1
            },
            [2] = {
                item = "goldbar",
                amount = 1
            }
        },
        meltTime = 0.15
    },
    [3] = {
        item = "rolex",
        rewards = {
            [1] = {
                item = "diamond",
                amount = 1
            },
            [2] = {
                item = "goldbar",
                amount = 1
            },
            [3] = {
                item = "electronickit",
                amount = 1
            }
        },
        meltTime = 0.15
    },
    [4] = {
        item = "10kgoldchain",
        rewards = {
            [1] = {
                item = "diamond",
                amount = 5
            },
            [2] = {
                item = "goldbar",
                amount = 1
            }
        },
        meltTime = 0.15
    },
}