
isLoggedIn = true

local menuOpen = false
local wasOpen = false
local weedsSpawned = false
local QBCore = exports['qb-core']:GetCoreObject() 


local inzone = false

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)

        if not weedsSpawned then     
            CheckWeeds()
		else

			Citizen.Wait(1000)
		end
    end
end)





Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)

        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed, true)

        if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedField.coords, true) > 500 then
            inzone = false
        end
    end
end)

local spawnedWeeds = 0
local weedPlants = {}
local isPickingUp, isProcessing = false, false


RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    CheckCoords()
end)

function CheckCoords()
    Citizen.CreateThread(function()
        CheckWeeds()
    end)
end

function CheckWeeds()
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed, true)

    if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedField.coords, true) < 2000 then
        if not inzone then
			SpawnWeedPlants()
            weedsSpawned = true
            inzone = true
			Citizen.Wait(20 * 60000)
            weedsSpawned = false
        end
    end
end


-- --marijuana to joint
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerPed = GetPlayerPed(-1)
-- 		local coords = GetEntityCoords(playerPed, true)

-- 		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing.coords, true) < 1 then
-- 			DrawMarker(27, Config.CircleZones.WeedProcessing.coords.x, Config.CircleZones.WeedProcessing.coords.y, Config.CircleZones.WeedProcessing.coords.z - 0.66 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)

-- 			if not isProcessing then
-- 				--QBCore.Functions.Draw2DText('Press ~g~[ E ]~w~ to Process Cannabis')
-- 			end

-- 			if IsControlJustReleased(0, 38) and not isProcessing then
-- 				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
-- 					if result then
-- 						ProcessWeed()
-- 					else
-- 						QBCore.Functions.Notify('You dont have enough Cannabis', 'error')
-- 					end
-- 				end, 'cannabis')
-- 			end
-- 		else
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)


RegisterNetEvent('weed:onUse')
AddEventHandler('weed:onUse', function()
	local playerPed = GetPlayerPed(-1)
	local hasItem = false
	local plyData = QBCore.Functions.GetPlayerData()
	for k,v in pairs(plyData.items) do
		if v.name == "rolling_paper" then
		  hasItem = (v.amount >= 4)
		    if hasItem then
				if not IsPedInAnyVehicle(playerPed) then
					TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
				end
				QBCore.Functions.Progressbar("search_register", "Processing..", 15000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function()
				TriggerServerEvent('weed:tojoint') -- Done
					ClearPedTasks(PlayerPedId())
				end, function()
					ClearPedTasks(PlayerPedId())
				end) -- Cancel
			end
		end
	end
	if not hasItem then
		QBCore.Functions.Notify('You dont have enough Rolling Paper', 'error')
	end
end)

RegisterNetEvent('cana:onUse')
AddEventHandler('cana:onUse', function()
	local playerPed = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(playerPed) then

		TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	end

	QBCore.Functions.Progressbar("search_register", "Processing..", 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	 TriggerServerEvent('cana:tojoint') -- Done
		ClearPedTasks(PlayerPedId())
	end, function()
		ClearPedTasks(PlayerPedId())
	end) -- Cancel
end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerPed = GetPlayerPed(-1)
-- 		local coords = GetEntityCoords(playerPed, true)

-- 		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing2.coords, true) < 1 then
-- 			DrawMarker(27, Config.CircleZones.WeedProcessing2.coords.x, Config.CircleZones.WeedProcessing2.coords.y, Config.CircleZones.WeedProcessing2.coords.z - 0.66 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)

-- 			if not isProcessing then
-- 				--QBCore.Functions.Draw2DText('Press ~g~[ E ]~w~ to Process Cannabis')
-- 			end

-- 			if IsControlJustReleased(0, 38) and not isProcessing then
-- 				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
-- 					if result then
-- 						ProcessWeed()
-- 					else
-- 						QBCore.Functions.Notify('You dont have enough Cannabis', 'error')
-- 					end
-- 				end, 'cannabis')
-- 			end
-- 		else
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerPed = GetPlayerPed(-1)
-- 		local coords = GetEntityCoords(playerPed, true)

-- 		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing3.coords, true) < 1 then
-- 			DrawMarker(27, Config.CircleZones.WeedProcessing3.coords.x, Config.CircleZones.WeedProcessing3.coords.y, Config.CircleZones.WeedProcessing3.coords.z - 0.66 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)

-- 			if not isProcessing then
-- 				--QBCore.Functions.Draw2DText('Press ~g~[ E ]~w~ to Process Cannabis')
-- 			end

-- 			if IsControlJustReleased(0, 38) and not isProcessing then
-- 				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
-- 					if result then
-- 						ProcessWeed()
-- 					else
-- 						QBCore.Functions.Notify('You dont have enough Cannabis', 'error')
-- 					end
-- 				end, 'cannabis')
-- 			end
-- 		else
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)



function ProcessWeed()  --joint process
	isProcessing = true
	local playerPed = GetPlayerPed(-1)
	--
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)

	QBCore.Functions.Progressbar("search_register", "Processing..", 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	 TriggerServerEvent('os_drugs:processCannabis') -- Done

		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Citizen.Wait(1000)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				TriggerServerEvent('os_drugs:cancelProcessing')
				break
			end
		end
		ClearPedTasks(PlayerPedId())
	end, function()
		ClearPedTasks(PlayerPedId())
	end) -- Cancel
		
	
	isProcessing = false
end

