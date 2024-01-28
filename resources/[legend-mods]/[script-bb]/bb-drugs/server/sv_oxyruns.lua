local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money.cash >= 1500 then
		Player.Functions.RemoveMoney('cash', 1500)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
		TriggerEvent('cr-logs:server:createLog', 'oxyruns', 'Started an oxy run', "", src)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money little stupid fucking bitch.", "error")
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem("snspistol_stage_1", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["snspistol_stage_1"], 'add')
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem("oxy", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["oxy"], 'add')
    TriggerClientEvent('QBCore:Notify', src, "You were handed some oxy.")
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local money = math.random(1, 2) 
	
	TriggerClientEvent('QBCore:Notify', src, "You were handed $" ..money)
	---TriggerEvent('cr-logs:server:createLog', 'crash', 'Triggered Fake Event lmao (ban incoming bye bye) (oxyruns)', "", src)
	Player.Functions.AddMoney('cash', money)
end)

QBCore.Functions.CreateCallback('cr-oxyruns:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 0
            end
        end
	end
	cb(amount)
end)