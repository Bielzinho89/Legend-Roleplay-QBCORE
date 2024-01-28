 local QBCore = exports['qb-core']:GetCoreObject()
 local model = vehicle
RegisterNUICallback("showroompurchase2CurrentVehicle2", function(data, cb)
  QBCore.Functions.TriggerCallback("showroom:purchase2Vehicle", function(success, vehicle, plate)
    local plate = QBCore.Functions.GetPlate(vehicle)
    --TriggerEvent("vehiclekeys:client:SetOwner", plate)
    print(success, vehicle)
	if success then
    DoScreenFadeOut(0)
    Wait(400)
    DoScreenFadeIn(1000)
    SetNuiFocus(false, false)
    ClearFocus()
    RenderScriptCams(false, false, 0, 1, 0)
    --DeleteEntity(vehicle)
    TakeOutVehicle2(vehicle, plate)
		cb({
			data = {},
			meta = {
				ok = true,
			}
		});
	else
    print("nomoney")
		TriggerEvent("DoLongHudText", "Not enough money!", 2);
	end;
  end, data.model, data.price, data.zoneName)
end);


function TakeOutVehicle2(vehicle, coords, plate)
      enginePercent = 100
      bodyPercent = 100
      currentFuel = 100
      model = vehicle
      coords = vector4(124.236, -3023.134, 7.0408906, 272.54327)
      local coords = vector4(124.236, -3023.134, 7.0408906, 272.54327)
      local plate = QBCore.Functions.GetPlate(vehicle)
        --QBCore.Functions.SpawnVehicle(vehicle, function(vehicle, plate)
        	SetEntityHeading(veh, coords.w)
        SetVehicleNumberPlateText(veh, plate)
       -- SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(vehicle))
      end

RegisterNetEvent('qb-npvehicleshop2:client:buyShowroomVehicle2', function(vehicle, plate)
        coords = vector4(124.236, -3023.134, 7.0408906, 272.54327)
        local coords = vector4(124.236, -3023.134, 7.0408906, 272.54327)
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        	SetEntityHeading(veh, coords.w)
        SetVehicleNumberPlateText(veh, plate)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
            exports['bb-fuel']:SetFuel(veh, 100)
          --  SetVehicleNumberPlateText(veh, plate)
        --    SetEntityHeading(veh, coords.w)
           SetEntityAsMissionEntity(veh, true, true)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            TriggerEvent("vehiclekeys:client:SetOwner", plate)
            TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
        end, coords, true)
    end)


RegisterCommand("cord", function()
coords = GetEntityCoords(PlayerPedId())
head = GetEntityHeading(PlayerPedId())
print(coords, head)
end)



