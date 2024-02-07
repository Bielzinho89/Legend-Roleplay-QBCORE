 local QBCore = exports['qb-core']:GetCoreObject()
 local model = vehicle
RegisterNUICallback("showroomPurchaseCurrentVehicle", function(data, cb)
  QBCore.Functions.TriggerCallback("showroom:purchaseVehicle", function(success, vehicle, plate)
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
    TakeOutVehicle(vehicle, plate)
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


local blips = {
  {title="Showroom", colour=0, id=227, scale=1.2 ,coords = vector3(-39.14788, -1101.456, 26.422355)},
  }

  Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
  end)


function TakeOutVehicle(vehicle, coords, plate)
      enginePercent = 100
      bodyPercent = 100
      currentFuel = 100
      model = vehicle
      coords = vector4(-45.60, -1080.9, 26.706, 70.0)
      local coords = vector4(-45.60, -1080.9, 26.706, 70.0)
      local plate = QBCore.Functions.GetPlate(vehicle)
        --QBCore.Functions.SpawnVehicle(vehicle, function(vehicle, plate)
        	SetEntityHeading(veh, coords.w)
        SetVehicleNumberPlateText(veh, plate)
       -- SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(vehicle))
      end

RegisterNetEvent('qb-npvehicleshop:client:buyShowroomVehicle', function(vehicle, plate)
        coords = vector4(-30.19, -1089.48, 26.42, 340.23)
        local coords = vector4(-30.19, -1089.48, 26.42, 340.23)
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



