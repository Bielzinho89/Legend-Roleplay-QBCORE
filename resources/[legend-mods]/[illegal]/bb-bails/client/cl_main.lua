local QBCore = exports['qb-core']:GetCoreObject()

local currentMachine = -1
local globalCoords = vector3(0,0,0)

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		globalCoords = GetEntityCoords(PlayerPedId())

		local displayed = false
		for k,v in pairs(CONFIG['Machines']) do
			if k == currentMachine and not v.available then
				if v.finished then
					DrawText3Ds(v.vec.x, v.vec.y, v.vec.z, '[E] Unload bills')
					if IsControlJustPressed(0,38) then
						TriggerServerEvent('cr-bails:collect', k)
						currentMachine = -1
					end
				else
					DrawText3Ds(v.vec.x, v.vec.y, v.vec.z, 'Washing Bills...')
				end
			else
				if not displayed and #(v.vec - globalCoords) < 1.0 then
					if v.available then
						DrawText3Ds(v.vec.x, v.vec.y, v.vec.z, '[E] Load ($'..v.cost..')')
						if IsControlJustPressed(0, 38) then
							TriggerServerEvent('cr-bails:load', k)
							currentMachine = k
						end
					else
						DrawText3Ds(v.vec.x, v.vec.y, v.vec.z, 'Machine is occupied...')
					end
					displayed = true -- display one at a time for launder close to eachother
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		for k,v in pairs(CONFIG['Machines']) do
			if v.available == false then
				if #(v.vec - globalCoords) < 8.0 then
					if v.lastsound + math.random(15000, 25000) < GetGameTimer() then
						-- play sound
						if v.finished then
							-- play launder ready
							TriggerEvent('InteractSound_CL:PlayOnOne', 'washingmachinedone', 1.0)
						else
							-- play launder not ready
							TriggerEvent('InteractSound_CL:PlayOnOne', 'washingmachine', 0.1)
						end
						CONFIG['Machines'][k]['lastsound'] = GetGameTimer()
					end
				end
			end
		end
	end
end)

RegisterNetEvent('cr-bails:state', function(machine, occupied, finished)
	CONFIG['Machines'][machine]['available'] = occupied
	CONFIG['Machines'][machine]['finished'] = finished
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