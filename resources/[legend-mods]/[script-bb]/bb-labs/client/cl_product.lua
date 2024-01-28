local converting = false

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

function Progressbar(duration, label)
	local retval = nil
	QBCore.Functions.Progressbar("cutdrugs", label, duration, false, false, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {}, {}, {}, function()
		retval = true
	end, function()
		retval = false
	end)

	while retval == nil do
		Wait(1)
	end

	return retval
end

RegisterNetEvent("cr-labs:CocaineBrick10g")
AddEventHandler("cr-labs:CocaineBrick10g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut@")
		TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0, 1.0, -1, 1, -1, 0, 0, 0)
		Progressbar(5000,"Cutting Cocaine Brick to 10g's")
		StopAnimTask(GetPlayerPed(-1), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0)
	end
    converting = false
end)

-- COKE (10G) >> COKE (1G)
RegisterNetEvent("cr-labs:Cocaine10gCoke1g")
AddEventHandler("cr-labs:Cocaine10gCoke1g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut@")
		TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0, 1.0, -1, 1, -1, 0, 0, 0)
		Progressbar(5000,"Sorting 10g's Cocaine into 1g's")
		StopAnimTask(GetPlayerPed(-1), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0)
	end
    converting = false
end)

RegisterNetEvent("cr-labs:MethBrick10g")
AddEventHandler("cr-labs:MethBrick10g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut@")
		TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0, 1.0, -1, 1, -1, 0, 0, 0)
		Progressbar(5000,"Cutting Meth Brick into 10g's")
		StopAnimTask(GetPlayerPed(-1), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0)
	end
    converting = false
end)

RegisterNetEvent("cr-labs:Meth10gCoke1g")
AddEventHandler("cr-labs:Meth10gCoke1g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut@")
		TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0, 1.0, -1, 1, -1, 0, 0, 0)
		Progressbar(5000,"Sorting 10g's Meth into 1g's")
		StopAnimTask(GetPlayerPed(-1), "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0)
	end
    converting = false
end)