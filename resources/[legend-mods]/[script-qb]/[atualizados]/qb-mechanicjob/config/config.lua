Config = {}
Config.RequireJob = true                       -- do you need a mech job to use parts?
Config.FuelResource = 'LegacyFuel'             -- supports any that has a GetFuel() and SetFuel() export

Config.PaintTime = 5                           -- how long it takes to paint a vehicle in seconds
Config.ColorFavorites = false                  -- add your own colors to the favorites menu (see bottom of const.lua)

Config.NitrousBoost = 1.8                      -- how much boost nitrous gives (want this above 1.0)
Config.NitrousUsage = 0.1                      -- how much nitrous is used per frame while holding key

Config.UseDistance = true                      -- enable/disable saving vehicle distance
Config.UseDistanceDamage = true                -- damage vehicle engine health based on vehicle distance
Config.UseWearableParts = true                 -- enable/disable wearable parts
Config.WearablePartsChance = 1                 -- chance of wearable parts being damaged while driving if enabled
Config.WearablePartsDamage = math.random(1, 2) -- how much wearable parts are damaged when damaged if enabled
Config.DamageThreshold = 25                    -- how worn a part needs to be or below to apply an effect if enabled
Config.WarningThreshold = 50                   -- how worn a part needs to be to show a warning color in toolbox if enabled

Config.MinimalMetersForDamage = {              -- unused if Config.UseDistanceDamage is false
    { min = 5000,  max = 10000, damage = 10 },
    { min = 15000, max = 20000, damage = 20 },
    { min = 25000, max = 30000, damage = 30 },
}

Config.WearableParts = { -- unused if Config.UseWearableParts is false (feel free to add/remove parts)
    radiator = { label = 'Radiator', maxValue = 100, repair = { steel = 2 } },
    axle = { label = 'Axle', maxValue = 100, repair = { aluminum = 2 } },
    brakes = { label = 'Brakes', maxValue = 100, repair = { copper = 2 } },
    clutch = { label = 'Clutch', maxValue = 100, repair = { copper = 2 } },
    fuel = { label = 'Fuel', maxValue = 100, repair = { plastic = 2 } },
}

Config.Shops = {
    mechanic = { -- Legend Custom
        managed = true,
        shopLabel = 'Legend Custom',
        showBlip = true,
        blipSprite = 446,
        blipColor = 57,
        blipCoords = vector3(874.43, -2096.4, 30.48),
        shop = vector3(916.36, -2105.72, 30.57),
        duty = vector3(876.19, -2101.04, 30.39),
        stash = vector3(-346.02, -130.68, 39.02),
        paint = vector3(884.58, -2097.12, 30.04),
        vehicles = {
            withdraw = vector3(865.89, -2136.31, 30.42),
            spawn = vector4(862.27, -2142.94, 29.79, 355.08),
            list = { 'flatbed', 'towtruck', 'minivan', 'blista' }
        },
        shopItems = {
            { name = 'veh_toolbox',       price = 5000, amount = 50 },
            { name = 'veh_armor',         price = 5000, amount = 50 },
            { name = 'veh_brakes',        price = 5000, amount = 50 },
            { name = 'veh_engine',        price = 5000, amount = 50 },
            { name = 'veh_suspension',    price = 5000, amount = 50 },
            { name = 'veh_transmission',  price = 5000, amount = 50 },
            { name = 'veh_turbo',         price = 5000, amount = 50 },
            { name = 'veh_interior',      price = 5000, amount = 50 },
            { name = 'veh_exterior',      price = 5000, amount = 50 },
            { name = 'veh_wheels',        price = 5000, amount = 50 },
            { name = 'veh_neons',         price = 5000, amount = 50 },
            { name = 'veh_xenons',        price = 5000, amount = 50 },
            { name = 'veh_tint',          price = 5000, amount = 50 },
            { name = 'veh_plates',        price = 5000, amount = 50 },
            { name = 'nitrous',           price = 5000, amount = 50 },
            { name = 'tunerlaptop',       price = 5000, amount = 50 },
            { name = 'repairkit',         price = 5000, amount = 50 },
            { name = 'advancedrepairkit', price = 5000, amount = 50 },
            { name = 'tirerepairkit',     price = 5000, amount = 50 },
        }
    },
}
