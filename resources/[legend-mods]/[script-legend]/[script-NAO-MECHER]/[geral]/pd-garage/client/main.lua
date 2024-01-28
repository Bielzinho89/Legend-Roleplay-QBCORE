local QBCore = exports['qb-core']:GetCoreObject() 
local PlayerData = {}
local pedspawned = false


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     PlayerJob = job
end)



RegisterCommand('clear', function(source, args)
    TriggerEvent('chat:clear')
end, false)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.Pedlocation) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cords - pos)
			
			if dist < 40 and pedspawned == false then
				TriggerEvent('spawn:ped',v.Cords,v.h)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('spawn:ped')
AddEventHandler('spawn:ped',function(coords,heading)
	local hash = GetHashKey('ig_trafficwarden')
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawned = true
	npc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	while not TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('dox:garage')
AddEventHandler('dox:garage', function(pd)
    local vehicle = pd.vehicle
    local coords = { ['x'] = 435.51, ['y'] = -975.91, ['z'] = 25.7, ['h'] = 89.04}
    
    

    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            if vehicle == 'npolchar' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)            
            elseif  vehicle == 'npolexp' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)

            elseif vehicle ==  'npolblazer' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'npolvic' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'npolvette' then 
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            -- elseif vehicle == 'npolcoach' then
            --     QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            --         SetVehicleNumberPlateText(veh, "PD"..tostring(math.random(1000, 9999)))
            --         exports['bb-fuel']:SetFuel(veh, 100.0)
            --         SetEntityHeading(veh, coords.h)
            --         TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            --         TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            --         SetVehicleEngineOn(veh, true, true)
            --     end, coords, true)
            elseif vehicle == 'npolstang' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'bcat' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'npolblazer' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'npolchal' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not a cop.', 'error')
            
        end
    end)    
end)

RegisterNetEvent('dox:storecar')
AddEventHandler('dox:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)



RegisterNetEvent('garage:menu', function()
    exports['qb-menu']:openMenu( {
        {
            id = 1,
            header = "Police Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Charger",
            txt = "Police Charger",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolchar',
                    
                }
            }
        },
        {
            id = 3,
            header = "Ford Explorer",
            txt = "police ford explorer",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolexp',
                    
                }
            }
        },
        {
            id = 4,
            header = "Blazer",
            txt = "LSPD Nagasaki Blazer",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolblazer',
                    
                }
            }
        },
       
        {
            id = 5,
            header = "Victoria",
            txt = "Ford Crown Victoria",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolvic',
                    
                }
            }
        },
        {
            id = 6,
            header = "Police Corvet",
            txt = "Police Corvet",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolvette',
                    
                }
            }
        },
        {
            id = 7,
            header = "Challanger",
            txt = "Police Challanger",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolchal',
                    
                }
            }
        },
        {
            id = 8,
            header = "Mustang",
            txt = "Police Mustang",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolstang',
                    
                }
            }
        },
        -- {
        --     id = 9,
        --     header = "Coach",
        --     txt = "Police Coach",
        --     params = {
        --         event = "dox:garage",
        --         args = {
        --             vehicle = 'npolcoach',
                    
        --         }
        --     }
        -- },
        {
            id = 9,
            header = "BCAT",
            txt = "Vapid",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'bcat',
                    
                }
            }
        },
        {
            id = 10,
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "dox:storecar",
                args = {
                    
                }
            }
        },
        
    })
end)

--- EMS Garage

RegisterNetEvent('ambulance:garage')
AddEventHandler('ambulance:garage', function(pd)
    local vehicle = pd.vehicle
    local coords = { ['x'] = 317.57, ['y'] = -578.52, ['z'] = 28.8, ['h'] = 250.01}
    

    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "ambulance" then
            if vehicle == 'ambulance' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)            
            elseif  vehicle == 'dodgeEMS' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif  vehicle == 'emsnspeedo' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif  vehicle == 'emsv' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['bb-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not an EMS', 'error')
            
        end
    end)    
end)

RegisterNetEvent('dox:storecar')
AddEventHandler('dox:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)



RegisterNetEvent('garage:ambulance', function()
    exports['qb-menu']:openMenu( {
        {
            id = 1,
            header = "Ambulance Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Ambulance",
            txt = "EMS Ambulance",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'ambulance',
                    
                }
            }
        },
        {
            id = 3,
            header = "Ambulance",
            txt = "EMS Chager",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'dodgeEMS',
                    
                }
            }
        },
        {
            id = 4,
            header = "Speedo",
            txt = "EMS Speedo Ambulance",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'emsnspeedo',
                    
                }
            }
        },
        {
            id = 5,
            header = "Coroner Vapid",
            txt = "EMS Vapid Ambulance",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'emsv',
                    
                }
            }
        },
        {
            id = 9,
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "dox:storecar",
                args = {
                    
                }
            }
        },
        
    })
end)


