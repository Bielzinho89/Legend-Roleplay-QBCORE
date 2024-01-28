Config = Config or {}

Config.CompanyPrice = 25000

Config.Cityhall = {
    coords = vector3(-551.16, -191.79, 38.23)
}

-- THE ARRAY NAME MUST BE THE SAME AS THE JOB IN QB-CORE/SHARED/JOBS.LUA
Config.AvaiableJobs = {
    ["trucker"] = {
        title = "Trucker",
        salary = 100,
        description = "Rent a company van and distribute deliveries around town.",
        gpsCoords = vector3(145.69, -3201.53, 5.86),
    },
    ["taxi"] = {
        title = "Taxi",
        salary = 200,
        description = "Rent a taxi and take the passengers to the requested destination.",
        gpsCoords = vector3(909.49, -177.35, 74.22),
    },
    ["tow"] = {
        title = "Tow Truck",
        salary = 300,
        description = "Rents a Tow Truck and tows the wrongly parked or requested vehicles.",
        gpsCoords = vector3(489.92, -1331.89, 29.34),
    },
    ["garbage"] = {
        title = "Garbage Collector",
        salary = 500,
        description = "Rent a garbage truck and collect the garbage at the indicated points throughout the city.",
        gpsCoords = vector3(-313.84, -1522.83, 27.55),
    },
    ["bus"] = {
        title = "Bus Driver",
        salary = 600,
        description = "Rent a bus and transport passengers to various stops throughout the city.",
        gpsCoords = vector3(462.21, -641.15, 28.45),
    },
    ["vineyard"] = {
        title = "Vineyard",
        salary = 550,
        description = "Collect Grapes and make vines in the city.",
        gpsCoords = vector3(-1928.01, 2060.71, 140.84),
    },
    ["hotdog"] = {
        title = "Hotdog",
        salary = 450,
        description = "Make hotdogs and sell in the city.",
        gpsCoords = vector3(39.08, -1005.63, 29.48),
    },
    ["reporter"] = {
        title = "News Reporter",
        salary = 250,
        description = "News Reporter in the city.",
        gpsCoords = vector3(-598.86, -929.71, 23.86),
    },
    
}
