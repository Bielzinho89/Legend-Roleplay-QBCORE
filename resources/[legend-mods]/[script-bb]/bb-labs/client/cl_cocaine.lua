local QBCore = exports['qb-core']:GetCoreObject() 

local Insidecokelab = false
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

RegisterNetEvent('cr-cocaine:client:changedoorstate')
AddEventHandler('cr-cocaine:client:changedoorstate', function(state)
    dooropened = state
end)

RegisterNetEvent('cr-cocaine:client:UseLabKey')
AddEventHandler('cr-cocaine:client:UseLabKey', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    local dist = Vdist(pos, 911.46, -1274.52, 27.09, true) -- Entrance Coords
    if dist < 1 then
        local ped = PlayerPedId()
        LoadAnimationDict("anim@heists@keycard@") 
        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
        Citizen.Wait(400)
        ClearPedTasks(ped)
        Citizen.Wait(500)
        DoScreenFadeOut(250)
        Citizen.Wait(250)
        SetEntityCoords(ped, 1088.68, -3187.87, -38.99 - 0.98) -- Inner Lab Coords
        SetEntityHeading(ped, 177.60) -- Inner Lab Heading
        Citizen.Wait(1000)
        Insidecokelab = true
        DoScreenFadeIn(250)
        TriggerServerEvent('cr-cocaine:server:changedoorstate',true)
    end
end)


-------
RegisterNetEvent('gang:key')
AddEventHandler('gang:key', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    local dist = Vdist(pos, -690.65, -885.19, 24.71, true) -- Entrance Coords
    if dist < 1 then
        local ped = PlayerPedId()
        LoadAnimationDict("anim@heists@keycard@") 
        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
        Citizen.Wait(400)
        ClearPedTasks(ped)
        Citizen.Wait(500)
        DoScreenFadeOut(250)
        Citizen.Wait(250)
        SetEntityCoords(ped, -680.66, -886.07, 24.5 - 0.98) -- Inner Lab Coords
        SetEntityHeading(ped, 177.60) -- Inner Lab Heading
        Citizen.Wait(1000)
        Insidecokelab = true
        DoScreenFadeIn(250)
       
    end
end)

RegisterNetEvent('cr-cocaine:client:OpenMixingMenu')
AddEventHandler('cr-cocaine:client:OpenMixingMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Ingredients: Coca Leaves | Hydrochloric Acid | Hydroiodic Acid",
            txt = "",
        },
        {
			id = 2,
            header = "Mix Ingredients",
            txt = "Mix into Raw Material",
			params = {
				event = "cr-cocaine:client:startmixing"
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

RegisterNetEvent('cr-cocaine:client:startmixing')
AddEventHandler('cr-cocaine:client:startmixing', function()
    QBCore.Functions.TriggerCallback('cr-cocaine:server:MixingCheck', function(HasItem)
        if HasItem then
            local AnimDict = "anim@amb@business@coc@coc_unpack_cut_left@"
            local Anim = "coke_cut_v5_coccutter"
            QBCore.Functions.Progressbar("doing_smth", "Mixing Ingredients", 60000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                animDict = AnimDict,
                anim = Anim,
                flags = 16,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('cr-cocaine:server:removemixing')
                    TriggerServerEvent('cr-cocaine:server:mixreward')
                    ClearPedTasks(PlayerPedId())                    
                end, function() -- Cancel
                StopAnimTask(PlayerPedId(), AnimDict, "exit", 1.0)
            end)
        else
            QBCore.Functions.Notify('You are missing certain ingredients!', 'error')
        end
    end)
end)

exports["qb-target"]:AddCircleZone("cocainemix", vector3(1099.53, -3194.22, -38.99), 1.0,
    {
        name = "cocainemix",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "cr-cocaine:client:OpenMixingMenu",
                icon = "fas fa-blender",
                label = "Mix Ingredients"
            }
        },
        job = {"all"},
        distance = 3.0
    }
)