function ProcessWeedmarijuana() --marijuana process
	isProcessing = true
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(playerPed, true)
	--TriggerServerEvent('os_drugs:processCannabisxD')
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)

	QBCore.Functions.Progressbar("search_register", "Processing..", 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	 TriggerServerEvent('os_drugs:processCannabisxD') -- Done

		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Citizen.Wait(1000)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				TriggerServerEvent('os_drugs:cancelProcessing')
				break
			end
		end
		ClearPedTasks(PlayerPedId())
	end, function()
		ClearPedTasks(PlayerPedId())
	end) -- Cancel
		
	
	isProcessing = false
end



RegisterNetEvent('weee:pick')
AddEventHandler('weee:pick', function()
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(playerPed, true)
	local nearbyObject, nearbyID
		
		
	for i=1, #weedPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(weedPlants[i]), false) < 1 then
 			nearbyObject, nearbyID = weedPlants[i], i
	 		end
		end

	

	-- 		if not isPickingUp then
	local dumpPos = GetEntityCoords(nearbyObject)
    --               
	-- 		end
	
		isPickingUp = true
		TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
		TriggerEvent("Workingonotheranim", true)
		QBCore.Functions.Progressbar("search_register", "Picking up Cannabis..", 7500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ClearPedTasks(PlayerPedId())
			print("dlt")
			DeleteObject(nearbyObject)

			table.remove(weedPlants, nearbyID)
			spawnedWeeds = spawnedWeeds - 1
			TriggerEvent("Workingonotheranim", false)
			TriggerServerEvent('os_drugs:pickedUpCannabis')
		end, function()
			TriggerEvent("Workingonotheranim", false)
			ClearPedTasks(PlayerPedId())
		end) -- Cancel

		isPickingUp = false
	
	
	
end)


-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)

-- 		local playerPed = GetPlayerPed(-1)
-- 		local coords = GetEntityCoords(playerPed, true)
-- 		local nearbyObject, nearbyID
		
		
-- 		for i=1, #weedPlants, 1 do
-- 			if GetDistanceBetweenCoords(coords, GetEntityCoords(weedPlants[i]), false) < 1 then
-- 				nearbyObject, nearbyID = weedPlants[i], i
-- 			end
-- 		end

-- 		if nearbyObject and IsPedOnFoot(playerPed) then

-- 			if not isPickingUp then
-- 					local dumpPos = GetEntityCoords(nearbyObject)
--                     DrawText3Ds(dumpPos.x, dumpPos.y, dumpPos.z + 1.0, 'Press [~g~E~w~] pick up cannabis')
-- 			end

-- 			if IsControlJustReleased(0, 38) and not isPickingUp then
-- 				isPickingUp = true
-- 				TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
-- 				TriggerEvent("Workingonotheranim", true)
-- 				QBCore.Functions.Progressbar("search_register", "Picking up Cannabis..", 7500, false, true, {
-- 					disableMovement = true,
-- 					disableCarMovement = true,
-- 					disableMouse = false,
-- 					disableCombat = true,
-- 				}, {}, {}, {}, function() -- Done
-- 					ClearPedTasks(PlayerPedId())
					
-- 					DeleteObject(nearbyObject)

-- 					table.remove(weedPlants, nearbyID)
-- 					spawnedWeeds = spawnedWeeds - 1
-- 					TriggerEvent("Workingonotheranim", false)
-- 					TriggerServerEvent('os_drugs:pickedUpCannabis')
-- 				end, function()
-- 					TriggerEvent("Workingonotheranim", false)
-- 					ClearPedTasks(PlayerPedId())
					
-- 				end) -- Cancel

-- 				isPickingUp = false
-- 			end
-- 		else
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)





function DrawText3Ds(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 460
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.3, 0.3)
	SetTextFont(6)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 160)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	DrawRect(_x,_y + 0.0115, 0.02 + factor, 0.027, 28, 28, 28, 95)
end


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(weedPlants) do
			DeleteObject(v)
		end
	end
end)

local weeddone = false

function SpawnWeedPlants()
	while spawnedWeeds < 40 do
		Citizen.Wait(0)
		local weedCoords = GenerateWeedCoords()
		obj = CreateObject(GetHashKey('prop_weed_02'), weedCoords, false, false, false)
		PlaceObjectOnGroundProperly(obj)
		Citizen.Wait(100)
		FreezeEntityPosition(obj, true)
		table.insert(weedPlants, obj)
		spawnedWeeds = spawnedWeeds + 1
		weeddone = true
	end
end

function ValidateWeedCoord(plantCoord)
	if spawnedWeeds > 0 then
		local validate = true

		for k, v in pairs(weedPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.WeedField.coords, false) > 500 then
			validate = false
		end

		return validate
	else
		return true
	end
end



local rnd = 0


function GenerateWeedCoords()
	while true do
		Citizen.Wait(1)
		rnd = math.random(1,232)
		
		local weedc = vector3(Config.WeddLocation[rnd]["x"],Config.WeddLocation[rnd]["y"],Config.WeddLocation[rnd]["z"]-0.50)
		-- local weedCoordX, weedCoordY

		-- math.randomseed(GetGameTimer())
		-- local modX = math.random(-90, 90)

		-- Citizen.Wait(100)

		-- math.randomseed(GetGameTimer())
		-- local modY = math.random(-90, 90)

		-- weedCoordX = Config.CircleZones.WeedField.coords.x + modX
		-- weedCoordY = Config.CircleZones.WeedField.coords.y + modY

		-- local coordZ = GetCoordZ(weedCoordX, weedCoordY)
		-- local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateWeedCoord(weedc) then
			return weedc
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end
