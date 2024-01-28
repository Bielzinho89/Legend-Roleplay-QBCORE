local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('badge:open')
AddEventHandler('badge:open', function(ID, targetID, type)
    local Player = QBCore.Functions.GetPlayer(ID)
    
    local data = {
        name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        --name =  Player.PlayerData.metadata["callsign"],
       ---dob = Player.PlayerData.metadata["callsign"]
    
    }
    
    TriggerClientEvent('badge:open', targetID, data)
    TriggerClientEvent('badge:shot', targetID, source)
end)

QBCore.Functions.CreateUseableItem('specialbadge', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "police1" or Player.PlayerData.job.name == "police2" or Player.PlayerData.job.name == "police3" or Player.PlayerData.job.name == "police4" or Player.PlayerData.job.name == "police5" or Player.PlayerData.job.name == "police6" or Player.PlayerData.job.name == "police7" or Player.PlayerData.job.name == "police8" or Player.PlayerData.job.name == "police9" or Player.PlayerData.job.name == "police10" then
        TriggerClientEvent('badge:openPD', source, true)

    else
        TriggerClientEvent('QBCore:Notify', source, 'specialbadge Is not for you', 'error')
    end
end)
