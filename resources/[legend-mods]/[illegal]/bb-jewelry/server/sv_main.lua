local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent("cr-jewelry:ptfx")
AddEventHandler("cr-jewelry:ptfx", function(method)
    TriggerClientEvent("cr-jewelry:ptfx_c", -1, method)
end)

QBCore.Functions.CreateUseableItem("thermite", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("cr-jewelry:jewelry:OpenMinigame", source)
end)

RegisterServerEvent('cr-jewelry:getRolexLow')
AddEventHandler('cr-jewelry:getRolexLow', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rewardRolex = math.random(5, 10)

	Player.Functions.AddItem('rolex', rewardRolex)
    TriggerEvent('cr-logs:server:createLog', 'jewelryrobbery', 'Received ' ..rewardRolex.. ' Rolex.', "", source)
end)

RegisterServerEvent('cr-jewelry:getRolexyeah')
AddEventHandler('cr-jewelry:getRolexyeah', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local highRolex = math.random(20, 30)

	Player.Functions.AddItem('rolex', highRolex)
    TriggerEvent('cr-logs:server:createLog', 'jewelryrobbery', 'Received ' ..highRolex.. ' Rolex.', "", source)
end)

RegisterServerEvent('cr-jewelry:goldBar')
AddEventHandler('cr-jewelry:goldBar', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local goldbar = math.random(1, 2)

	Player.Functions.AddItem('goldbar', goldbar)
    TriggerEvent('cr-logs:server:createLog', 'jewelryrobbery', 'Received ' ..goldbar.. ' Gold Bar.', "", source)
end)

QBCore.Functions.CreateCallback('cr-jewelry:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
	end
	cb(amount)
end)