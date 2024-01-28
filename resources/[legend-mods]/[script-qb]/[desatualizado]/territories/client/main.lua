local QBCore = exports['qb-core']:GetCoreObject() 

local mLibs         = exports["meta_libs"]
local Vector        = mLibs:Vector()
local Scenes        = mLibs:SynchronisedScene()
local sceneObjects  = {}
local SlingNextFrame = false
local MarketAccess   = false
local StopInfluence  = false
PlayerData = {}
local _print = print
local print = function(...)
  if Config.Debug then
    _print(...)
  end
end

vDist = function(v1,v2)  
  if not v1 or not v2 or not v1.x or not v2.x or not v1.z or not v2.z then return 0; end
  return math.sqrt( ((v1.x - v2.x)*(v1.x-v2.x)) + ((v1.y - v2.y)*(v1.y-v2.y)) + ((v1.z-v2.z)*(v1.z-v2.z)) ) 
end

-- RegisterCommand("drug", function(source, args, rawCommand)
--   if Config.StartEvent == "Thread" then
--     Citizen.CreateThread(Start)
--   else
--     AddEventHandler(Config.StartEvent,Start)
--   end
-- end, false)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
  PlayerJob = QBCore.Functions.GetPlayerData().job
  if Config.StartEvent == "Thread" then
    Citizen.CreateThread(Start)
  else
    AddEventHandler(Config.StartEvent,Start)
  end
end)


Citizen.CreateThread(function()
	Wait(500)
	if QBCore.Functions.GetPlayerData() ~= nil then
		PlayerJob = QBCore.Functions.GetPlayerData().job
		onDuty = true
	end
end)




Start = function()
  GetFramework()
  Wait(5000)
  TriggerServerEvent('Territories:PlayerLogin')
  Update()
end

TableCopy = function(tab)
  local r = {}
  for k,v in pairs(tab) do
    if type(v) == "table" then
      r[k] = TableCopy(v)
    else
      r[k] = v
    end
  end
  return r
end

Update = function()
  

  while true do
    local closest = GetClosestZone()
    local area = Territories[closest]
    local dead = DeathCheck(lastZone)
    
    if not dead then
      CheckLocation(closest)
    end
    Wait(0)
  end
end

local GetKeyUp = function(key) return IsControlJustReleased(0,key); end

CheckLocation = function(closest)

  local area   = Territories[closest]
  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(plyPed)
  local plyHp  = GetEntityHealth(plyPed)
  if closest then
    if area.openzone then
      if area.actions and area.actions.entry then 
        
        if vDist(plyPos,area.actions.entry.location) < Config.InteractDist  then

          QBCore.Functions.DrawText3D(area.actions.entry.location[1],area.actions.entry.location[2],area.actions.entry.location[3],area.actions.entry.helpText)
            if GetKeyUp(Config.InteractControl) then
              InsideInterior = area
              mLibs:TeleportPlayer(InsideInterior.actions.exit.location)
            end
        end
      end
    end

    if not InsideInterior then
      if vDist(plyPos,area.actions.exit.location) < Config.InteractDist then
        QBCore.Functions.DrawText3D(area.actions.exit.location.x,area.actions.exit.location.y,area.actions.exit.location.z,area.actions.exit.helpText)
      
        if GetKeyUp(Config.InteractControl) then
          InsideInterior = area
          mLibs:TeleportPlayer(InsideInterior.actions.entry.location)
        end
      end
    end
  else
    if not InsideInterior then
      local closestExit,exitDist
      for k,v in pairs(Territories) do
        local exit = v.actions.exit.location
        local dist = vDist(plyPos,exit)
        if not exitDist or dist < exitDist then
          closestExit = k
          exitDist = dist
        end
      end

      if exitDist and exitDist < Config.InteractDist then
        QBCore.Functions.DrawText3D(Territories[closestExit].actions.exit.location[1],Territories[closestExit].actions.exit.location[2],Territories[closestExit].actions.exit.location[3],Territories[closestExit].actions.exit.helpText)
        if GetKeyUp(Config.InteractControl) then
          mLibs:TeleportPlayer(Territories[closestExit].actions.entry.location)
          InsideInterior = nil          
        end
      end
    end
  end

  if InsideInterior then    
    local exitDist = vDist(plyPos,InsideInterior.actions.exit.location)  
    if exitDist and exitDist < Config.InteractDist then
      QBCore.Functions.DrawText3D(InsideInterior.actions.exit.location.x,InsideInterior.actions.exit.location.y,InsideInterior.actions.exit.location.z,InsideInterior.actions.exit.helpText)
      if GetKeyUp(Config.InteractControl) then
        mLibs:TeleportPlayer(InsideInterior.actions.entry.location)
        InsideInterior = nil          
      end
    else
      local closestAct,actDist = GetClosestAction(InsideInterior)
      if actDist < Config.InteractDist then
        QBCore.Functions.DrawText3D(InsideInterior.actions[closestAct].location.x,InsideInterior.actions[closestAct].location.y,InsideInterior.actions[closestAct].location.z,InsideInterior.actions[closestAct].helpText)
      
        if GetKeyUp(Config.InteractControl) then
          SceneHandler(InsideInterior.actions[closestAct])
        end
      end
    end
  end
