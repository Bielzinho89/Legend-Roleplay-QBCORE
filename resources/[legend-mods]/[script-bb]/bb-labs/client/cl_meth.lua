local QBCore = exports['qb-core']:GetCoreObject() 

local Insidemethlab = false
local dooropened = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 68)
    ClearDrawOrigin()
end

function LoadAnimationDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

RegisterNetEvent('cr-meth:client:changedoorstate')
AddEventHandler('cr-meth:client:changedoorstate', function(state)
    dooropened = state
end)

RegisterNetEvent('cr-meth:client:UseLabKey')
AddEventHandler('cr-meth:client:UseLabKey', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    local dist = Vdist(pos, 945.74, -1138.31, 26.50, true) -- Entrance Coords
    if dist < 1 then
        local ped = PlayerPedId()
        LoadAnimationDict("anim@heists@keycard@") 
        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
        Citizen.Wait(400)
        ClearPedTasks(ped)
        Citizen.Wait(500)
        DoScreenFadeOut(250)
        Citizen.Wait(250)
        SetEntityCoords(ped,  996.83, -3200.89, -36.39 - 0.98) -- Inner Lab Coords
        SetEntityHeading(ped, 30.68) -- Inner Lab Heading
        Citizen.Wait(1000)
        Insidemethlab = true
        DoScreenFadeIn(250)
        TriggerServerEvent('cr-meth:server:changedoorstate',true)
    end
end)

RegisterNetEvent('cr-meth:client:OpenMixingMenu')
AddEventHandler('cr-meth:client:OpenMixingMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Ingredients: Acetone | Pure Ammonia | Pseudoephedrine | Hydrochloric Acid | Iodine Crystals | Sulfuric Acid | Glucose",
			txt = "",
        },
        {
			id = 2,
            header = "Mix Ingredients",
            txt = "Turn Ingredients to Raw Material",
			params = {
				event = "cr-meth:client:startmixing"
            }
        },
        {
			id = 3,
            header = "Close", 
            txt = "",
            params = {
				event = ""
            }
        },
    })
end)

RegisterNetEvent('cr-meth:client:startmixing')
AddEventHandler('cr-meth:client:startmixing', function()
    QBCore.Functions.TriggerCallback('cr-meth:server:MixingCheck', function(HasItem)
        if HasItem then
            local AnimDict = "anim@amb@business@coc@coc_unpack_cut_left@"
            local Anim = "coke_cut_v5_coccutter"
            QBCore.Functions.Progressbar("doing_smth", "Mixing Ingredients", 80000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                animDict = AnimDict,
                anim = Anim,
                flags = 16,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('cr-meth:server:removemixing')
                    TriggerServerEvent('cr-meth:server:mixreward')
                    ClearPedTasks(PlayerPedId())                    
                end, function() -- Cancel
                StopAnimTask(PlayerPedId(), AnimDict, "exit", 1.0)
            end)
        else
            QBCore.Functions.Notify('You are missing certain ingredients!', 'error')
        end
    end)
end)

exports["qb-target"]:AddCircleZone("methmix", vector3(1014.10, -3194.87, -38.99), 1.0,
    {
        name = "methmix",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "cr-meth:client:OpenMixingMenu",
                icon = "fas fa-blender",
                label = "Mix Ingredients"
            }
        },
        job = {"all"},
        distance = 1.5
    }
)

RegisterNetEvent('cr-meth:client:OpenCookingMenu')
AddEventHandler('cr-meth:client:OpenCookingMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {	
			id = 1,
            header = "Ingredients: Raw Methamphetamine",
			txt = "",
        },
        {
			id = 2,
            header = "Cook Raw Methamphetamine",
            txt = "Turn Ingredients to Dry Material",
			params = {
				event = "cr-meth:client:startcooking"
            }
        },
        {
			id = 3,
            header = "Close", 
            txt = "",
			params = {
				event = ""
            }
        },
    })
end)

RegisterNetEvent('cr-meth:client:startcooking')
AddEventHandler('cr-meth:client:startcooking', function()
    QBCore.Functions.TriggerCallback('cr-meth:server:CookingCheck', function(HasItem)
        if HasItem then
            local AnimDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
            local Anim = "chemical_pour_short_cooker"
            QBCore.Functions.Progressbar("doing_smth", "Cooking Methamphetamine", 60000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                  animDict = AnimDict,
                  anim = Anim,
                  flags = 16,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('cr-meth:server:removecooking')
                    TriggerServerEvent('cr-meth:server:cookingreward')
                    StopAnimTask(PlayerPedId(), AnimDict, "exit", 1.0)
                    ClearPedTasks(PlayerPedId())
                end, function() -- Cancel
                StopAnimTask(PlayerPedId(), AnimDict, "exit", 1.0)
            end)
        else
           QBCore.Functions.Notify('You are missing certain ingredients!', 'error')
        end
    end)
end)

