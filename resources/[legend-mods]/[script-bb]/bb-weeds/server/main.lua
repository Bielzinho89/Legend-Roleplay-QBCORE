
local QBCore = exports['qb-core']:GetCoreObject() 

local playersProcessingCannabis = {}

RegisterServerEvent('os_drugs:pickedUpCannabis')
AddEventHandler('os_drugs:pickedUpCannabis', function(securityToken)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	

	   TriggerClientEvent("QBCore:Notify", src, "Picked up some Cannabis!!", "success", 8000) 
		  Player.Functions.AddItem('cannabis', 1,nil, nil, "weed-feild") ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cannabis'], "add")
	  
  end)



QBCore.Functions.CreateUseableItem('weed', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
 		TriggerClientEvent('weed:onUse', source)
	end
end)


-- QBCore.Functions.CreateUseableItem('cannabis', function(source, item)
-- 	local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.GetItemByName(item.name) ~= nil then
--  		TriggerClientEvent('cana:onUse', source)
-- 	end
-- end)


RegisterServerEvent('weed:tojoint')
AddEventHandler('weed:tojoint', function(securityToken)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	-- if not QBCore.Functions.CheckSecurityToken(src, securityToken, Player.PlayerData.securityToken, "weed:tojoint") then
    --     return
    -- end

	local weed = Player.Functions.GetItemByName('weed')
	local papper = Player.Functions.GetItemByName('rolling_paper')

	if weed ~= nil and weed.amount > 0 and papper ~= nil and papper.amount > 3 then
		if Player.Functions.RemoveItem('weed', 1) and Player.Functions.RemoveItem('rolling_paper', 4) then
		----change this
			Player.Functions.AddItem('joint', 4,nil, nil, "joint-making")-----change this
		end
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint'], "add")
		TriggerClientEvent('QBCore:Notify', src, 'Joint Created successfully', "success")  
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have enough Items ", "error")    
	end                                                                 			                                                                      				
end)


-- RegisterServerEvent('cana:tojoint')
-- AddEventHandler('cana:tojoint', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)
-- 	local cannabis = Player.Functions.GetItemByName('cannabis')
-- 	if cannabis ~= nil and cannabis.amount > 0 then
-- 		Player.Functions.RemoveItem('cannabis', 1)----change this
-- 		Player.Functions.AddItem('joint', 1)-----change this
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cannabis'], "remove")
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint'], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, 'Joint Created successfully', "success")  
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, "You don't have enough Weed ", "error")    
-- 	end                                                                 			                                                                      				
-- end)

-- RegisterServerEvent('os_drugs:processCannabis')
-- AddEventHandler('os_drugs:processCannabis', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)
-- 	local cannabis = Player.Functions.GetItemByName('cannabis')
-- 	if cannabis ~= nil and cannabis.amount > 3 then
-- 		Player.Functions.RemoveItem('cannabis', 4)----change this
-- 		Player.Functions.AddItem('weed', 1)-----change this
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cannabis'], "remove")
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed'], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, 'Cannabis Processed successfully', "success")  
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, "You don't have enough Cannabis ", "error")    
-- 	end                                                                 			                                                                      				
-- end)

-- RegisterServerEvent('os_drugs:processCannabisxD')
-- AddEventHandler('os_drugs:processCannabisxD', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)
-- 	local cannabis = Player.Functions.GetItemByName('cannabis')
-- 	if cannabis ~= nil and cannabis.amount > 3 then
-- 		Player.Functions.RemoveItem('cannabis', 4)----change this
-- 		Player.Functions.AddItem('weed', 1)-----change this
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cannabis'], "remove")
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed'], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, 'Cannabis Processed successfully', "success")  
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, "You don't have enough Cannabis ", "error")    
-- 	end                                                                 				
-- end)


function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end

RegisterServerEvent('os_drugs:cancelProcessing')
AddEventHandler('os_drugs:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('QBCore_:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('os_drugs:onPlayerDeath')
AddEventHandler('os_drugs:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

QBCore.Functions.CreateCallback('weed:process', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "cannabis" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any Cannabis", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)



QBCore.Functions.CreateCallback('weed:processxD', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "marijuana" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any marijuana", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)
