local QBCore = exports['qb-core']:GetCoreObject() 

Citizen.CreateThread(function()
	exports['qb-target']:AddCircleZone("boost", vector3(472.15, -1310.76, 29.22), 1.5, {
        name="boost",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
            {
                type = "client",
                event = "bropixel-boosting:client:UseComputer",
                icon = "fas fa-newspaper",
                label = "Use Computer",
                
                
            },
            {
                type = "client",
                event = "bropixel-boosting:client:2ndUseComputer",
                icon = "fas fa-newspaper",
                label = "Clear Data",
                
                
            },
            
        },
        distance = 1.5
    })
end)

Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        for shop, _ in pairs(Config.Locations) do
            local position = Config.Locations[shop]["coords"]
            for _, loc in pairs(position) do
                local dist = #(PlayerPos - vector3(loc["x"], loc["y"], loc["z"]))
                if dist <= 500.0 then
                    if not DoesEntityExist(dealer) then
                        RequestModel('u_m_m_partytarget')
                        while not HasModelLoaded('u_m_m_partytarget') do
                            Wait(10)
                        end
                        dealer = CreatePed(26, 'u_m_m_partytarget', loc["x"], loc["y"], loc["z"] - 1 , loc["h"], false, false)
                        SetEntityHeading(dealer, loc["h"])
                        SetBlockingOfNonTemporaryEvents(dealer, true)
                        TaskStartScenarioInPlace(dealer, 'WORLD_HUMAN_SMOKING', 0, false)
                        FreezeEntityPosition(dealer, true)
	                    SetEntityInvincible(dealer, true)
                    end
                else
                    Citizen.Wait(1500)
                end
                if dist <= 10 then
                    InRange = true
                    if dist <= 2 then
                        DrawText3Ds(loc["x"], loc["y"], loc["z"], "[E]")
                        local hour = GetClockHours()
                        if IsControlJustPressed(0, 38) then
                            if hour > 21 or hour < 6 then
                                TriggerEvent('cr-blackmarket:hmenu')
                            else
                                QBCore.Functions.Notify("I'm not dealing with anyone at the moment, come back later", 'error')
                            end
                        end
                    end
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        
        Citizen.Wait(5)
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 68)
    ClearDrawOrigin()
end

RegisterNetEvent('cr-blackmarket:hmenu')
AddEventHandler('cr-blackmarket:hmenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Black Market",
            txt = "",
        },
		{
			id = 2,
            header = "Buy Items (Cash)", 
            txt = "",
			params = {
                event = "cr-blackmarket:mbuy",
            }
        },
		{
			id = 3,
            header = "Sell Items (Cash)", 
            txt = "",
			params = {
                event = "cr-blackmarket:sbuy",
            }
        },
		
        {
			id = 4,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
end)

RegisterNetEvent('cr-blackmarket:mbuy')
AddEventHandler('cr-blackmarket:mbuy', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Black Market",
            txt = "",
        },
        {
			id = 2,
            header = "Laptop (Fleeca): $20,000",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 1
            }
        },
        {
			id = 3,
            header = "Thermite: $1,000",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 2
            }
        },
        {
			id = 4,
            header = "Thermite Charge: $2,000",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 3
            }
        },
        {
			id = 5,
            header = "Adv Lock Pick: $1,500",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 4
            }
        },
        {
			id = 6,
            header = "Key to a Door (C): $350,000",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 5
            }
        },
        {
			id = 7,
            header = "Bobcat Card: $1,00,000",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 6
            }
        },
        {
			id = 8,
            header = "Towing Rope: $10,000",
			txt = "Purchase",
            params = {
                event = "market:client:BuyItems",
                args = 7
            }
        },
        {
			id = 9,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
end)

RegisterNetEvent('market:client:BuyItems')
AddEventHandler('market:client:BuyItems', function(args)
    local args = tonumber(args)
    if args == 1 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'heistlaptop3')
    elseif args == 2 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'thermite')
    elseif args == 3 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'thermitecharge')
    elseif args == 4 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'advancedlockpick')
    elseif args == 5 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'cokelabkey')
        QBCore.Functions.Notify("Check your phone for a new mail.", 'success')
        CocaineGPS()
    elseif args == 6 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'bobcatsecuritycard')
    elseif args == 7 then 
        TriggerServerEvent('cr-blackmarket:sbuyitems', 'towingrope')
    end
end)

RegisterNetEvent('cr-blackmarket:sbuy')
AddEventHandler('cr-blackmarket:sbuy', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Black Market",
            txt = "",
        },
        {
			id = 2,
            header = "Sell your shit",
			txt = "I'll buy lots of your illegal shit, show me what you got. (Cash Currency)",
			params = {
                event = "cr-blackmarket:sellitems",
            }
        },
        {
			id = 3,
            header = "Close", 
            txt = "",
			params = {
                event = "",
            }
        },
    })
end)

RegisterNetEvent("cr-blackmarket:sellitems")
AddEventHandler("cr-blackmarket:sellitems", function()
    TriggerServerEvent('cr-blackmarket:sellitemsv')
end)

function CocaineGPS()
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Black Market Dealer",
        subject = "Key",
        message = "Whats going on? The key you bought belongs to a Cocaine Lab, i pinged you the location, Check your GPS.",
        
    })
    SetNewWaypoint(911.46, -1274.52, 27.09)
end

