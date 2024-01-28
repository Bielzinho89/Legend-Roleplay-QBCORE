local QBCore = exports['qb-core']:GetCoreObject() 

local sync = false 
local pedsSync = {}
Firstdoor = 

-- Minigame and Heist Starting 
RegisterNetEvent('cr-bobcat:startHeist')
AddEventHandler('cr-bobcat:startHeist',function() 
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    QBCore.Functions.TriggerCallback("cr-bobcat:enoughCops",function(enoughCops)  
        if enoughCops >= 1 then     
            if #(coords - Config.FirstDoor) < 2.0 then
                exports["bb-memorygame"]:thermiteminigame(3, 3, 3, 10, function() 
                    firstDoor()
                    TriggerServerEvent("cr-bobcat:removeItem", "thermitecharge")
                end, function() 
                    print('failed')
                end) 
            elseif #(coords - Config.SecondDoor) < 2.0 then      
                exports["bb-memorygame"]:thermiteminigame(3, 3, 3, 10, function() 
                    secondDoor()
                    TriggerServerEvent("cr-bobcat:removeItem", "thermitecharge")
                end, function() 
                    print('failed')
                end) 
            end
        else
            QBCore.Functions.Notify('Not enough cops!', 'error')
        end
    end)
end)

-- Opening Doors 
function firstDoor()
    loadAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(882.1660, -2258.35, 32.461, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 882.1660, -2258.35, 32.461,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomb = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomb, false, true)
    AttachEntityToEntity(bomb, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomb, 1, 1)
    FreezeEntityPosition(bomb, true)
    TriggerServerEvent("cr-bobcat:particles", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomb)
    StopParticleFxLooped(effect, 0)
    TriggerEvent("cr-bobcat:openFirstDoor") 
    
    
end 

function secondDoor() 
    loadAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(880.4080, -2264.50, 32.441, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 880.4080, -2264.50, 32.441,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomb = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomb, false, true)
    AttachEntityToEntity(bomb, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomb, 1, 1)
    FreezeEntityPosition(bomb, true)
    TriggerServerEvent("cr-bobcat:particles2", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomb)
    StopParticleFxLooped(effect, 0)
	TriggerEvent("cr-bobcat:openSecondDoor")
    exports['qb-dispatch']:UnionRobbery()
    
    
end

-- Doorlocks
RegisterNetEvent('cr-bobcat:openFirstDoor')
AddEventHandler('cr-bobcat:openFirstDoor', function()  
    TriggerServerEvent('cr-doorlock:server:updateState', 1, false)  
end)

RegisterNetEvent('cr-bobcat:openSecondDoor')
AddEventHandler('cr-bobcat:openSecondDoor', function()  
    TriggerServerEvent('cr-doorlock:server:updateState', 2, false) 
    Citizen.Wait(500)
    TriggerEvent('cr-bobcat:createPed')
    TriggerEvent('dispatch:bobcatRobbery')
end)

RegisterNetEvent('cr-bobcat:openThirdDoor')
AddEventHandler('cr-bobcat:openThirdDoor', function()  
    TriggerServerEvent('cr-doorlock:server:updateState', 3, false)   
    Citizen.Wait(500)
    TriggerServerEvent("cr-bobcat:removeItem", "bobcatsecuritycard")
    TriggerEvent('cr-bobcat:createPed') 
end)

-- Particles 
RegisterNetEvent("cr-bobcat:ptfxparticle")
AddEventHandler("cr-bobcat:ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(882.1320, -2257.34, 32.461)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000) 
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("cr-bobcat:ptfxparticle2")
AddEventHandler("cr-bobcat:ptfxparticle2", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000) 
    StopParticleFxLooped(effect, 0)
end)    