RegisterNetEvent('cr-cocaine:client:OpenCrushingMenu')
AddEventHandler('cr-cocaine:client:OpenCrushingMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Ingredients: Raw Cocaine",
            txt = "",
        },
        {
			id = 2,
            header = "Crush Raw Cocaine",
            txt = "Crush into Cocaine Powder",
			params = {
				event = "cr-cocaine:client:startcrushing"
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

RegisterNetEvent('cr-cocaine:client:startcrushing')
AddEventHandler('cr-cocaine:client:startcrushing', function()
    QBCore.Functions.TriggerCallback('cr-cocaine:server:CrushCheck', function(HasItem)
        if HasItem then
            local AnimDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
            local Anim = "chemical_pour_short_cooker"
            QBCore.Functions.Progressbar("doing_smth", "Crushing Raw Cocaine", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                  animDict = AnimDict,
                  anim = Anim,
                  flags = 16,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('cr-cocaine:server:removecrushing')
                    TriggerServerEvent('cr-cocaine:server:crushingreward')
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

exports["qb-target"]:AddCircleZone("cocainecrushing", vector3(1101.49, -3198.36, -38.99), 1.0,
    {
        name = "cocainecrushing",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "cr-cocaine:client:OpenCrushingMenu",
                icon = "fas fa-mortar-pestle",
                label = "Crush Cocaine"
            }
        },
        job = {"all"},
        distance = 3.0
    }
)

RegisterNetEvent('cr-cocaine:client:OpenPackingMenu')
AddEventHandler('cr-cocaine:client:OpenPackingMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Ingredients: Cocaine Powder",
			txt = "",
        },
        {
			id = 2,
            header = "Pack Cocaine",
            txt = "Pack your product into 100g",
			params = {
				event = "cr-cocaine:client:startpacking"
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

RegisterNetEvent('cr-cocaine:client:startpacking')
AddEventHandler('cr-cocaine:client:startpacking', function()
    QBCore.Functions.TriggerCallback('cr-cocaine:server:PackingCheck', function(HasItem)
        if HasItem then
            local AnimDict = "mini@repair"
            local Anim = "fixing_a_player"
            QBCore.Functions.Progressbar("doing_smth", "Packing Cocaine", 20000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                  animDict = AnimDict,
                  anim = Anim,
                  flags = 16,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('cr-cocaine:server:removepacking')
                    TriggerServerEvent('cr-cocaine:server:packingreward')
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

exports["qb-target"]:AddCircleZone("cocainepack", vector3(1090.12,-3199.09, -38.99), 1.0,
    {
        name = "cocainepack",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "cr-cocaine:client:OpenPackingMenu",
                icon = "fas fa-box",
                label = "Pack Cocaine"
            }
        },
        job = {"all"},
        distance = 3.0
    }
)

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if dooropened then
            if(Vdist(pos, 911.46, -1274.52, 27.09, true) < 20)then
                inRange = true
                if(Vdist(pos, 911.46, -1274.52, 27.09, true) < 1)then
                    DrawText3Ds(911.46, -1274.52, 27.09, '[E]')
                    if IsControlJustPressed(0, 38) then
                        local ped = PlayerPedId()
                        LoadAnimationDict("anim@heists@keycard@") 
                        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
                        Citizen.Wait(400)
                        ClearPedTasks(ped)
                        Citizen.Wait(500)
                        DoScreenFadeOut(250)
                        Citizen.Wait(250)
                        SetEntityCoords(ped, 1088.68, -3187.87, -38.99 - 0.98)
                        SetEntityHeading(ped, 177.60)
                        Citizen.Wait(1000)
                        Insidecokelab = true
                        DoScreenFadeIn(250)
                    end
                end
            end
        end

        if Insidecokelab then
            if(Vdist(pos, 1088.68, -3187.87, -38.99, true) < 20)then
                inRange = true
                if(Vdist(pos, 1088.68, -3187.87, -38.99, true) < 1)then
                    DrawText3Ds(1088.68, -3187.87, -38.99, '[E]')
                    if IsControlJustPressed(0, 38) then
                        local ped = PlayerPedId()
                        LoadAnimationDict("anim@heists@keycard@") 
                        TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
                        Citizen.Wait(400)
                        ClearPedTasks(ped)
                        Citizen.Wait(500)
                        DoScreenFadeOut(250)
                        Citizen.Wait(250)
                        SetEntityCoords(ped, 911.46, -1274.52, 27.09 - 0.98)
                        SetEntityHeading(ped, 302.46)
                        Insidecokelab = false
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