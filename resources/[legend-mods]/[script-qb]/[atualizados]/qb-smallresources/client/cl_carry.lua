local isCarrying = false
local beingCarried = false
local kidnapped = false

RegisterCommand('carry', function()
	TriggerEvent('carry:Event')
end)


--[[RegisterCommand('carryped', function()
	TriggerEvent('carry:pedEvent')
end)]]--

RegisterNetEvent('carry:Event')
AddEventHandler('carry:Event', function(otherPlayer)
 loadAnim('missfinale_c2mcs_1')
 local t, distance = QBCore.Functions.GetClosestPlayer()
 if(distance ~= -1 and distance < 3 and not beingCarried and HasEntityClearLosToEntity( GetPlayerPed(t), PlayerPedId(), 17 ) and not IsPedInAnyVehicle(GetPlayerPed(t)) and not IsPedInAnyVehicle(PlayerPedId())) then
  if isCarrying then
   isCarrying = false
   TriggerServerEvent('undragTarget', GetPlayerServerId(t))
   ClearPedTasksImmediately(PlayerPedId())
  else
   isCarrying = true
   TriggerServerEvent('dragTarget', GetPlayerServerId(t))
   TaskPlayAnim(GetPlayerPed(PlayerId()), 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 1.0, 1.0, -1, 49, 0, 0, 0, 0)
  end
 end
end)

RegisterNetEvent('anims:doCarry')
AddEventHandler('anims:doCarry', function(otherPlayer)
 loadAnim('nm')
 if IsEntityAttachedToEntity(GetPlayerPed(PlayerId()), GetPlayerPed(GetPlayerFromServerId(otherPlayer))) then
  DetachEntity(GetPlayerPed(PlayerId()), GetPlayerPed(GetPlayerFromServerId(otherPlayer)), true)
  ClearPedTasksImmediately(GetPlayerPed(PlayerId()))
  beingCarried = false
  TriggerServerEvent("cr-carry:beingCarried", beingCarried)
 else
  AttachEntityToEntity(GetPlayerPed(PlayerId()), GetPlayerPed(GetPlayerFromServerId(otherPlayer)), GetPedBoneIndex(GetPlayerPed(PlayerId()), 40269), -0.1, 0.0, 0.1, 25.0, -290.0, -150.0, 1, 1, 0, 1, 0, 1)
  TaskPlayAnim(GetPlayerPed(PlayerId()), 'nm', 'firemans_carry', 8.0, -1, -1, 1, 1, 0, 0, 0)
  beingCarried = true
  TriggerServerEvent("cr-carry:beingCarried", beingCarried)
 end
end)

RegisterNetEvent('dragPlayer')
AddEventHandler('dragPlayer', function(closestID)
  local tPed = GetPlayerPed(GetPlayerFromServerId(closestID))
  local pP = PlayerPedId()
  loadAnim("amb@world_human_bum_slumped@male@laying_on_left_side@base")
  TaskPlayAnim(pP, "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
  AttachEntityToEntity(pP, tPed, GetPedBoneIndex(tPed, 0x8b93), 0.5, 0.0, 0.25, 0.0, 50.0, 20.0, true, true, false, true, 1, true)
  beingCarried = true
  TriggerServerEvent("cr-carry:beingCarried", beingCarried)
end)

RegisterNetEvent('undragPlayer')
AddEventHandler('undragPlayer', function(closestID)
 ClearPedTasksImmediately(PlayerPedId())
 beingCarried = false
 DetachEntity(PlayerPedId(), true, false)
 TriggerServerEvent("cr-carry:beingCarried", beingCarried)
end)

RegisterNetEvent('carry:pedEvent')
AddEventHandler('carry:pedEvent', function()
 loadAnim('nm')
 loadAnim('missfinale_c2mcs_1')
 local closestPed = getNPC()
 if closestPed then
  if IsEntityAttachedToEntity(closestPed, GetPlayerPed(PlayerId())) then
   DetachEntity(closestPed, GetPlayerPed(PlayerId()), true)
   ClearPedTasksImmediately(closestPed)
   ClearPedTasksImmediately(GetPlayerPed(PlayerId()))
  else
   local closestPed = getNPC()
   TaskPlayAnim(closestPed, 'nm', 'firemans_carry', 8.0, -1, -1, 1, 1, 0, 0, 0)
   AttachEntityToEntity(closestPed, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 40269), -0.1, 0.0, 0.1, 25.0, -290.0, -150.0, 1, 1, 0, 1, 0, 1)
   TaskPlayAnim(GetPlayerPed(PlayerId()), 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 1.0, -1, -1, 50, 0, 0, 0, 0)
  end
 end
end)

