Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("ballasstash", vector3(123.26, -1975.2, 21.33), 1, 1.2, {
		name = "ballasstash",
		heading = 91,
		debugpoly = true,
		minZ=21.0,
		maxZ=24.6,
	}, {
		options = {
		    {
			event = "gang:stash",
			icon = "far fa-clipboard",
			label = "Gang Stash",
			gang = "ballas",
		    },
		},
		distance = 2.5
	})

    exports['qb-target']:AddBoxZone("familiesstash", vector3(-151.59, -1589.73, 35.03), 1, 1.2, {
		name = "familiesstash",
		heading = 91,
		debugpoly = true,
		minZ=21.0,
		maxZ=24.6,
	}, {
		options = {
		    {
			event = "gang:stash",
			icon = "far fa-clipboard",
			label = "Gang Stash",
			gang = "families",
		    },
		},
		distance = 2.5
	})

    exports['qb-target']:AddBoxZone("vagosstash", vector3(123.26, -1975.2, 21.33), 1, 1.2, {
		name = "vagosstash",
		heading = 91,
		debugpoly = true,
		minZ=21.0,
		maxZ=24.6,
	}, {
		options = {
		    {
			event = "gang:stash",
			icon = "far fa-clipboard",
			label = "Gang Stash",
			gang = "vagos",
		    },
		},
		distance = 2.5
	})

    exports['qb-target']:AddBoxZone("cartelstash", vector3(123.26, -1975.2, 21.33), 1, 1.2, {
		name = "cartelstash",
		heading = 91,
		debugpoly = true,
		minZ=21.0,
		maxZ=24.6,
	}, {
		options = {
		    {
			event = "gang:stash",
			icon = "far fa-clipboard",
			label = "Gang Stash",
			gang = "cartel",
		    },
		},
		distance = 2.5
	})



end)