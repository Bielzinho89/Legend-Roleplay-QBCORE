local QBCore = exports['qb-core']:GetCoreObject() 

local thisisok = false
local smashfirst = true
local smashsecond = true
local smashthird = true
local smashfourth = true
local smashfifth = true
local smashsixth = true
local smashseventh = true
local smasheigth = true
local smashninth = true
local smashtenth = true
local smasheleventh = true
local smashtwelth = true
local smashthirteenth = true
local weaponTypes = {
    ["3337201093"] = { "SMG", ["slot"] = 3 },
    ["970310034"] = { "AssaultRifle", ["slot"] = 4 },
    ["-957766203"] = { "AssaultRifle", ["slot"] = 4 },
    ["1159398588"] = { "MG", ["slot"] = 4 },
    ["860033945"] = { "Shotgun", ["slot"] = 3 },
    ["3082541095"] = { "Sniper", ["slot"] = 3 },
    ["2725924767"] = { "Heavy", ["slot"] = 4 },
}
local _,wep = GetCurrentPedWeapon(playerPed)

function weaponTypeC()
	local w = GetSelectedPedWeapon(PlayerPedId())
	local wg = GetWeapontypeGroup(w)
	if weaponTypes[""..wg..""] then
		return weaponTypes[""..wg..""]["slot"]
	else
		return 0
	end
end

local uhavewapon = false

function uhavewapon2()
    if weaponTypeC() > 1 then
        uhavewapon = true
    else
		QBCore.Functions.Notify("You need something bigger to smash this.", "error")
    end
end

function inventoryitem()
	local rnd = math.random()
	if rnd < 0.1 then
	  TriggerServerEvent("cr-jewelry:goldBar")
	  Wait(100)
	  TriggerServerEvent("cr-jewelry:getRolexLow")
	else
	  TriggerServerEvent("cr-jewelry:getRolexyeah")
	end
	

end

RegisterNetEvent("pacific:ptfxparticle")
AddEventHandler("pacific:ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(-596.38, -284.47, 50.30)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('cr-jewelry:jewelry:OpenMinigame')
AddEventHandler('cr-jewelry:jewelry:OpenMinigame', function()
local ped = PlayerPedId()
local playercoords = GetEntityCoords(ped)
local thermitepos = vector3(-596.14, -283.74, 50.3236)

QBCore.Functions.TriggerCallback('cr-jewelry:server:getCops', function(cops)
	if #(playercoords - thermitepos) < 2.0 then
	if cops >= 0 and thisisok == false then

	RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
	RequestModel("hei_p_m_bag_var22_arm_s")
	RequestNamedPtfxAsset("scr_ornate_heist")
	while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
		Citizen.Wait(50)
	end
	if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
	end
	TaskGoStraightToCoord(PlayerPedId(), -596.96, -284.41, 50.30, 1.0, -1, 337.84, 0.0)
	Citizen.Wait(4500)
	    exports["bb-memorygame"]:thermiteminigame(4, 3, 3, 10,
			function()
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(-596.14, -283.74, 50.3236, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), -596.14, -283.74, 50.3236,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Citizen.Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Citizen.Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserver", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", -596.0, -282.80, 50.3236, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Citizen.Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Citizen.Wait(500)
				thisisok = true
				TriggerEvent('cr-jewelry:jewelry:cooldown')
				TriggerServerEvent('cr-doorlock:server:updateState', 4, false)
				TriggerEvent("dispatch:jewelryRobbery")
			end,
			function() -- failure
				thisisok = false
				TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["thermite"], "thermite")
				TriggerEvent("dispatch:jewelryRobbery")
			end)
		else
			QBCore.Functions.Notify("There isn't enough police or the door is open.", "error")
		end    
	else
	end
end)
end)

RegisterNetEvent('cr-jewelry:jewelry:SmashFunctions')
AddEventHandler('cr-jewelry:jewelry:SmashFunctions', function()
	local playerPos = GetEntityCoords(PlayerPedId(), true)
	--PlaySoundFromCoord(-1, "Glass_Smash", playerPos.x, playerPos.y, playerPos.z, "", 0, 2.0, 0)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'breaking_vitrine_glass', 0.5)
	SmashAnim()
	Wait(100)
	inventoryitem()
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     Citizen.Wait(5)
    end
end

function SmashAnim()
	if not IsEntityPlayingAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 3) then
	TaskPlayAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 8.0, 8.0, -1, 17, 1, false, false, false)
	loadAnimDict('missheist_jewel')
	TaskPlayAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	Citizen.Wait(5000)
	ClearPedTasks(PlayerPedId())
	end
end

RegisterNetEvent('cr-jewelry:jewelry:smashfirst')
AddEventHandler('cr-jewelry:jewelry:smashfirst', function()
	if thisisok == true then
	uhavewapon2()
	if uhavewapon then
    	if smashfirst == true then
    	TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
		smashfirst = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    	end
	end
else
	QBCore.Functions.Notify("Something is missing!", "error")	
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashsecond')
AddEventHandler('cr-jewelry:jewelry:smashsecond', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashsecond == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	smashsecond = false
	else
	QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashthird')
AddEventHandler('cr-jewelry:jewelry:smashthird', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashthird == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashthird = false
	else
	    QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashfourth')
AddEventHandler('cr-jewelry:jewelry:smashfourth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashfourth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashfourth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashfifth')
AddEventHandler('cr-jewelry:jewelry:smashfifth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashfifth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashfifth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashsixth')
AddEventHandler('cr-jewelry:jewelry:smashsixth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashsixth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashsixth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashseventh')
AddEventHandler('cr-jewelry:jewelry:smashseventh', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashseventh == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashseventh = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smasheigth')
AddEventHandler('cr-jewelry:jewelry:smasheigth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smasheigth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smasheigth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashninth')
AddEventHandler('cr-jewelry:jewelry:smashninth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashninth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashninth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashtenth')
AddEventHandler('cr-jewelry:jewelry:smashtenth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashtenth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashtenth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smasheleven')
AddEventHandler('cr-jewelry:jewelry:smasheleven', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smasheleventh == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smasheleventh = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashtwelth')
AddEventHandler('cr-jewelry:jewelry:smashtwelth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashtwelth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashtwelth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:smashthirteenth')
AddEventHandler('cr-jewelry:jewelry:smashthirteenth', function()
if thisisok == true then
	uhavewapon2()
if uhavewapon then
    if smashthirteenth == true then
    TriggerEvent('cr-jewelry:jewelry:SmashFunctions')
	    smashthirteenth = false
	else
		QBCore.Functions.Notify("Already smashed!", "error")
    end
else
	QBCore.Functions.Notify("Something is missing!", "error")
end
else  
	QBCore.Functions.Notify("Something is missing!", "error")
end
end)

RegisterNetEvent('cr-jewelry:jewelry:cooldown')
AddEventHandler('cr-jewelry:jewelry:cooldown', function()
	QBCore.Functions.Notify("In 20 minutes, doors will be closed!", "error")
	
	
	Wait(1200000)
	
	
	TriggerServerEvent('cr-doorlock:server:updateState', 11, true)
	thisisok = false
	smashfirst = true
	smashsecond = true
	smashthird = true
	smashfourth = true
	smashfifth = true
	smashsixth = true
	smashseventh = true
	smasheigth = true
	smashninth = true
	smashtenth = true
	smasheleventh = true
	smashtwelth = true
	smashthirteenth = true
end)