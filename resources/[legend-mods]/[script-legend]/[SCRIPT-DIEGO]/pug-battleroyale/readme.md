# Pug Royale.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-webstore.tebex.io/category/custom-scripts

# Installation
Run the GameItems.sql before doing anything else IF YOU HAVE NOT DONE THIS FOR PAINTBALL ALREADY.
Download the island from here https://github.com/TayMcKenzieNZ/CayoImprovements. Credits to #TayMcKenzieNZ
Read through the config.lua thoroughly and adjust everything to match your server. (VERY IMPORTANT)
Make sure you have the dependencies installed. (Polyzone, qb-target OR ox_target, qb-inventory OR ox_inventory, qb-menu OR ps-ui OR ox_lib, qb-input OR ps-ui OR ox_lib)
Place the sound files provided in ["pug-battleroyale/soundfiles"] into InteractSound\client\html\sounds
for the vr headset download here and add its hat clothing number to Config.VrHeadSetPropMale and Config.VrHeadSetPropFemale https://www.gta5-mods.com/player/oculus-rift-cv1-eup

--
# Put this in qb-weathersync/client/client.lua right below [ local disable = Config.Disabled ] It Should look like this: https://i.imgur.com/D4A3xKq.png
RegisterNetEvent('Pug:client:ToggleWeatherSyncOff', function()
    disable = true
end)
RegisterNetEvent('Pug:client:ToggleWeatherSyncOn', function()
    disable = false
end)
# OR if you are using cd_easytime put this at the bottom oc cd_easytime/client.lua
RegisterNetEvent('Pug:client:ToggleWeatherSyncOff', function()
    TriggerEvent("cd_easytime:PauseSync", true)
end)
RegisterNetEvent('Pug:client:ToggleWeatherSyncOn', function()
    TriggerEvent("cd_easytime:PauseSync")
end)
--

--
# (OPTIONAL) If you want the med kit and slurp juice to remove the bleeding This goes at the very bottom of qb-ambulancejob/client/wounding.lua
RegisterNetEvent("Pug:Client:StopBleeding", function()
    isBleeding = 0
end)
--

--
# (ONLY DO THIS IF YOUR QB-SMALLRESOURCES IS OLDER AND LOOKS LIKE THIS. ELSE IGNORE THIS ENTIRELY AND SKIP THIS STEP) replaces EVERYTHING in qb-smallresources/client/hudcomponents.lua and make Config.UsingNewerSmallResources false
local InRoyaleMatch = false
RegisterNetEvent('Pug:client:SmallResourcesInBattleRoyale',function()
	InRoyaleMatch = not InRoyaleMatch
end)
CreateThread(function()-- https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    while true do
		HideHudComponentThisFrame(1) -- 1 : WANTED_STARS
		HideHudComponentThisFrame(2) -- 2 : WEAPON_ICON
		HideHudComponentThisFrame(3) -- 3 : CASH
		HideHudComponentThisFrame(4) -- 4 : MP_CASH
		-- HideHudComponentThisFrame(5)			-- 5 : MP_MESSAGE
		-- HideHudComponentThisFrame(6)			-- 6 : VEHICLE_NAME
		HideHudComponentThisFrame(7) -- 7 : AREA_NAME
		-- HideHudComponentThisFrame(8)			-- 8 : VEHICLE_CLASS
		HideHudComponentThisFrame(9) -- 9 : STREET_NAME
		-- HideHudComponentThisFrame(10)		-- 10 : HELP_TEXT
		-- HideHudComponentThisFrame(11)		-- 11 : FLOATING_HELP_TEXT_1
		-- HideHudComponentThisFrame(12)		-- 12 : FLOATING_HELP_TEXT_2
		HideHudComponentThisFrame(13) -- 13 : CASH_CHANGE
		if not InRoyaleMatch then
			HideHudComponentThisFrame(14) -- 14 : RETICLE
			HideHudComponentThisFrame(19) -- 19 : WEAPON_WHEEL
			HideHudComponentThisFrame(20) -- 20 : WEAPON_WHEEL_STATS
			HideHudComponentThisFrame(21) -- 21 : HUD_COMPONENTS
			HideHudComponentThisFrame(22) -- 22 : HUD_WEAPONS
			DisableControlAction(1, 37)
		end
		-- HideHudComponentThisFrame(15)		-- 15 : SUBTITLE_TEXT
		-- HideHudComponentThisFrame(16)		-- 16 : RADIO_STATIONS
		HideHudComponentThisFrame(17) -- 17 : SAVING_GAME
		-- HideHudComponentThisFrame(18)		-- 18 : GAME_STREAM
		DisplayAmmoThisFrame(true)

		Wait(4)
    end
end)
--