-- 2nd Market
Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        for shop, _ in pairs(Config.Locations2) do
            local position = Config.Locations2[shop]["coords"]
            for _, loc in pairs(position) do
                local dist = #(PlayerPos - vector3(loc["x"], loc["y"], loc["z"]))
                if dist <= 500.0 then
                    if not DoesEntityExist(dealer) then
                        RequestModel('u_m_y_party_01')
                        while not HasModelLoaded('u_m_y_party_01') do
                            Wait(10)
                        end
                        dealer = CreatePed(26, 'u_m_y_party_01', loc["x"], loc["y"], loc["z"] - 1 , loc["h"], false, false)
                        SetEntityHeading(dealer, loc["h"])
                        SetBlockingOfNonTemporaryEvents(dealer, true)
                        TaskStartScenarioInPlace(dealer, 'WORLD_HUMAN_SMOKING', 0, false)
                        FreezeEntityPosition(dealer, true)
	                    SetEntityInvincible(dealer, true)
                    end
                else
                    Citizen.Wait(1500)
                end
                if dist <= 10 then
                    InRange = true
                    if dist <= 2 then
                        DrawText3Ds(loc["x"], loc["y"], loc["z"], "[E]")
                        local hour = GetClockHours()
                        if IsControlJustPressed(0, 38) then
                            if hour > 21 or hour < 6 then
                                TriggerEvent('cr-blackmarket2:hmenu')
                            else
                                QBCore.Functions.Notify("I'm not dealing with anyone at the moment, come back later", 'error')
                            end
                        end
                    end
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        
        Citizen.Wait(5)
    end
end)

RegisterNetEvent('cr-blackmarket2:hmenu')
AddEventHandler('cr-blackmarket2:hmenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Black Market",
            txt = "", 
        },
        {
			id = 2,
            header = "Buy Items (Cash)",
			txt = "",
			params = {
                event = "cr-blackmarket2:mbuy",
            }
        },
        {
			id = 3,
            header = "Sell Items (Cash)",
			txt = "",
			params = {
                event = "cr-blackmarket2:sbuy",
            }
        },
        {
			id = 4,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
end)

RegisterNetEvent('cr-blackmarket2:mbuy')
AddEventHandler('cr-blackmarket2:mbuy', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Black Market",
            txt = "",
        },
        {
			id = 2,
            header = "Chest Armor: $325",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 1
            }
        },
        {
			id = 3,
            header = "Hand Cuffs: $325",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 2
            }
        },
        {
			id = 4,
            header = "Key to a Door (M): $500,000",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 3
            }
        },
        {
			id = 5,
            header = "Pistol Suppressor: $300",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 4
            }
        },
        {
			id = 6,
            header = "Pistol Extended Clip: $500",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 5
            }
        },
        {
			id = 7,
            header = "SMG Flashlight: $250",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 6
            }
        },
        {
			id = 8,
            header = "SMG Scope: $1,000",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 7
            }
        },
        {
			id = 9,
            header = "Pistol Ammo x50: $15",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 8
            }
        },
        {	
			id = 10,
            header = "Sub Ammo x50: $35",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 9
            }
        },
        {
			id = 11,
            header = "Rifle Ammo x50: $50",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 10
            }
        },
        {
			id = 12,
            header = "Assualtrifle: $50",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 11
            }
        },
        {
			id = 13,
            header = "SMG: $50",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 12
            }
        },
        {
			id = 14,
            header = "Microsmg: $50",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 13
            }
        },
        {
			id = 15,
            header = "Pistol: $50",
			txt = "Purchase",
            params = {
                event = "market2:client:BuyItems",
                args = 14
            }
        },
        {
			id = 16,
            header = "Close", 
            txt = "",
            params = {
				event = "",
			}
        },
    })
end)

RegisterNetEvent('market2:client:BuyItems')
AddEventHandler('market2:client:BuyItems', function(args)
    local args = tonumber(args)

    if args == 1 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'armor')
    elseif args == 2 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'handcuffs')
    elseif args == 3 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'methlabkey')
        QBCore.Functions.Notify("Check your phone for a new mail.", 'success')
        MethGPS()
    elseif args == 4 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'pistol_suppressor')
    elseif args == 5 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'pistol_extendedclip')
    elseif args == 6 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'smg_flashlight')
    elseif args == 7 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'smg_scope')
    elseif args == 8 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'pistol_ammo')
    elseif args == 9 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'smg_ammo')
    elseif args == 10 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'rifle_ammo')
    elseif args == 11 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'weapon_assaultrifle')
    elseif args == 12 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'weapon_smg')
    elseif args == 13 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'weapon_microsmg')
    elseif args == 14 then 
        TriggerServerEvent('cr-blackmarket2:sbuyitems', 'weapon_pistol')
    end
end)

RegisterNetEvent('cr-blackmarket2:sbuy')
AddEventHandler('cr-blackmarket2:sbuy', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Black Market",
            txt = "",        
        },
        {
			id = 2,
            header = "Sell your shit",
			txt = "I'll buy lots of your illegal shit, show me what you got. (Cash Currency)",
			params = {
                event = 'cr-blackmarket2:sellitems'
            }
        },
        {
			id = 3,
            header = "Close",
			txt = "",
			params = {
                event = ''
            }
        },
    })
end)

RegisterNetEvent("cr-blackmarket2:sellitems")
AddEventHandler("cr-blackmarket2:sellitems", function()
    TriggerServerEvent('cr-blackmarket2:sellitemsv')
end)

function MethGPS()
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Black Market Dealer",
        subject = "Key",
        message = "Whats going on? The key you bought belongs to a Meth Lab, i pinged you the location, Check your GPS.",
    })
    SetNewWaypoint(945.74, -1138.31, 26.50)
end