function getNPC()
 local playerCoords = GetEntityCoords(PlayerPedId())
 local handle, ped = FindFirstPed()
 local success
 local rped = nil
 local distanceFrom
 repeat
  local pos = GetEntityCoords(ped)
  local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
  if canPedBeUsed(ped) and distance < 3.0 and (distanceFrom == nil or distance < distanceFrom) then
   distanceFrom = distance
   rped = ped
   SetEntityAsMissionEntity(rped, true, true)
  end
  success, ped = FindNextPed(handle)
  until not success
  EndFindPed(handle)
 return rped
end

function canPedBeUsed(ped)
 if ped == nil then return false end
 if ped == PlayerPedId() then return false end
 if not DoesEntityExist(ped) then return false end
 if not IsPedOnFoot(ped) then return false end
 if IsEntityDead(ped) then return false end
 if not IsPedHuman(ped) then return false end
 return true
end

function loadAnim(anim)
 RequestAnimDict(anim)
 while not HasAnimDictLoaded(anim) do
  Citizen.Wait(1)
 end
end

-- Nearest Players
function GetClosestPlayer()
 local players = GetPlayers()
 local closestDistance = -1
 local closestPlayer = -1
 local ply = PlayerPedId()
 local plyCoords = GetEntityCoords(ply, 0)

 for index,value in ipairs(players) do
  local target = GetPlayerPed(value)
  if(target ~= ply) then
   local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
   local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
   if(closestDistance == -1 or closestDistance > distance) then
    closestPlayer = value
    closestDistance = distance
   end
  end
 end
  return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

-- Trunk
local isInTrunk = false

RegisterCommand('trunkgetin', function(source, args, rawCommand)
 local pos = GetEntityCoords(PlayerPedId(), false)
 local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
 if DoesEntityExist(vehicle) and GetVehicleDoorLockStatus(vehicle) == 1 and not kidnapped then
  if not isInTrunk then
   AttachEntityToEntity(PlayerPedId(), vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
   RaiseConvertibleRoof(vehicle, false)
   if IsEntityAttached(PlayerPedId()) then
    RequestAnimDict('timetable@floyd@cryingonbed@base')
    while not HasAnimDictLoaded('timetable@floyd@cryingonbed@base') do
     Citizen.Wait(1)
    end
    TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 1, 0, 0, 0, 0)
   end
  end
  isInTrunk = true
 end
end)

RegisterCommand('trunkgetout', function(source, args, rawCommand)
 local pos = GetEntityCoords(PlayerPedId(), false)
 local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
 if DoesEntityExist(vehicle) and GetVehicleDoorLockStatus(vehicle) == 1 and not kidnapped then
  if isInTrunk then
   DetachEntity(PlayerPedId(), 0, true)
   SetEntityVisible(PlayerPedId(), true)
   ClearPedTasksImmediately(PlayerPedId())
  end
  isInTrunk = false
 end
end)

RegisterNetEvent('toggleTrunk')
AddEventHandler('toggleTrunk', function(getIn)
 if getIn then
  ExecuteCommand('trunkgetin')
 else
  ExecuteCommand('trunkgetout')
 end
end)

RegisterCommand('trunkkidnap', function(source, args, rawCommand)
 local t, distance = GetClosestPlayer()
 if(distance ~= -1 and distance < 3) then
  if isCarrying then
   TriggerServerEvent('putIntoVehicle', GetPlayerServerId(t))
   ClearPedTasksImmediately(PlayerPedId())
  end
 end
end)

RegisterCommand('trunkeject', function(source, args, rawCommand)
 local t, distance = GetClosestPlayer()
 if(distance ~= -1 and distance < 3) then
  TriggerServerEvent('getOutTrunk', GetPlayerServerId(t))
 end
end)

Citizen.CreateThread(function()
 while true do
  Citizen.Wait(5)
  
  if isInTrunk then
   DisableControlAction(0, 327, true)
   DisableControlAction(0, 323, true)
   DisableControlAction(0, Keys['F2'], true)
   DisableControlAction(0, Keys['F5'], true)
   DisableControlAction(0, Keys['X'], true)
   DisableControlAction(2, Keys['Z'], true)
   DisableControlAction(0, Keys['F3'], true)
  end
  
  if beingCarried then
   DisableControlAction(0, 24, true)
   DisableControlAction(0, 257, true)
   DisableControlAction(0, 25, true)
   DisableControlAction(0, 263, true)
   DisableControlAction(0, 327, true)
   DisableControlAction(0, 323, true)
   DisableControlAction(0, Keys['F2'], true)
   DisableControlAction(0, Keys['F5'], true)
   DisableControlAction(0, Keys['F6'], true)
   DisableControlAction(0, Keys['F7'], true)
   DisableControlAction(0, Keys['F8'], true)
   DisableControlAction(0, Keys['F5'], true)
   DisableControlAction(0, Keys['F9'], true)
   DisableControlAction(0, Keys['X'], true)
   DisableControlAction(0, Keys['M'], true)
  end
  
  if isCarrying then
    EnableAllControlActions(0)
  end
 end
end)