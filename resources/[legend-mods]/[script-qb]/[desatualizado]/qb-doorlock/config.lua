Config = {}

Config.ShowUnlockedText = true

Config.LockedColor = 'rgb(219 58 58)'
Config.UnlockedColor = 'rgb(50,205,50)' -- Old Color if you want it 'rgb(19, 28, 74)'

Config.AdminAccess = {
	enabled = true,
	permission = 'god'
}
Config.CommandPermission = 'god'

Config.Debug = false

Config.DoorList = {
	{
		textCoords = vector3(-631.04, -237.31, 38.07),
		authorizedJobs = {},
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 1425919976,
				objCoords  = vector3(-631.24, -236.50, 38.05)
			},
	
			{
				objName = 9467943,
				objCoords  = vector3(-630.50, -237.78, 38.09)
			}
		}
	},
}

-- burgershot by BlackBeard09
table.insert(Config.DoorList, {
	authorizedJobs = { ['burgershot']=0 },
	garage = false,
	maxDistance = 2.0,
	objCoords = vec3(-1194.993408, -898.287659, 14.260297),
	slides = false,
	doorID = 102,
	objHeading = 124.0,
	lockpick = false,
	locked = true,
	objHash = -1448591934,
	fixText = false,
	audioRemote = false,
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
})

-- burgershot staff created by BlackBeard09
table.insert(Config.DoorList, {
	authorizedJobs = { ['burgershot']=0 },
	garage = false,
	maxDistance = 2.0,
	objCoords = vec3(-1179.220947, -891.500488, 14.093996),
	slides = false,
	doorID = 103,
	objHeading = 124.0,
	lockpick = false,
	locked = true,
	objHash = -1300743830,
	fixText = false,
	audioRemote = false,
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
})
