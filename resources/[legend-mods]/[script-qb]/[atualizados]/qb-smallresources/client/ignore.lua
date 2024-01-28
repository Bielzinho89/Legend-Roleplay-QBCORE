CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
		Wait(10000)
    end
end)

AddEventHandler("populationPedCreating", function(x, y, z, model)
	Wait(500)	-- Give the entity some time to be created
	local found, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
end)


CreateThread(function()
	while true do
		Wait(1)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedMinGroundTimeForStungun(ped, math.random(4000, 7000))
		else
			Wait(1000)
		end
	end
end)


CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end
		
	SetMaxWantedLevel(0)
end)

-- CreateThread(function()
--     while true do
--         local ped = PlayerPedId()
--         local weapon = GetSelectedPedWeapon(ped)
-- 		if weapon ~= `WEAPON_UNARMED` then
-- 			if IsPedArmed(ped, 6) then
-- 				DisableControlAction(1, 140, true)
-- 				DisableControlAction(1, 141, true)
-- 				DisableControlAction(1, 142, true)
-- 			end

-- 			if weapon == `WEAPON_FIREEXTINGUISHER` or  weapon == `WEAPON_PETROLCAN` then
-- 				if IsPedShooting(ped) then
-- 					SetPedInfiniteAmmo(ped, true, `WEAPON_FIREEXTINGUISHER`)
-- 					SetPedInfiniteAmmo(ped, true, `WEAPON_PETROLCAN`)
-- 				end
-- 			end
-- 		else
-- 			Wait(500)
-- 		end
--         Wait(7)
--     end
-- end)
    --==========================================================================================================================================
    -- [[ DESABILITAR CAMERA AFK ]] --
    --==========================================================================================================================================
    Citizen.CreateThread(function()
        while true do
            InvalidateIdleCam()
            InvalidateVehicleIdleCam()
            Wait(1000)
        end
    end)
    --==========================================================================================================================================
    -- [[ REMOVER RADIO NO Q ]] --
    --==========================================================================================================================================
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
              if IsPedInAnyVehicle(PlayerPedId()) then
                  SetUserRadioControlEnabled(false)
                  if GetPlayerRadioStationName() ~= nil then
                    SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
                  end
              end
         end
    end)
	--==========================================================================================================================================
    -- [[ DESABILITA CORONHADA ]] --
    --==========================================================================================================================================
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            local ped = PlayerPedId()
            if IsPedArmed(ped,6) then
                DisableControlAction(0,140,true)
                DisableControlAction(0,141,true)
                DisableControlAction(0,142,true)
            end
        end
    end)
	--==========================================================================================================================================
    -- [[ CANCELAR AGACHAR E ATIRAR QUE NAO BUGA HUD ]] --
    --==========================================================================================================================================
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			local ped = PlayerPedId()
			local player = PlayerId()
			if agachar then 
				DisablePlayerFiring(player, true)
			end
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			DisableControlAction(0,36,true)
			if not IsPedInAnyVehicle(ped) then
				RequestAnimSet("move_ped_crouched")
				RequestAnimSet("move_ped_crouched_strafing")
				if IsDisabledControlJustPressed(0,36) then
					if agachar then
						ResetPedStrafeClipset(ped)
						ResetPedMovementClipset(ped,0.25)
						agachar = false
					else
						SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
						SetPedMovementClipset(ped,"move_ped_crouched",0.25)
						agachar = true
					end
				end
			end
		end
	end)
	--==========================================================================================================================================
	-- [[ TREMER TELA ATIRANDO DE DENTRO DO CARRO ]] --
	--==========================================================================================================================================
	Citizen.CreateThread(function()
		while true do
			local timeDistance = 500
			local ped = PlayerPedId()
			if IsPedInAnyVehicle(ped) and IsPedArmed(ped,6) then
				timeDistance = 4

				if IsPedShooting(ped) then
					ShakeGameplayCam("SMALL_EXPLOSION_SHAKE",0.10)
				end
			end

			Citizen.Wait(timeDistance)
		end
	end)
	        --==========================================================================================================================================
        -- [[ SEM SONS PELO MAPA ]] --
        --==========================================================================================================================================
        Citizen.CreateThread(function() 
            StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
            SetAudioFlag("PoliceScannerDisabled",true); 
        end)
        --==========================================================================================================================================
        -- [[ SEM SONS PELO MAPA ]] --
        --==========================================================================================================================================
        CreateThread(function() 
            StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
            SetAudioFlag("PoliceScannerDisabled",true); 
        end)
        --==========================================================================================================================================
        -- [[ SEM SONS PELO MAPA ]] --
        --==========================================================================================================================================
        Citizen.CreateThread(function()
            SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_01_STAGE",false)
            SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM",false)
            SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM",false)
            SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Disabled_Zones",false,true)
            SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Zones",true,true)
            SetScenarioTypeEnabled("WORLD_VEHICLE_STREETRACE",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON_DIRT_BIKE",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_NEXT_TO_CAR",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_CAR",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_BIKE",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_MILITARY_PLANES_SMALL",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_MILITARY_PLANES_BIG",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_MECHANIC",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_EMPTY",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_BUSINESSMEN",false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_BIKE_OFF_ROAD_RACE",false)
            StartAudioScene("FBI_HEIST_H5_MUTE_AMBIENCE_SCENE")
            StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
            SetAudioFlag("PoliceScannerDisabled",true)
            SetAudioFlag("DisableFlightMusic",true)
            SetPlayerCanUseCover(PlayerId(),false)
            SetRandomEventFlag(false)
            SetDeepOceanScaler(0.0)
        end)
        --==========================================================================================================================================
        -- [[ COMANDO /FPS ]] --
        --==========================================================================================================================================
        RegisterCommand("fps",function(source,args)
            if args[1] == nil or args[1] == "on" then
                TriggerEvent("Notify","info","<b>ESCOLHA O NÍVEL DE BOOST DE FPS:</b><br><b>/fps alto</b> - Maior ganho de FPS<br><b>/fps baixo</b> - Menor ganho de FPS<br><b>/fps off</b> - Desliga o boost de FPS")
            elseif args[1] == "alto" or args[1] == "Alto" or args[1] == "ALTO" then
                SetTimecycleModifier("cinema")
                RopeDrawShadowEnabled(false)
                CascadeShadowsClearShadowSampleType()
                CascadeShadowsSetAircraftMode(false)
                CascadeShadowsEnableEntityTracker(true)
                CascadeShadowsSetDynamicDepthMode(false)
                CascadeShadowsSetEntityTrackerScale(0.0)
                CascadeShadowsSetDynamicDepthValue(0.0)
                CascadeShadowsSetCascadeBoundsScale(0.0)
                SetFlashLightFadeDistance(0.0)
                SetLightsCutoffDistanceTweak(0.0)
                DistantCopCarSirens(false)
                TriggerEvent("Notify","sucesso","Boost de <b>FPS Alto</b> ligado!")    
            elseif args[1] == "baixo" or args[1] == "Baixo" or args[1] == "BAIXO" then
                RopeDrawShadowEnabled(true)
                CascadeShadowsClearShadowSampleType()
                CascadeShadowsSetAircraftMode(false)
                CascadeShadowsEnableEntityTracker(true)
                CascadeShadowsSetDynamicDepthMode(false)
                CascadeShadowsSetEntityTrackerScale(5.0)
                CascadeShadowsSetDynamicDepthValue(3.0)
                CascadeShadowsSetCascadeBoundsScale(3.0)
                SetFlashLightFadeDistance(3.0)
                SetLightsCutoffDistanceTweak(3.0)
                DistantCopCarSirens(false)
                SetArtificialLightsState(false)
                TriggerEvent("Notify","sucesso","Boost de <b>FPS Baixo</b> ligado!")    
            elseif args[1] == "off" or args[1] == "Off" or args[1] == "OFF" then
                SetTimecycleModifier("default")
                RopeDrawShadowEnabled(true)
                CascadeShadowsSetAircraftMode(true)
                CascadeShadowsEnableEntityTracker(false)
                CascadeShadowsSetDynamicDepthMode(true)
                CascadeShadowsSetEntityTrackerScale(5.0)
                CascadeShadowsSetDynamicDepthValue(5.0)
                CascadeShadowsSetCascadeBoundsScale(5.0)
                SetFlashLightFadeDistance(10.0)
                SetLightsCutoffDistanceTweak(10.0)
                DistantCopCarSirens(true)
                SetArtificialLightsState(false)
                TriggerEvent("Notify","sucesso","Boost de <b>FPS Desligado</b>!")
            end
        end)

    RegisterNetEvent("repararestepe", function(veh)
        print(veh, DoesEntityExist(veh))
        for i = 0, 5 do
            SetVehicleTyreFixed(veh, i, 0, 1)
        end
        SetVehicleTyreFixed(veh, 45, 0, 1)
        SetVehicleTyreFixed(veh, 47, 0, 1)
    end)
    --==========================================================================================================================================
    -- [[ NPC DENSITY ]] --
    --==========================================================================================================================================
    DensityMultiplier = 0.5
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
            SetPedDensityMultiplierThisFrame(DensityMultiplier)
            SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
            SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
            SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
        end
    end)
    --==========================================================================================================================================
    -- [[ BLOCK CAR ]] --
    --==========================================================================================================================================
    if (IsDuplicityVersion()) then
        RegisterServerEvent("blacklist.checkForAdminPermissions")
        AddEventHandler('blacklist.checkForAdminPermissions', function()
            if IsPlayerAceAllowed(source, "blacklist.bypass") then
                TriggerClientEvent("blacklist.setAdminPermissions", source, true)
            end
        end)
    else
        local allowedToBypass = false
        local blockedModels = { -- change this list and add the cars you want.
            "lazer",
            "hydra",
            "strikeforce",
            "buzzard",
            "khanjali",
            "barrage",
            "khanjali",
            "rhino",
            "scarab",
            "scarab2",
            "scarab3",
            "thruster",
            "trailersmall2",
            "minitank",
            "deathbike",
            "deathbike2",
            "deathbike3",
            "oppressor",
            "oppressor2",
            "cargoplane",
            "insurgent",
            -- "insurgent2",
            "insurgent3",
            "menacer",
            "technical",
            "technical2",
            "technical3",
            "dinghy5",
            "patrolboat",
            "cerberus",
            "cerberus2",
            "cerberus3",
            "akula",
            -- "issi3",
            "issi4",
            "issi5",
            "issi6",
            "hunter",
            "savage",
            "valkyrie",
            "valkyrie2",
            "annihilator2",
            "apc",
            "chernobog",
            "halftrack",
            "dukes2",
            "bruiser",
            "bruiser2",
            "bruiser3",
            "brutus",
            "brutus2",
            "brutus3",
            "caracara",
            "dune3",
            "monster3",
            "monster4",
            "monster5",
            "nightshark",
            "zhaba",
            "alphaz1",
            "avenger",
            "avenger2",
            "bombushka",
            "howard",
            "tula",
            "starling",
            "limo2",
            "zr380",
            "zr3802",
            "zr3803",
            "toreador",
            "blazer5",
            "deluxo",
            "jb7002",
            "tampa3",
            "savestra",
            "viseris",
            "revolter",
            "speedo4",
            "mule4",
            "pounder2",
            "vigilante",
            "stromberg",
            "paragon2",
            "buffalo4",
            "comet4",
            "champion",
            "deity",
            "jubilee",
            "granger2",
            "ardent",
            "pyro",
            "patriot3"    
        }
    
        RegisterNetEvent("blacklist.setAdminPermissions")
        AddEventHandler("blacklist.setAdminPermissions", function(allowed)
            if allowed then
                allowedToBypass = allowed
            end
        end)
    
        Citizen.CreateThread(function()
            TriggerServerEvent("blacklist.checkForAdminPermissions")
            while true do
                Citizen.Wait(1)
                if not allowedToBypass then
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                        if DoesEntityExist(veh) and IsEntityAVehicle(veh) and not IsEntityDead(veh) then
                            if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
                                for _,car in pairs(blockedModels) do
                                    local model = GetEntityModel(veh)
                                    if GetHashKey(car) == model then
                                        SetEntityAsMissionEntity(veh, true, true)
                                        DeleteVehicle(veh)
                                        notify()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
        
        function notify()
            SetNotificationTextEntry("STRING")
            AddTextComponentSubstringPlayerName("~r~This model is blacklisted, you are not allowed to drive it.")
            DrawNotification(true, true)
        end
    end
    -- --==========================================================================================================================================
    -- [[ ARENA CARROS ]] --
    --==========================================================================================================================================
	Citizen.CreateThread(function()
		-- New Arena : 2800.00, -3800.00, 100.00
		RequestIpl("xs_arena_interior")
		RequestIpl("xs_arena_interior_mod")
		RequestIpl("xs_arena_interior_mod_2")
		RequestIpl("xs_arena_interior_vip")
		RequestIpl("xs_int_placement_xs")
		RequestIpl("xs_arena_banners_ipl")
		RequestIpl("xs_mpchristmasbanners")
		RequestIpl("xs_mpchristmasbanners_strm_0")
	end)
    --==========================================================================================================================================
    -- [[ ARENA CARROS ]] --
    --==========================================================================================================================================
	Citizen.CreateThread(function()
		-- New Arena : 2800.00, -3800.00, 100.00
		RequestIpl("xs_arena_interior")
        -- RequestIpl("rc12b_default") -- PORTA DO HP
		EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_A")
		EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_B")
		EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_C")
		EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_D")
		EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_Scene")
		EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_03")
	end)
    --==========================================================================================================================================
    -- [[ REMOVE NORTE ]] --
    --==========================================================================================================================================
    Citizen.CreateThread(function()
        RemoveIpl("plg_01")
        RemoveIpl("prologue01")
        RemoveIpl("prologue01_lod")
        RemoveIpl("prologue01c")
        RemoveIpl("prologue01c__lod")
        RemoveIpl("prologue01g")
        RemoveIpl("prologue01h")
        RemoveIpl("prologue01h_lod")
        RemoveIpl("prologue01i")
        RemoveIpl("prologue01i_lod")
        RemoveIpl("prologue01j")
        RemoveIpl("prologue01j_lod")
        RemoveIpl("prologue01k")
        RemoveIpl("prologue01k_lod")
        RemoveIpl("prologue01z")
        RemoveIpl("prologue01z_lod")
        RemoveIpl("plg_02")
        RemoveIpl("prologue02")
        RemoveIpl("prologue02_lod")
        RemoveIpl("lg_03")
        RemoveIpl("prologue03")
        RemoveIpl("prologue03_lod")
        RemoveIpl("prologue03b")
        RemoveIpl("prologue03b_lod")
        RemoveIpl("prologue03_grv_dug")
        RemoveIpl("prologue03_grv_dug_lod")
        RemoveIpl("prologue_grv_torch")
        RemoveIpl("plg_04")
        RemoveIpl("prologue04")
        RemoveIpl("prologue04_lod")
        RemoveIpl("prologue04b")
        RemoveIpl("prologue04b_lod")
        RemoveIpl("prologue04_cover")
        RemoveIpl("des_protree_end")
        RemoveIpl("des_protree_start")
        RemoveIpl("des_protree_start_lod")
        RemoveIpl("plg_05")
        RemoveIpl("prologue05")
        RemoveIpl("prologue05_lod")
        RemoveIpl("prologue05b")
        RemoveIpl("prologue05b_lod")
        RemoveIpl("plg_06")
        RemoveIpl("prologue06")
        RemoveIpl("prologue06_lod")
        RemoveIpl("prologue06b")
        RemoveIpl("prologue06b_lod")
        RemoveIpl("prologue06_int")
        RemoveIpl("prologue06_int_lod")
        RemoveIpl("prologue06_pannel")
        RemoveIpl("prologue06_pannel_lod")
        RemoveIpl("prologue_m2_door")
        RemoveIpl("prologue_m2_door_lod")
        RemoveIpl("plg_occl_00")
        RemoveIpl("prologue_occl")
        RemoveIpl("plg_rd")
        RemoveIpl("prologuerd")
        RemoveIpl("prologuerdb")
        RemoveIpl("prologuerd_lod")
    end)
	--==========================================================================================================================================
    -- [[ EMPURRAR COM M ]] --
    --==========================================================================================================================================
    local entityEnumerator = {
        __gc = function(enum)
            if enum.destructor and enum.handle then
                enum.destructor(enum.handle)
            end
            enum.destructor = nil
            enum.handle = nil
        end
    }
    
    local function EnumerateEntities(initFunc,moveFunc,disposeFunc)
        return coroutine.wrap(function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end
    
            local enum = { handle = iter, destructor = disposeFunc }
            setmetatable(enum, entityEnumerator)
    
            local next = true
            repeat
            coroutine.yield(id)
            next,id = moveFunc(iter)
            until not next
    
            enum.destructor,enum.handle = nil,nil
            disposeFunc(iter)
        end)
    end
    
    function EnumerateVehicles()
        return EnumerateEntities(FindFirstVehicle,FindNextVehicle,EndFindVehicle)
    end
    
    function GetVeh()
        local vehicles = {}
        for vehicle in EnumerateVehicles() do
            table.insert(vehicles,vehicle)
        end
        return vehicles
    end
    
    function GetClosestVeh(coords)
        local vehicles = GetVeh()
        local closestDistance = -1
        local closestVehicle = -1
        local coords = coords
    
        if coords == nil then
            local ped = PlayerPedId()
            coords = GetEntityCoords(ped)
        end
    
        for i=1,#vehicles,1 do
            local vehicleCoords = GetEntityCoords(vehicles[i])
            local distance = GetDistanceBetweenCoords(vehicleCoords,coords.x,coords.y,coords.z,true)
            if closestDistance == -1 or closestDistance > distance then
                closestVehicle  = vehicles[i]
                closestDistance = distance
            end
        end
        return closestVehicle,closestDistance
    end
    
    local First = vector3(0.0,0.0,0.0)
    local Second = vector3(5.0,5.0,5.0)
    local Vehicle = { Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil }
    
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            local closestVehicle,Distance = GetClosestVeh()
            if Distance < 6.1 and not IsPedInAnyVehicle(ped) then
                Vehicle.Coords = GetEntityCoords(closestVehicle)
                Vehicle.Dimensions = GetModelDimensions(GetEntityModel(closestVehicle),First,Second)
                Vehicle.Vehicle = closestVehicle
                Vehicle.Distance = Distance
                if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
                    Vehicle.IsInFront = false
                else
                    Vehicle.IsInFront = true
                end
            else
                Vehicle = { Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil }
            end
            Citizen.Wait(500)
        end
    end)
    
    RegisterCommand('keymappingEmpurrarCar',function()
        if Vehicle.Vehicle ~= nil then
            local ped = PlayerPedId()
            if GetEntityHealth(ped) > 100 and not LocalPlayer.state.dead and IsVehicleSeatFree(Vehicle.Vehicle,-1) and not IsEntityAttachedToEntity(ped,Vehicle.Vehicle) and not (GetEntityRoll(Vehicle.Vehicle) > 75.0 or GetEntityRoll(Vehicle.Vehicle) < -75.0) then
                RequestAnimDict('missfinale_c2ig_11')
                TaskPlayAnim(ped,'missfinale_c2ig_11','pushcar_offcliff_m',2.0,-8.0,-1,35,0,0,0,0)
                NetworkRequestControlOfEntity(Vehicle.Vehicle)
    
                if Vehicle.IsInFront then
                    AttachEntityToEntity(ped,Vehicle.Vehicle,GetPedBoneIndex(6286),0.0,Vehicle.Dimensions.y*-1+0.1,Vehicle.Dimensions.z+1.0,0.0,0.0,180.0,0.0,false,false,true,false,true)
                else
                    AttachEntityToEntity(ped,Vehicle.Vehicle,GetPedBoneIndex(6286),0.0,Vehicle.Dimensions.y-0.3,Vehicle.Dimensions.z+1.0,0.0,0.0,0.0,0.0,false,false,true,false,true)
                end
    
                while true do
                    Citizen.Wait(5)
                    if IsDisabledControlPressed(0,34) then
                        TaskVehicleTempAction(ped,Vehicle.Vehicle,11,100)
                    end
    
                    if IsDisabledControlPressed(0,9) then
                        TaskVehicleTempAction(ped,Vehicle.Vehicle,10,100)
                    end
    
                    if Vehicle.IsInFront then
                        SetVehicleForwardSpeed(Vehicle.Vehicle,-1.0)
                    else
                        SetVehicleForwardSpeed(Vehicle.Vehicle,1.0)
                    end
    
                    if not IsDisabledControlPressed(0,244) then
                        DetachEntity(ped,false,false)
                        StopAnimTask(ped,'missfinale_c2ig_11','pushcar_offcliff_m',2.0)
                        break
                    end
                end
            end
        end
    end,true)
    
    RegisterKeyMapping('keymappingEmpurrarCar', 'Empurrar veiculo', 'keyboard', 'm')
    --==========================================================================================================================================
    -- [[ DAMAGE WALK MODE ]] --
    --==========================================================================================================================================
    -- local hurt = false
    -- Citizen.CreateThread(function()
    --     while true do
    --         local idle = 1000
    --         local ped = PlayerPedId()
    --         if not IsEntityInWater(ped) then
    --             if GetEntityHealth(ped) <= 199 then
    --                 idle = 5
    --                 setHurt()
    --             elseif hurt and GetEntityHealth(ped) > 200 then
    --                 setNotHurt()
    --             end
    --         end
    --         Citizen.Wait(idle)
    --     end
    -- end)

    -- function setHurt()
    --     hurt = true
    --     RequestAnimSet("move_m@injured")
    --     SetPedMovementClipset(PlayerPedId(),"move_m@injured",true)
    --     SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
    --     DisableControlAction(0,21) 
    --     DisableControlAction(0,22)
    -- end

    -- function setNotHurt()
    --     hurt = false
    --     SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
    --     ResetPedMovementClipset(PlayerPedId())
    --     ResetPedWeaponMovementClipset(PlayerPedId())
    --     ResetPedStrafeClipset(PlayerPedId())
    -- end
    --==========================================================================================================================================
    -- [[ DESATIVAR SOM ]] --
    --==========================================================================================================================================
    CreateThread(function() 
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
        SetAudioFlag("PoliceScannerDisabled",true); 
      end)
    -- BLOCK SOM
    Citizen.CreateThread(function()
        while true do
            SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_01_STAGE', false)
            SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM', false)
            SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM', false)
            Citizen.Wait(0)
        end
    end)
    -- BLOCK SOM
    CreateThread(function()
        while true do
            StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
            SetAudioFlag("PoliceScannerDisabled",true);
            Wait(0)
        end
      end)
   	--==========================================================================================================================================
    -- [[ COMANDO DE /ARMA ]] --
    --==========================================================================================================================================
    RegisterCommand("arma", function(source, args, rawCommand)
        -- Substitua 'command.arma' pela permissão ACE necessária
        if IsPlayerAceAllowed(source, "group.admin") then
            if args[1] then
                GiveWeaponToPed(PlayerPedId(), args[1], 2500, false, true)
            else
                TriggerClientEvent("chatMessage", source, "Erro", {255, 0, 0}, "Uso correto: /arma <nome_da_arma>")
            end
        else
            TriggerClientEvent("chatMessage", source, "Erro", {255, 0, 0}, "Você não tem permissão para usar este comando.")
        end
    end, false)
    --==========================================================================================================================================
    -- [[[ PERDER A ADERÊNCIA QUANDO ESTIVER COM A RODA ESTOURADA ]] ]] --
    --==========================================================================================================================================
    Citizen.CreateThread(function()
        while true do
            local timeDistance = 500
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            if IsPedInAnyVehicle(ped) then
                timeDistance = 4
                if GetPedInVehicleSeat(vehicle,-1) == ped then
                    for i = 0, 5 do
                        if IsVehicleTyreBurst(vehicle, i, true) then
                            SetVehicleReduceGrip(vehicle,true)
                        end
                    end
                end
            end
            Citizen.Wait(timeDistance)
        end
    end)	

        
        