--
# in youR dispatch script, search up shots fired or discharge and add this if statement where you can to remove shots fired called wile in paintball. add "if not exports["pug-battleroyale"]:IsInBattleRoyale() then" to your shots fired call.
# if you are ps dispatch fine the "CEventShockingGunshotFired" handler in ps-dispatch/client/cl_eventhandlers and replace it with here here:
AddEventHandler('CEventShockingGunshotFired', function(witnesses, ped, coords)
   	if not exports["pug-battleroyale"]:IsInBattleRoyale() then -- (THIS LINE HERE WAS ADDED)
        local coords = vector3(coords[1][1], coords[1][2], coords[1][3])
        -- Use the timer to prevent the event from being triggered multiple times.
        if Config.Timer['Shooting'] ~= 0 then return end
        -- The ped that shot the gun must be the player.
        if PlayerPedId() ~= ped then return end
        -- This event can be triggered multiple times for a single gunshot, so we only want to run the code once.
        -- If there are no witnesses, then the player is the shooter.
        -- Else if there are witnesses, then the player will also be in that table.
        -- If one of these conditions are met, then we can continue.
        if witnesses and not isPedAWitness(witnesses, ped) then return end
        -- If the player is a whitelisted job, then we don't want to trigger the event.
        -- However, if the player is not whitelisted or Debug mode is true, then we want to trigger the event.
        if Config.AuthorizedJobs.LEO.Check() and not Config.Debug then return end
        -- If the weapon is silenced then we don't want to trigger the event.
        if IsPedCurrentWeaponSilenced(ped) then return end 
        -- If the weapon is blacklisted then we set the timer to the fail time and return.
        if BlacklistedWeapon(ped) then Config.Timer['Shooting'] = Config.Shooting.Fail return end
        -- Check if the Player is in a Hunting Zone and Give that Alert Instead
        if inHuntingZone then exports['ps-dispatch']:Hunting(); Config.Timer['Shooting'] = Config.Shooting.Success return end
        local vehicle = GetVehiclePedIsUsing(ped, true)
        if vehicle ~= 0 then
            if vehicleWhitelist[GetVehicleClass(vehicle)] then
                vehicle = vehicleData(vehicle)
                exports['ps-dispatch']:VehicleShooting(vehicle, ped, coords)
                Config.Timer['Shooting'] = Config.Shooting.Success
            end
        else
            exports['ps-dispatch']:Shooting(ped, coords)
            Config.Timer['Shooting'] = Config.Shooting.Success
        end
   	end
end)
--