-- Ped Create
RegisterNetEvent('cr-bobcat:createPed')
AddEventHandler('cr-bobcat:createPed', function()

    AddRelationshipGroup('hostile') 
    
	RequestModel(1456041926)
	
    while not DoesEntityExist(bobcatped2) do
        bobcatped2 = CreatePed(30, 1456041926, 892.4030, -2275.25, 32.441, 360.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped2, true, true)
    SetEntityAlwaysPrerender(bobcatped2, true)
	SetPedArmour(bobcatped2, 500)
	SetPedAsEnemy(bobcatped2, true)
	SetPedRelationshipGroupHash(bobcatped2, 'hostile')
	GiveWeaponToPed(bobcatped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped2, PlayerPedId())
	SetPedAccuracy(bobcatped2, 100)
	SetPedDropsWeaponsWhenDead(bobcatped2, false)

    while not DoesEntityExist(bobcatped3) do
        bobcatped3 = CreatePed(30, 1456041926, 892.6776, -2281.26, 32.441, 350.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped3, true, true)
    SetEntityAlwaysPrerender(bobcatped3, true)
	SetPedArmour(bobcatped3, 500)
	SetPedAsEnemy(bobcatped3, true)
	SetPedRelationshipGroupHash(bobcatped3, 'hostile')
	GiveWeaponToPed(bobcatped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped3, PlayerPedId())
	SetPedAccuracy(bobcatped3, 100)
	SetPedDropsWeaponsWhenDead(bobcatped3, false)
    
    while not DoesEntityExist(bobcatped4) do
        bobcatped4 = CreatePed(30, 1456041926, 889.3485, -2292.47, 32.441, 350.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped4, true, true)
    SetEntityAlwaysPrerender(bobcatped4, true)
	SetPedArmour(bobcatped4, 500)
	SetPedAsEnemy(bobcatped4, true)
	SetPedRelationshipGroupHash(bobcatped4, 'hostile')
	GiveWeaponToPed(bobcatped4, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped4, PlayerPedId())
	SetPedAccuracy(bobcatped4, 100)
	SetPedDropsWeaponsWhenDead(bobcatped4, false)

    while not DoesEntityExist(bobcatped5) do
        bobcatped5 = CreatePed(30, 1456041926, 880.9854, -2293.40, 32.441, 300.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped5, true, true)
    SetEntityAlwaysPrerender(bobcatped5, true)
	SetPedArmour(bobcatped5, 500)
	SetPedAsEnemy(bobcatped5, true)
	SetPedRelationshipGroupHash(bobcatped5, 'hostile')
	GiveWeaponToPed(bobcatped5, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped5, PlayerPedId())
	SetPedAccuracy(bobcatped5, 100)
	SetPedDropsWeaponsWhenDead(bobcatped5, false)

    while not DoesEntityExist(bobcatped6) do
        bobcatped6 = CreatePed(30, 1456041926, 873.4896, -2293.21, 32.441, 266.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped6, true, true)
    SetEntityAlwaysPrerender(bobcatped6, true)
	SetPedArmour(bobcatped6, 500)
	SetPedAsEnemy(bobcatped6, true)
	SetPedRelationshipGroupHash(bobcatped6, 'hostile')
	GiveWeaponToPed(bobcatped6, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped6, PlayerPedId())
	SetPedAccuracy(bobcatped6, 100)
	SetPedDropsWeaponsWhenDead(bobcatped6, false)

    while not DoesEntityExist(bobcatped7) do
        bobcatped7 = CreatePed(30, 1456041926,894.1248, -2287.51, 32.446, 298.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped7, true, true)
    SetEntityAlwaysPrerender(bobcatped7, true)
	SetPedArmour(bobcatped7, 500)
	SetPedAsEnemy(bobcatped7, true)
	SetPedRelationshipGroupHash(bobcatped7, 'hostile')
	GiveWeaponToPed(bobcatped7, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped7, PlayerPedId())
	SetPedAccuracy(bobcatped7, 100)
	SetPedDropsWeaponsWhenDead(bobcatped7, false)

    while not DoesEntityExist(bobcatped8) do
        bobcatped8 = CreatePed(30, 1456041926, 896.9407, -2280.87, 32.441, 266.00, true, true)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(bobcatped8, true, true)
    SetEntityAlwaysPrerender(bobcatped8, true)
	SetPedArmour(bobcatped8, 500)
	SetPedAsEnemy(bobcatped8, true)
	SetPedRelationshipGroupHash(bobcatped8, 'hostile')
	GiveWeaponToPed(bobcatped8, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
	TaskCombatPed(bobcatped8, PlayerPedId())
	SetPedAccuracy(bobcatped8, 100)
	SetPedDropsWeaponsWhenDead(bobcatped8, false)

    local peds = {bobcatped2, bobcatped3, bobcatped4, bobcatped5, bobcatped6, bobcatped7, bobcatped8}
    local coords = GetEntityCoords(PlayerPedId())
    local players = GetPlayersInArea(coords, 10)
    local ids = {}
    for i, p in pairs(players) do 
        print(GetPlayerServerId(p))
        ids[i] = GetPlayerServerId(p)
    end
    TriggerServerEvent('cr-bobcat:syncPedsSV', peds, ids)
end)

-- Syncing Peds
RegisterNetEvent('cr-bobcat:syncPeds')
AddEventHandler('cr-bobcat:syncPeds', function(peds)
    print('Actively syncing and aggroing')
	for i, p in pairs(peds) do
        print(p)
        SetEntityAlwaysPrerender(p, true)
        SetEntityVisible(p, true, 0)
        TaskCombatPed(p, PlayerPedId())
        table.insert(pedsSync, p)
    end
    sync = true
    
    
end)

-- Vault Opening 
Citizen.CreateThread(function()
    local hash = "s_m_m_security_01"
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    hostage = CreatePed("PED_TYPE_CIVFEMALE", hash, 870.1760, -2288.20, 31.441, 175.21, false, false)
    SetBlockingOfNonTemporaryEvents(hostage, true)
    SetPedDiesWhenInjured(hostage, false)
    SetPedCanPlayAmbientAnims(hostage, true)
    SetPedCanRagdollFromPlayerImpact(hostage, false)
	SetEntityInvincible(hostage, false)
    loadAnimDict('random@arrests@busted')
    TaskPlayAnim(hostage, 'random@arrests@busted', 'idle_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
    
    
end)

Citizen.CreateThread(function()
    while not sync do
        Citizen.Wait(100)
    end
    while sync do
        for i, p in pairs(pedsSync) do
            SetEntityAlwaysPrerender(p, true)
            SetEntityVisible(p, true, 0)
            Citizen.Wait(100)
        end
    end
end)

RegisterNetEvent('cr-bobcat:commandPed') 
AddEventHandler('cr-bobcat:commandPed', function() 
    ClearPedTasks(hostage)
	TaskGoStraightToCoord(hostage, 869.2078, -2292.60, 32.441, 150.0, -1, 265.61, 0)
	Citizen.Wait(4500)
	TaskGoStraightToCoord(hostage, 893.3309, -2294.90, 32.441, 150.0, -1, 350.61, 0)
	Citizen.Wait(6500)
	TriggerEvent("cr-bobcat:commandPed2")
end)

RegisterNetEvent('cr-bobcat:commandPed2') 
AddEventHandler('cr-bobcat:commandPed2', function()
	TaskGoStraightToCoord(hostage, 894.6337, -2284.97, 32.441, 150.0, -1, 82.56, 0)
	Citizen.Wait(6500)

    local grenade = "w_ex_grenadefrag"
    RequestModel(grenade)
    while not HasModelLoaded(grenade) do
        Wait(1)
    end

    local coords = GetEntityCoords(hostage)
    local object = CreateObject(grenade, coords.x, coords.y, coords.z, true, false, false)
    AttachEntityToEntity(object, hostage, GetPedBoneIndex(hostage, 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true)

    loadAnimDict('weapons@projectile@grenade_str')
    TaskPlayAnim(hostage, 'weapons@projectile@grenade_str', 'throw_h_fb_backward', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	Citizen.Wait(1000)
	AddExplosion(890.7849, -2284.88, 32.441, 32, 150000.0, true, false, 4.0)
	AddExplosion(894.0084, -2284.90, 32.580, 32, 150000.0, true, false, 4.0)
    TriggerEvent("cr-bobcat:explodeVaultDoor")
    TriggerEvent("cr-bobcat:propCreate")
end)

RegisterNetEvent('cr-bobcat:explodeVaultDoor') 
AddEventHandler('cr-bobcat:explodeVaultDoor', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
end)

-- Vault Props 
RegisterNetEvent('cr-bobcat:propCreate')
AddEventHandler('cr-bobcat:propCreate', function()
    local weaponbox = CreateObject(GetHashKey("ex_prop_crate_ammo_sc"), 888.0774, -2287.33, 31.441, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 176.02)
    FreezeEntityPosition(weaponbox, true)

    local weaponbox2 = CreateObject(GetHashKey("ex_prop_crate_expl_sc"), 886.8, -2281.7, 31.441, true,  true, true)
    CreateObject(weaponbox2)
    SetEntityHeading(weaponbox2, 352.02)
    FreezeEntityPosition(weaponbox2, true) 

    local weaponbox3 = CreateObject(GetHashKey("ex_prop_crate_expl_bc"), 882.1840, -2286.8, 31.441, true,  true, true)
    CreateObject(weaponbox3)
    SetEntityHeading(weaponbox3, 158.02)
    FreezeEntityPosition(weaponbox3, true) 

    local weaponbox4 = CreateObject(GetHashKey("ex_prop_crate_ammo_bc"), 881.4557, -2282.61, 31.441, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 52.02)
    FreezeEntityPosition(weaponbox4, true)
end) 

-- Gun Receiving
local grabbed = false 

RegisterNetEvent('cr-bobcat:giveWeapon') 
AddEventHandler('cr-bobcat:giveWeapon', function()  
    if grabbed == false then  
        grabWeapons() 
        grabbed = true
    else  
        QBCore.Functions.Notify('You already searched here!', 'error')  
    end
end)

function grabWeapons()
    QBCore.Functions.Progressbar('plundering', 'Collecting Weapons', 10000, false, true, {
        disableMovement = true, 
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer", 
        flags = 8,
    }, {}, {}, function() 
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('cr-bobcat:giveRandomWeapon')  
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId()) 
        QBCore.Functions.Notify('You cancelled!', 'error')  
    end)
end

-- Target Export 
Citizen.CreateThread(function() 
    exports["qb-target"]:AddCircleZone("doorexplode", vector3(870.4505, -2288.83, 32.441), 1.0, {
        name ="doorexplode", 
        debugPoly = false
    }, {
        options = {
            {
                event = "cr-bobcat:commandPed",
                icon = "fas fa-bomb",
                label = "Explode Door!", 
            },
        },
        job = {"all"},
        distance = 3.0
    })  
    exports["qb-target"]:AddCircleZone("weapon", vector3(883.0063, -2283.38, 32.441), 1.0, {
        name ="weapon", 
        debugPoly = false
    }, {
        options = {
            {
                event = "cr-bobcat:giveWeapon",
                icon = "fas fa-box",
                label = "Grab!", 
            },
        },
        job = {"all"},
        distance = 3.0
    })  
end)

-- Load Anim Dict 
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

-- GetPlayersArea Function
GetPlayersInArea = function(coords, area)
	local players, playersInArea = QBCore.Functions.GetPlayers(), {}
	coords = vector3(coords.x, coords.y, coords.z)

	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)

		if #(coords - targetCoords) <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea
end