exports["qb-target"]:AddCircleZone("methcook", vector3(1005.75, -3200.40, -38.51), 1.0,
    {
        name = "methcook",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "cr-meth:client:OpenCookingMenu",
                icon = "fas fa-temperature-high",
                label = "Cook Methamphetamine"
            }
        },
        job = {"all"},
        distance = 1.5
    }
)

RegisterNetEvent('cr-meth:client:OpenPackingMenu')
AddEventHandler('cr-meth:client:OpenPackingMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Ingredients: Dry Methamphetamine",
			txt = "",
        },
        {
			id = 2,
            header = "Pack Methamphetamine",
            txt = "Pack your product into 100g",
			params = {
				event = "cr-meth:client:startpacking"
            }
        },
        {
			id = 3,
            header = "Close", 
            txt = "",
            params = {
				event = ""
            }
        },
    })
end)

RegisterNetEvent('cr-meth:client:startpacking')
AddEventHandler('cr-meth:client:startpacking', function()
    QBCore.Functions.TriggerCallback('cr-meth:server:PackingCheck', function(HasItem)
        if HasItem then
            local AnimDict = "mini@repair"
            local Anim = "fixing_a_player"
            QBCore.Functions.Progressbar("doing_smth", "Packing Methamphetamine", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                  animDict = AnimDict,
                  anim = Anim,
                  flags = 16,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('cr-meth:server:removepacking')
                    TriggerServerEvent('cr-meth:server:packingreward')
                    StopAnimTask(PlayerPedId(), AnimDict, "exit", 1.0)
                    ClearPedTasks(PlayerPedId())
                    CanMixMeth = true
                end, function() -- Cancel
                StopAnimTask(PlayerPedId(), AnimDict, "exit", 1.0)
            end)
        else
           QBCore.Functions.Notify('You are missing certain ingredients!', 'error')
        end
    end)
end)

exports["qb-target"]:AddCircleZone("methpacking", vector3(1006.07, -3194.96, -38.99), 1.0,
    {
        name = "methpacking",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "cr-meth:client:OpenPackingMenu",
                icon = "fas fa-box",
                label = "Pack Methamphetamine"
            }
        },
        job = {"all"},
        distance = 1.5
    }
)

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if dooropened then
            if(Vdist(pos, 945.74, -1138.31, 26.50, true) < 20)then
                inRange = true
                if(Vdist(pos, 945.74, -1138.31, 26.50, true) < 1)then
                    DrawText3Ds(945.74, -1138.31, 26.50, '[E]')
                    if IsControlJustPressed(0, 38) then
                        local ped = PlayerPedId()
                        LoadAnimationDict("anim@heists@keycard@") 
                        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
                        Citizen.Wait(400)
                        ClearPedTasks(ped)
                        Citizen.Wait(500)
                        DoScreenFadeOut(250)
                        Citizen.Wait(250)
                        SetEntityCoords(ped,  996.83, -3200.89, -36.39 - 0.98)
                        SetEntityHeading(ped, 30.68)
                        Citizen.Wait(1000)
                        Insidemethlab = true
                        DoScreenFadeIn(250)
                    end
                end
            end
        end

        if Insidemethlab then
            if(Vdist(pos,  996.83, -3200.89, -36.39, true) < 20)then
                inRange = true
                if(Vdist(pos,  996.83, -3200.89, -36.39, true) < 1)then
                    DrawText3Ds(996.83, -3200.89, -36.39, '[E]')
                    if IsControlJustPressed(0, 38) then
                        local ped = PlayerPedId()
                        LoadAnimationDict("anim@heists@keycard@") 
                        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
                        Citizen.Wait(400)
                        ClearPedTasks(ped)
                        Citizen.Wait(500)
                        DoScreenFadeOut(250)
                        Citizen.Wait(250)
                        SetEntityCoords(ped, 945.74, -1138.31, 26.50 - 0.98)
                        SetEntityHeading(ped, 30.68)
                        Insidemethlab = false
                        Citizen.Wait(1000)
                        DoScreenFadeIn(250)
                    end
                end
            end 
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)