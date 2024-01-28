local QBCore = exports['qb-core']:GetCoreObject()
local CurrentCops = 0

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)


RegisterNetEvent('repair:mechanic')
AddEventHandler('repair:mechanic', function()
    local plyPed = PlayerPedId()
    ---SetVehicleFixed(plyVeh)
	SetVehicleDirtLevel(plyVeh, 0.0)
end)


Citizen.CreateThread(function()
	exports['qb-target']:AddCircleZone("boostingc", vector3(-491.33, -2685.69, 21.68), 1.5, {
        name="boostingc",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
            {
                type = "client",
                event = "bropixel-boosting:CreateContract",
                parameters = {true},
                icon = "fas fa-newspaper",
                label = "Get Boosting Contracts",
                
            },
            -- {
            --     type = "client",
            --     event = "bropixel-boosting:CreateContract",
            --     parameters = {},
            --     icon = "fas fa-newspaper",
            --     label = "Get Boosting Contracts",
                
            -- },
        },
        
        distance = 1.5
    })
end)

CreateThread(function()
    SpawnNPC()
end)

SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('csb_hao'))
        while not HasModelLoaded(GetHashKey('csb_hao')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('csb_hao') , -491.33, -2685.69, 19.68, 94.16, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end



RegisterNetEvent('cr-drugs:AddWeapons')
AddEventHandler('cr-drugs:AddWeapons', function()
    Config.Dealers[2]["products"][#Config.Dealers[2]["products"]+1] = {
        name = "weapon_snspistol",
        price = 5000,
        amount = 1,
        info = {
            serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        },
        type = "item",
        slot = 5,
        minrep = 200,
    }
    Config.Dealers[3]["products"][#Config.Dealers[3]["products"]+1] = {
        name = "weapon_snspistol",
        price = 5000,
        amount = 1,
        info = {
            serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        },
        type = "item",
        slot = 5,
        minrep = 200,
    }
end)