end

local startTime


SceneHandler = function(action)
  function checkForItem2Defined()
    return (action.requireItem2 ~= undefined and action.requireItem2 ~= nil) and true or false
  end 
  local hasItem,itemLabel = not action.requireItem,''
  local hasItem2, itemLabel2 = false, false
  if checkForItem2Defined() then
    hasItem2, itemLabel2 = not action.requireItem2,''
  end 
  if action.requireItem and action.requireItem2 then
    local plyData = QBCore.Functions.GetPlayerData()
    for k,v in pairs(plyData.items) do
      if v.name == action.requireItem then
        itemLabel = v.label        
        hasItem = (v.amount >= action.requireRate)
      end
      if checkForItem2Defined() then
        if v.name == action.requireItem2 then
            itemLabel2 = v.label        
            hasItem2 = (v.amount >= action.requireRate2)
        end
      end
    end
  elseif action.requireCash then
    hasItem = false
    itemLabel = "Dirty Money"
    local plyData = QBCore.Functions.GetPlayerData()
    for k,v in pairs(plyData.accounts) do
      if v.name == "cash" then
        hasItem = (v.money and v.money >= action.requireCash)
      end
    end
  end

  if hasItem and (checkForItem2Defined() and hasItem2)  then
    QBCore.Functions.TriggerCallback('checkifbuzy', function(status)
      print(status)
      if status then
        QBCore.Functions.Notify("Someone is already Working Here", "error")
         return 
      end
      local plyPed = GetPlayerPed(-1)
      TriggerServerEvent('drugs:server:setstatus', true, action.id)
      local sceneType = action.act
      local doScene = action.scene
      local actPos = action.location - action.offset
      local actRot = action.rotation

      local animDict = SceneDicts[sceneType][doScene]
      local actItems = SceneItems[sceneType][doScene]
      local actAnims = SceneAnims[sceneType][doScene]
      local plyAnim = PlayerAnims[sceneType][doScene]

      while not HasAnimDictLoaded(animDict) do RequestAnimDict(animDict); Wait(0); end
      
      local count = 1
      local objectCount = 0
      for k,v in pairs(actItems) do
        local hash = GetHashKey(v)
        while not HasModelLoaded(hash) do RequestModel(hash); Wait(0); end
        sceneObjects[k] = CreateObject(hash,actPos,true)
        SetModelAsNoLongerNeeded(hash)
        objectCount = objectCount + 1
        while not DoesEntityExist(sceneObjects[k]) do Wait(0); end
        SetEntityCollision(sceneObjects[k],false,false)
      end

      local scenes = {}
      local sceneConfig = Scenes.SceneConfig(actPos,actRot,2,false,false,1.0,0,1.0)

      for i=1,math.max(1,math.ceil(objectCount/3)),1 do
        scenes[i] = Scenes.Create(sceneConfig)
      end

      local pedConfig = Scenes.PedConfig(plyPed,scenes[1],animDict,plyAnim)


      Scenes.AddPed(pedConfig)

      for k,animation in pairs(actAnims) do      
        local targetScene = scenes[math.ceil(count/3)]
        local entConfig = Scenes.EntityConfig(sceneObjects[k],targetScene,animDict,animation)
        Scenes.AddEntity(entConfig)
        count = count + 1
      end

      local extras = {}
      if action.extraProps then
        for k,v in pairs(action.extraProps) do
          RequestModel(GetHashKey(v.model))
			  repeat Wait(0) until HasModelLoaded(GetHashKey(v.model))
          local obj = CreateObject(GetHashKey(v.model), actPos + v.pos, true,true,true)
          while not DoesEntityExist(obj) do Wait(0); end
          SetEntityRotation(obj,v.rot)
          FreezeEntityPosition(obj,true)
          extras[#extras+1] = obj
        end
      end

      startTime = GetGameTimer()

      for i=1,#scenes,1 do
        Scenes.Start(scenes[i])
      end

    -- progBar:taskBar(action.time,action.progText)
    QBCore.Functions.Progressbar("hospital_revive", action.progText, action.time, false, true, {
      disableMovement = false,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
  }, {
      animDict = healAnimDict,
      anim = healAnim,
      flags = 16,
  }, {}, {}, function() -- Done
    for i=1,#scenes,1 do
      Scenes.Stop(scenes[i])
    end

    for k,v in pairs(extras) do
      DeleteObject(v)
    end

    RemoveAnimDict(animDict)
    TriggerServerEvent('Territories:RewardPlayer')
    TriggerServerEvent('drugs:server:setstatus', false, action.id)
    for k,v in pairs(sceneObjects) do NetworkFadeOutEntity(v,false,false); end
  end, function() -- Cancel
    for i=1,#scenes,1 do
      Scenes.Stop(scenes[i])
    end

    for k,v in pairs(extras) do
      DeleteObject(v)
    end

    RemoveAnimDict(animDict)
    TriggerServerEvent('drugs:server:setstatus', false, action.id)
    for k,v in pairs(sceneObjects) do NetworkFadeOutEntity(v,false,false); end
  end)

    end, action.id)
    else
      local str = _U["not_enough"]
      local label = (itemLabel:len() > 0 and itemLabel or 'UNKNOWN')
      local itemname
      local amount
      if not hasItem then
          itemname = QBCore.Shared.Items[action.requireItem:lower()]["label"]
          amount = (action.requireRate or (action.requireCash and "$"..action.requireCash or 'UNKNOWN'))
      end
      local itemname2
      local amount2
      if checkForItem2Defined() and not hasItem2 then
          itemname2 = QBCore.Shared.Items[action.requireItem2:lower()]["label"]
          amount2 = (action.requireRate2 or (action.requireCash and "$"..action.requireCash or 'UNKNOWN'))
      end
      --ShowNotification(string.format(str,i;temname,amount))
      local errorstring = ''
      if not hasItem then
          errorstring = errorstring .. itemname.. ": "..amount.." "
      end
      if checkForItem2Defined() and not hasItem2 then
        errorstring = errorstring ..(not hasItem and "and " or "").. itemname2.. ": "..amount2 
      end
      QBCore.Functions.Notify("You are deficit of following items and amount "..errorstring, "error")
    
    end
  
end

GetClosestAction = function(interior)
  local plyPos = GetEntityCoords(GetPlayerPed(-1))
  local closest,closestDist
  for k,v in pairs(interior.actions) do
    if k ~= "entry" and k ~= "exit" then
      local dist = vDist(plyPos,v.location)
      if not closestDist or dist < closestDist then
        closestDist = dist
        closest = k
      end
    end
  end
  return (closest or false),(closestDist or 9999)
end

DeathCheck = function(zone)
  local plyPed = GetPlayerPed(-1)
  local plyHp = GetEntityHealth(plyPed)
  local dead = IsPedFatallyInjured(plyPed)
  if isDead then
    if not dead then
      isDead = false
    end
  else
    if dead and zone then
      isDead = true
      local killer = NetworkGetEntityKillerOfPlayer(PlayerId())
      local killerId = GetPlayerByEntityID(killer)
      if killer ~= plyPed and killerId ~= nil and NetworkIsPlayerActive(killerId) then 
        local serverId = GetPlayerServerId(killerId)
        if serverId and serverId ~= -1 then
          TriggerServerEvent('Territories:GotMurdered',serverId,zone)
        end
      end
    end
  end
  return isDead
end

Switch = function(cond,...)
  local args = {...}
  local even = (#args%2 == 0)
  for i=1,#args-(even and 0 or 1),2 do
    if cond == args[i] then
      return args[i+1]((even and nil or args[#args]))
    end
  end
end



GetClosestZone = function()
  local closest
  local thisZone = GetNameOfZone(GetEntityCoords(GetPlayerPed(-1)))
  for k,v in pairs(Territories) do
    if v.zone == thisZone then
      closest = k
    end
  end
  return (closest or false)
end

Sync = function(tab)
  for k,v in pairs(tab) do
    Territories[k].influence = v.influence
    Territories[k].control = v.control
  end
end

GetPlayerByEntityID = function(id)
  for i=0,Config.MaxPlayerCount do
    if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
  end
  return nil
end


EnterHouse = function(...)
  if not Config.InfluenceInHouse then
    StopInfluence = true
  end
end

LeaveHouse = function(...)
  if not Config.InfluenceInHouse then
    lastZone = false
    StopInfluence = false
  end
end

StartRet = function(start,territories)
  ModStart = start
  Territories = territories
end



-- THINGS YOU MIGHT WANT TO CHANGE
GetFramework = function()
  while not QBCore do Wait(0) end
end

GetPlayerData = function()
  return QBCore.Functions.GetPlayerData()
end



Utils.event(1,Sync,'Territories:Sync')
Utils.event(1,StartRet,'Territories:StartRet')
Utils.event(1,GotMarketAccess,'Territories:GotMarketAccess')
Utils.event(1,LostMarketAccess,'Territories:LostMarketAccess')
Utils.event(1,EnterHouse,'playerhousing:Entered')
Utils.event(1,LeaveHouse,'playerhousing:Leave')




GetPeds = function(ignoreList)
	local ignoreList = ignoreList or {}
	local peds       = {}

	for ped in EnumeratePeds() do
		local found = false

		for j=1, #ignoreList, 1 do
			if ignoreList[j] == ped then
				found = true
			end
		end

		if not found then
			table.insert(peds, ped)
		end
	end

	return peds
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

Utils.event(1, EnterZone, "Territories:EnterZone")

Utils.event(1, LeaveZone, "Territories:LeaveZone")

Utils.event(1, PlayerKilled, "Territories:GotMurdered")


Utils.event(1, PlayerLogin, "Territories:PlayerLogin")


Utils.event(1, Init, "Territories:Init")

