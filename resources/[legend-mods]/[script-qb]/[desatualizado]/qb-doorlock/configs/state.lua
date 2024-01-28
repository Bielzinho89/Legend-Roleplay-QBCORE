

--  
table.insert(Config.DoorList, {
	objCoords = vector3(-566.0358, -200.2471, 38.34028),
	audioRemote = false,
	locked = true,
	doorID = 81,
	lockpick = false,
	garage = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['realestate']=0 },
	objHash = 110411286,
	maxDistance = 2.0,
	objHeading = 29.999996185303,
    --oldMethod = true,
    audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(-516.5076, -193.0843, 38.34237),
	authorizedJobs = { ['realestate']=0 },
	locked = true,
	garage = false,
	fixText = false,
	audioRemote = false,
	objHash = 110411286,
	maxDistance = 2.0,
	objHeading = 119.99998474121,
	doorID = 87,
	lockpick = false,
	slides = false,
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	doors = {
		{objHash = 605731446, objHeading = 119.99998474121, objCoords = vector3(-506.0826, -200.8349, 34.40414)},
		{objHash = 605731446, objHeading = 299.99996948242, objCoords = vector3(-507.1621, -198.9598, 34.40414)}
    },
	maxDistance = 2.5,
	locked = true,
	authorizedJobs = { ['realestate']=0, ['police']=0 },
	audioRemote = false,
	doorID = 88,
	lockpick = false,
	slides = false,
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
})