--
# IF YOU ARE HAVING AN ISSUE WHERE YOUR GUN GETS PUT AWAY WHEN THE MATCH STARTS AND ARE USING QB-ANTICHEAT FIND THIS LOOP IN QB-ANTICHEAT/CLIENT/MAIN.LUA AND REPLACE IT WITH THIS
CreateThread(function()	-- Check if ped has weapon in inventory --
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn and not exports["pug-battleroyale"]:IsInBattleRoyale() then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation ~= nil and WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('qb-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Weapon removed!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon on them that they did not have in his inventory. QB Anticheat has removed the weapon.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)
--

--
# The Battle Royale utilizes the weapon wheel for weapon selection. If your inventory keybind is tab then go to your gta 5 setting, key binding and then weapons select and change the weapon wheel keybind
it look like this https://imgur.com/tuaDBmo
--

--
# Add these items to your qb-core/shared/items.lua
-- ROYALE ITEMS
["weapon_pistol_royale"] 		 	 	 = {["name"] = "weapon_pistol_royale",           		["label"] = "Beretta M9",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistolmk2.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_combatpistol_royale"] 		 	 	 = {["name"] = "weapon_combatpistol_royale",           		["label"] = "Combat Pistol",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_combatpistol.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_heavypistol_royale"] 		 	 	 = {["name"] = "weapon_heavypistol_royale",           		["label"] = "Heavy Pistol",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_heavypistol.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_appistol_royale"] 		 	 	 = {["name"] = "weapon_appistol_royale",           		["label"] = "AP Pistol",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_appistol.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_snspistol_royale"] 		 	 	 = {["name"] = "weapon_snspistol_royale",           		["label"] = "SNS Pistol",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_snspistol.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_pistol50_royale"] 		 	 	 = {["name"] = "weapon_pistol50_royale",           		["label"] = "Desert Eagle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_pistol50.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_vintagepistol_royale"] 		 	 	 = {["name"] = "weapon_vintagepistol_royale",           		["label"] = "Vintage Pistol",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "Vintage Pistol.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_carbinerifle_royale"] 		 	 	 = {["name"] = "weapon_carbinerifle_royale",           		["label"] = "Carbine Rifle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "carbinerifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_compactrifle_royale"] 		 	 	 = {["name"] = "weapon_compactrifle_royale",           		["label"] = "Draco",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_compactrifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_carbinerifle_mk2_royale"] 		 	 	 = {["name"] = "weapon_carbinerifle_mk2_royale",           		["label"] = "Carbine Rifle MK2",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "carbinerifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_assaultrifle_royale"] 		 	 	 = {["name"] = "weapon_assaultrifle_royale",           		["label"] = "AK-47",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_assaultrifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_assaultrifle_mk2_royale"] 		 	 	 = {["name"] = "weapon_assaultrifle_mk2_royale",           		["label"] = "AK-47 MK2",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "assaultriflemk2.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_specialcarbine_royale"] 		 	 	 = {["name"] = "weapon_specialcarbine_royale",           		["label"] = "Scar-H",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "scar.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_specialcarbine_mk2_royale"] 		 	 	 = {["name"] = "weapon_specialcarbine_mk2_royale",           		["label"] = "Specialcarbine MK2",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "specialcarbine_mk2.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_bullpuprifle_royale"] 		 	 	 = {["name"] = "weapon_bullpuprifle_royale",           		["label"] = "Bullpup Rifle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_bullpuprifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_bullpuprifle_mk2_royale"] 		 	 	 = {["name"] = "weapon_bullpuprifle_mk2_royale",           		["label"] = "Puprifle MK2",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "specialcarbine_mk2.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_advancedrifle_royale"] 		 	 	 = {["name"] = "weapon_advancedrifle_royale",           		["label"] = "Advanced Rifle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_advancedrifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_militaryrifle_royale"] 		 	 	 = {["name"] = "weapon_militaryrifle_royale",           		["label"] = "Militaryrifle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "militaryrifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_microsmg_royale"] 		 	 	 = {["name"] = "weapon_microsmg_royale",           		["label"] = "Micro SMG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_micro-smg2.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_assaultsmg_royale"] 		 	 	 = {["name"] = "weapon_assaultsmg_royale",           		["label"] = "Assault SMG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_assaultsmg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_smg_royale"] 		 	 	 = {["name"] = "weapon_smg_royale",           		["label"] = "SMG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_smg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_combatpdw_royale"] 		 	 	 = {["name"] = "weapon_combatpdw_royale",           		["label"] = "Combat PDW",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_combatpdw.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_smg_mk2_royale"] 		 	 	 = {["name"] = "weapon_smg_mk2_royale",           		["label"] = "PD MP5 2",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_gusenberg_royale"] 		 	 	 = {["name"] = "weapon_gusenberg_royale",           		["label"] = "Thompson SMG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_gusenberg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_mg_royale"] 		 	 	 = {["name"] = "weapon_mg_royale",           		["label"] = "MG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_mg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_combatmg_royale"] 		 	 	 = {["name"] = "weapon_combatmg_royale",           		["label"] = "Combat MG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_combatmg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_sniperrifle_royale"] 		 	 	 = {["name"] = "weapon_sniperrifle_royale",           		["label"] = "Sniper Rifle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_sniperrifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_marksmanrifle_royale"] 		 	 	 = {["name"] = "weapon_marksmanrifle_royale",           		["label"] = "Marksman Rifle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_marksmanrifle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_heavysniper_royale"] 		 	 	 = {["name"] = "weapon_heavysniper_royale",           		["label"] = "Heavy Sniper",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "Heavy Sniper.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_sawnoffshotgun_royale"] 		 	 	 = {["name"] = "weapon_sawnoffshotgun_royale",           		["label"] = "Sawn-off Shotgun",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_sawnoffshotgun.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_assaultshotgun_royale"] 		 	 	 = {["name"] = "weapon_assaultshotgun_royale",           		["label"] = "Assault Shotgun",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_assaultshotgun.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_bullpupshotgun_royale"] 		 	 	 = {["name"] = "weapon_bullpupshotgun_royale",           		["label"] = "Bullpup Shotgun",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_bullpupshotgun.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_pumpshotgun_royale"] 		 	 	 = {["name"] = "weapon_pumpshotgun_royale",           		["label"] = "Pump Shotgun",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_pumpshotgun.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_musket_royale"] 		 	 	 = {["name"] = "weapon_musket_royale",           		["label"] = "Musket",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_musket.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_heavyshotgun_royale"] 		 	 	 = {["name"] = "weapon_heavyshotgun_royale",           		["label"] = "Heavy Shotgun",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_heavyshotgun.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_rpg_royale"] 		 	 	 = {["name"] = "weapon_rpg_royale",           		["label"] = "RPG",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_rpg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_molotov_royale"] 		 	 	 = {["name"] = "weapon_molotov_royale",           		["label"] = "Molotov",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_molotov.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_stickybomb_royale"] 		 	 	 = {["name"] = "weapon_stickybomb_royale",           		["label"] = "C4",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_stickybomb.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_grenadelauncher_royale"] 		 	 	 = {["name"] = "weapon_grenadelauncher_royale",           		["label"] = "Grenade Launcher",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_grenadelauncher.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_pipebomb_royale"] 		 	 	 = {["name"] = "weapon_pipebomb_royale",           		["label"] = "Pipe Bomb",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_pipebomb.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["rifle_ammo_royale"] 		 	 	 = {["name"] = "rifle_ammo_royale",           		["label"] = "Rifle ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["smg_ammo_royale"] 		 	 	 = {["name"] = "smg_ammo_royale",           		["label"] = "SMG ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["pistol_ammo_royale"] 		 	 	 = {["name"] = "pistol_ammo_royale",           		["label"] = "Pistol ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["shotgun_ammo_royale"] 		 	 	 = {["name"] = "shotgun_ammo_royale",           		["label"] = "Shotgun ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "shotgun_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["mg_ammo_royale"] 		 	 	 = {["name"] = "mg_ammo_royale",           		["label"] = "MG ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "mg_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["snp_ammo_royale"] 		 	 	 = {["name"] = "snp_ammo_royale",           		["label"] = "Sniper ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "snp_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armorroyale_royale"] 		 	 	 = {["name"] = "armorroyale_royale",           		["label"] = "Armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["healthroyale_royale"] 		 	 	 = {["name"] = "healthroyale_royale",           		["label"] = "Health Kit",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "firstaid.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_machete_royale"] 		 	 	 = {["name"] = "weapon_machete_royale",           		["label"] = "Machete",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_machete.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_bat_royale"] 		 	 	 = {["name"] = "weapon_bat_royale",           		["label"] = "Bat",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_bat.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_bottle_royale"] 		 	 	 = {["name"] = "weapon_bottle_royale",           		["label"] = "Broken Bottle",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_bottle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_crowbar_royale"] 		 	 	 = {["name"] = "weapon_crowbar_royale",           		["label"] = "Crowbar",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_crowbar.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_dagger_royale"] 		 	 	 = {["name"] = "weapon_dagger_royale",           		["label"] = "Dagger",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_dagger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["weapon_hammer_royale"] 		 	 	 = {["name"] = "weapon_hammer_royale",           		["label"] = "Hammer",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "weapon_hammer.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["uav_royale"] 		 	 	 = {["name"] = "uav_royale",           		["label"] = "UAV",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "spyplane.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armor1_royale"] 		 	 	 = {["name"] = "armor1_royale",           		["label"] = "Light armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor1.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armor2_royale"] 		 	 	 = {["name"] = "armor2_royale",           		["label"] = "Medium armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor2.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armor3_royale"] 		 	 	 = {["name"] = "armor3_royale",           		["label"] = "Heavy armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor3.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["bandage_royale"] 		 	 	 = {["name"] = "bandage_royale",           		["label"] = "Bandage",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "bandage.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["jump_royale"] 		 	 	 = {["name"] = "jump_royale",           		["label"] = "Super Jump",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "jump.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["juice_royale"] 		 	 	 = {["name"] = "juice_royale",           		["label"] = "Juice",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["pug-vr"] 		 	 	 		= {["name"] = "pug-vr",           		["label"] = "Vr Headset",	 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "pug-vr.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 30.0,  ["description"] = "A simulation inside of a simulation."},
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1341 you will need to find what looks like this and replace it with this
if weaponType ~= 0 and weaponType ~= `GROUP_UNARMED` then
    if not exports["pug-battleroyale"]:IsInBattleRoyale() then
        Weapon.Disarm(currentWeapon, true)
    end
end
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1341 you will need to find what looks like this and replace it with this
if not exports["pug-battleroyale"]:IsInBattleRoyale() then
    if not EnableWeaponWheel then
        HudWeaponWheelIgnoreSelection()
        DisableControlAction(0, 37, true)
    end
end
--


# Battle Royale.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-webstore.tebex.io/category/custom-scripts

This script is using escrow encryption on only the main client.lua everything else is entirely open including the client/open.lua

PREVIEW HERE: https://youtu.be/aOvNlbYnNrc

CONFIG HERE: https://i.imgur.com/PEj17IN.png
README HERE: https://i.imgur.com/1EyEsNl.png

This completely configurable script consists of:

● Extremely extensive Config you can adjust!
● Players are placed in the games own dimension so they don't interrupt other players who are not playing the Royale in the server.
● 800+ different loot locations around the island. Configurable.
● VR headset option or ped option with a target to join the royal.
● VR headset creates a clone ped at your last position when entering the Royale and deletes when you finish the Royale.
● Loot random spawns as just ammo piles, gun and ammo piles, or just weapon/item piles. Configurable.
● A plane that brings the players in over the island, allowing them to drop where they like with multiple different random entering and exiting paths Configurable.
● UAV Killstreak reward after getting 3 kills.
● A custom ui that tracks players kills, position in the royal with updated player left as well, custom icons, icon that displays when the zone is shrinking or on cooldown.
● The custom ui fits perfectly all screen resolutions and also displays when a player has to reload or pickup loot.
● Random zones that shrink as the game proceeds and when you are outside of them a storm begins slowly killing the player. Configurable.
● A loot system that shoots all the players weapons, ammo, and items out of the player when they die for other players to pickup and loot.
● Loot removal on all players in the Royale being artificially synced when players loot an item from the ground.
● A custom gulag that players get sent to when they die on their first death. If the player wins the 1v1 gulag they get sent back into the match and the loser gets removed.
● A mechanic that makes the player only capable of having two primary weapons. Melee weapons, throwables, and other not primary type weapons do not apply and are configurable to decide on what is considered a primary.
● 6 helicopter spawn locations on the map, but only 3 helicopters spawn at a time. The script uses 3 random cards from 2 different tables to make it seem more random. Configurable.
● 62 vehicle spawn options around the island, but only 31 vehicles spawn at a time. The script uses 31 random cards from 2 different tables to make it seem more random Configurable.
● A mechanic that pickups up ammo and all none primary weapons when walking over them automatically.
● Runs at 0.0 ms resmon when not in a game and 0.03 when in a game.
● This script is completely open source other than the main client.lua.
● 0 known scuff. Was tested over and over with 10+ people to plug every issue that was found.
● Max player count is whatever your server player count is. Configurable.
● Players can choose the zone shrinking down time through the game menu, 6 options to choose from for faster or slower pace games.
● Mechanic to re-pull parachute multiple times after ejecting from the plane.
● A wager amount set to minimum $500 and maximum $25,000. Rearward at the end of the game gives 1st, 2nd, and 3rd a winning cash prized based off the amount of players X the wager X set percentage. Configurable.
● 50 weapon options and 7 different ammo options in the loot table. Configurable.
● 11 different car model options that spawn around the island. You can add as many car options as you like. Configurable.
● Custom sounds that are triggered in the Royale. (Sounds files will provide).
● Unlimited sprint. Configurable.
● The option to spectate players. Configurable.
● 7 unique Royale items that give special advantages
- Vr Headset
- UAV tablet item you can use to display a red dot on on your map that fades in and out for 30 seconds displaying the location of your enemy
- bullet proof heavy armor physical clothing vest that has 100 health and breaks after it receives enough damage
- bullet proof medium armor physical clothing vest that has 50 health and breaks after it receives enough damage
- bullet proof light armor physical clothing vest that has 20 health and breaks after it receives enough damage
- Slurp juice that regenerates health, armor, and gives a short speed boost to the player
- A Super jump item that gives the player a short 30 second super jump ability.

Requirements consist of:
QBCore
qb-menu OR ox_lib (ps-ui or any qb-menu resource name changed will work)
qb-target OR ox_target (any qb-inventory resource name changed will work)
Polyzone