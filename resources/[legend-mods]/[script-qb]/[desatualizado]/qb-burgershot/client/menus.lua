
local QBCore = exports['qb-core']:GetCoreObject() 

-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("BurgerShotDuty", vector3(-1190.23, -902.59, 13.98), 1.6, 0.2, {
		name = "BurgerShotDuty",
		heading = 34,
		debugPoly = false,
		minZ=13.83,
		maxZ=15.08,
	}, {
		options = {
		    {  
			event = "qb-burgershot:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "burgershot",
		    },
		},
		distance = 2.0
	})

		exports['qb-target']:AddBoxZone("burger_tray_1", vector3(-1195.94, -891.35, 13.98), 0.55, 0.4, {
			name = "burger_tray_1",
			heading = 35.0,
			debugPoly = false,
			minZ=13.8,
			maxZ=14.3,
		}, {
			options = {
			    {
				event = "qb-burgershot:Tray1",
				icon = "far fa-clipboard",
				label = "Tray 1",
			    },
			},
			distance = 3.5
		})

	exports['qb-target']:AddBoxZone("burger_tray_2", vector3(-1194.77, -893.11, 13.98), 0.6, 0.4, {
		name="burger_tray_2",
		heading=35,
		debugPoly=false,
		minZ=13.98,
		maxZ=14.38,
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray4",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 3.5
	})

--[[ 	exports['qb-target']:AddBoxZone("burger_tray_3", vector3(-1193.88, -906.98, 14.0), 1, 1, {
		name="burger_tray_3",
		heading=350,
		debugPoly=false,
		minZ=13.2,
		maxZ=14.2,
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 3.5
	}) ]]


	exports['qb-target']:AddBoxZone("burgershotcooker", vector3(-1200.14, -899.97, 13.98), 1.8, 1.0, {
		name="burgershotcooker",
		heading=34,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.4,
	}, {
		options = {
			{
				event = "qb-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station",
				job = "burgershot",
			},
		},
		distance = 3.5
	})

	exports['qb-target']:AddBoxZone("burgershotcooker2 ", vector3(-1202.22, -896.81, 13.98), 1.7, 1, {
		name="burgershotcooker2 ",
		heading=34,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.3,
	}, {
		options = {
			{
				event = "qb-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station 2",
				job = "burgershot",
			},
		},
		distance = 3.5
	})

		exports['qb-target']:AddBoxZone("burgershotfryer", vector3(-1201.75, -898.95, 14.09), 2.5, 1.5, {
		name="burgershotfryer",
		heading=35,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.4,
		}, {
		    options = {
			{
			    event = "qb-burgershot:Fries",
			    icon = "fas fa-box",
			    label = "Make Fries",
			    job = "burgershot",
			},
		    },
		    distance = 3.5
		})


	exports['qb-target']:AddBoxZone("burgershotdrinks", vector3(-1199.54, -895.52, 14.0), 2.2, 0.6, {
	    name="burgershotdrinks",
	    heading=34,
	    debugPoly=false,
	    minZ=13.8,
	    maxZ=14.8,
	    }, {
		options = {
		    {
			event = "nh-context:DrinkMenu",
			icon = "fas fa-filter",
			label = "Make Some Drinks",
			job = "burgershot",
		    },
		},
		distance = 3.5
	    })

        exports['qb-target']:AddBoxZone("burgershotdrinks2", vector3(-1190.03, -905.46, 13.99), 1.15, 0.7, {
            name="burgershotdrinks2",
            heading=33,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.8,
            }, {
                options = {
                    {
                        event = "nh-context:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = "burgershot",
                    },
                },
                distance = 3.5
            })


         exports['qb-target']:AddBoxZone("burgerfridge", vector3(-1196.6, -901.97, 13.98), 0.6, 1.6, {
            name="burgerfridge",
            heading=34,
            debugPoly=false,
            minZ=12.98,
            maxZ=15.18,
        }, {
                options = {
                    {
                        event = "nh-context:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("burgershotdisplay", vector3(-1197.78, -894.45, 14.0), 4.6, 1.2, {
            name="burgershotdisplay",
            heading=34,
            debugPoly=false,
            minZ=13.0,
            maxZ=14.8,
        }, {
                options = {
                    {
                        event = "qb-burgershot:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("craftburger", vector3(-1199.49, -897.71, 13.98), 1.6, 0.6, {
            name="craftburger",
            heading=34,
            debugPoly=false,
            minZ=10.13,
            maxZ=14.13,
        }, {
                options = {
                    {
                        event = "nh-context:Burgers",
                        icon = "fas fa-burger-soda",
                        label = "Burger Work Station",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("BurgerShot_register_1", vector3(-1196.45, -890.9, 13.98), 0.4, 0.6, {
            name="BurgerShot_register_1",
            heading=35,
            debugPoly=false,
            minZ=13.78,
            maxZ=14.28,
        }, {
                options = {
                    {
                        event = "qb-burgershot:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("BurgerShot_register_2", vector3(-1195.45, -892.46, 13.98), 0.4, 0.6, {
            name="BurgerShot_register_2",
            debugPoly=false,
            heading=35,
            minZ=13.73,
            maxZ=14.33,
            }, {
                    options = {
                        {
                            event = "qb-burgershot:bill",
                            parms = "2",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = "burgershot",
                        },
                    },
                    distance = 1.5
                })  


        exports['qb-target']:AddBoxZone("BurgerShot_register_3", vector3(-1194.42, -893.99, 13.98), 0.6, 0.6, {
            name="BurgerShot_register_3",
            debugPoly=false,
            heading=35,
            minZ=13.73,
            maxZ=14.33,
                    }, {
                            options = {
                                {
                                    event = "qb-burgershot:bill",
                                    parms = "3",
                                    icon = "fas fa-credit-card",
                                    label = "Charge Customer",
                                    job = "burgershot",
                                },
                            },
                            distance = 1.5
                        })  




        exports['qb-target']:AddBoxZone("BurgerShot_register_4", vector3(-1192.52, -906.65, 14.0), 0.5, 0.5, {
            name="BurgerShot_register_4",
            heading=0,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.2,
                }, {
                        options = {
                            {
                                event = "qb-burgershot:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "burgershot",
                            },
                        },
                        distance = 1.5
            })

end)


-- NH - Context --

RegisterNetEvent('nh-context:Burgers', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Available Burgers |",
            txt = "",
        },
        {
            id = 1,
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MoneyShot"
            }
        },
        {
            id = 2,
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MeatFree"
            }
        },
        {
            id = 3,
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:BleederBurger"
            }
        },
        {
            id = 4,
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:HeartStopper"
            }
        },
        {
            id = 5,
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "qb-burgershot:Torpedo"
            }
        },
        {
            id = 6,
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-burgershot:CreateMurderMeal"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Fridge |",
            txt = "",
        },
        {
            id = 1,
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-burgershot:shop"
            }
        },
        {
            id = 2,
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-burgershot:Storage2"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

RegisterNetEvent('nh-context:DrinkMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Drink Menu |",
            txt = "",
        },
        {
            id = 1,
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "qb-burgershot:SoftDrink"
            }
        },
        {
            id = 2,
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "qb-burgershot:mShake"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt", 
        rows = {
            {
                id = 0, 
                txt = "Server ID"
            },
            {
                id = 1, 
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then return end
        TriggerServerEvent("qb-burgershot:bill:player", bill[1].input, bill[2].input)
    end
end)


