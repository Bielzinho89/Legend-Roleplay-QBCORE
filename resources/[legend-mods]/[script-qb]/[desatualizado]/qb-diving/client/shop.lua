local notInteressted = false

local function ClearTimeOut()
    notInteressted = not notInteressted
end

-- CreateThread(function()
--     while true do
--         local ped = PlayerPedId()
--         local pos = GetEntityCoords(ped)
--         local inRange = false

--         if not notInteressted then
--             for k, v in pairs(QBDiving.SellLocations) do
--                 local dist = #(pos - vector3(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"]))

--                 if dist < 20 then
--                     inRange = true
--                     if dist < 1 then
--                         DrawText3D(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"] - 0.1, '~g~G~w~ - Selling Coral')
--                         if IsControlJustPressed(0, 47) then
--                             LocalPlayer.state:set("inv_busy", true, true)
--                             TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
--                             QBCore.Functions.Progressbar("sell_coral_items", "Check Pockets To Sell Coral", math.random(2000, 4000), false, true, {}, {}, {}, {}, function() -- Done
--                                 ClearPedTasks(PlayerPedId())
--                                 TriggerServerEvent('qb-diving:server:SellCoral')
--                                 notInteressted = true
--                                 SetTimeout(0, ClearTimeOut)
--                                 LocalPlayer.state:set("inv_busy", false, true)
--                             end, function() -- Cancel
--                                 ClearPedTasks(PlayerPedId())
--                                 QBCore.Functions.Notify("Canceled..", "error")
--                                 LocalPlayer.state:set("inv_busy", false, true)
--                             end)
--                         end
--                     end
--                 end
--             end
--         else
--             Wait(5000)
--         end

--         if not inRange then
--             Wait(1500)
--         end

--         Wait(3)
--     end
-- end)


RegisterNetEvent('sell:coral', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local inRange = false
  
        LocalPlayer.state:set("inv_busy", true, true)
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
        QBCore.Functions.Progressbar("sell_coral_items", "Check Pockets To Sell Coral", math.random(2000, 4000), false, true, {}, {}, {}, {}, function() -- Done
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('qb-diving:server:SellCoral')
            notInteressted = true
            SetTimeout(0, ClearTimeOut)
            LocalPlayer.state:set("inv_busy", false, true)
        end, function() -- Cancel
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify("Canceled..", "error")
            LocalPlayer.state:set("inv_busy", false, true)
        end)
   
end)



CreateThread(function()
    SpawnNPC()
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('a_m_m_prolhost_01'))
        while not HasModelLoaded(GetHashKey('a_m_m_prolhost_01')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end

CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_m_prolhost_01') , -1683.59, -1069.27, 12.15, 53.67, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end


Citizen.CreateThread(function()
	exports['qb-target']:AddCircleZone("sellcoral", vector3(-1684.11, -1068.96, 13.15), 1.5, {
        name="sellcoral",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
            {
                event = "sell:coral",
                icon = "fas fa-dollar-sign",
                label = "Sell Item",
            },
            {
                event = "openweaponshop",
                icon = "fas fa-shopping-basket",
                label = "Gear Shop",
            },
        },
        distance = 1.5
    })
end)
