Config = Config or {}

Config.Payment = math.random(4500, 6500)

Config.Police = 1 -- for when i add this

Config.marker = vector3(1208.6, -3114.88, 4.56)

Config.Delivery = vector3(1692.11, 3286.02, 40.48)

Config.Repair = vector3(1564.18, -2166.11, 76.56)

Config.CarSpawns = {
    [1] = {
        car = vector4(796.29, -2911.52, 5.24, 267.64),
        npc = {
            [1] = vector3(795.9, -2917.23, 5.88),
            [2] = vector3(795.36, -2905.78, 5.9),
            [3] = vector3(803.88, -2917.44, 5.9),
            [4] = vector3(806.44, -2906.5, 5.9),
            [5] = vector3(809.45, -2912.83, 5.9),
        }
    },
    [2] = {
        car = vector4(1165.01, -3344.41, 5.9, 10.98),
        npc = {
            [1] = vector3(1172.29, -3335.11, 5.81),
            [2] = vector3(1179.56, -3345.68, 5.88),
            [3] = vector3(1155.83, -3345.51, 5.9),
            [4] = vector3(1147.24, -3334.15, 5.95),
            [5] = vector3(1153.01, -3323.66, 5.93),
        }
    }
}

Config.Vehicles = {
    [1] = {model = "69charger", label ="69Charger"},
    [2] = {model = "675ltsp", label ="675"},
    [3] = {model = "deluxo6str", label ="Deluxo"},
}
