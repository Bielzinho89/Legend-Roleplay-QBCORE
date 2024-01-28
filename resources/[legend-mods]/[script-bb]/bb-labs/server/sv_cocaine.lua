local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent("cr-cocaine:server:changedoorstate")
AddEventHandler("cr-cocaine:server:changedoorstate", function()
    TriggerClientEvent('cr-cocaine:client:changedoorstate', -1, true)
    Citizen.Wait(60000)
    TriggerClientEvent('cr-cocaine:client:changedoorstate', -1, false)
end)

-- Mixing --
QBCore.Functions.CreateCallback('cr-cocaine:server:MixingCheck', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local coca = Player.Functions.GetItemByName("coca")
        local hydroacid = Player.Functions.GetItemByName("hydroacid")
        local hydriodicacid = Player.Functions.GetItemByName("hydriodicacid")
	    if (coca and hydroacid and hydriodicacid) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent("cr-cocaine:server:removemixing")
AddEventHandler("cr-cocaine:server:removemixing", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('coca', 1)
    Player.Functions.RemoveItem('hydroacid', 1)
    Player.Functions.RemoveItem('hydriodicacid', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["coca"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["hydroacid"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["hydriodicacid"], "remove")
end)

RegisterServerEvent("cr-cocaine:server:mixreward")
AddEventHandler("cr-cocaine:server:mixreward", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('rawcoke', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rawcoke'], "add")
end)

-- Crushing --
QBCore.Functions.CreateCallback('cr-cocaine:server:CrushCheck', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local item = Player.Functions.GetItemByName("rawcoke")
	    if (item) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent("cr-cocaine:server:removecrushing")
AddEventHandler("cr-cocaine:server:removecrushing", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('rawcoke', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["rawcoke"], "remove")
end)

RegisterServerEvent("cr-cocaine:server:crushingreward")
AddEventHandler("cr-cocaine:server:crushingreward", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('powdercoke', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['powdercoke'], "add")
end)

-- Packing --
QBCore.Functions.CreateCallback('cr-cocaine:server:PackingCheck', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local powdercoke = Player.Functions.GetItemByName("powdercoke")
	    if (powdercoke) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent("cr-cocaine:server:removepacking")
AddEventHandler("cr-cocaine:server:removepacking", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('powdercoke', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["powdercoke"], "remove")
end)

RegisterServerEvent("cr-cocaine:server:packingreward")
AddEventHandler("cr-cocaine:server:packingreward", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('cokebrick', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebrick'], "add")
end)

-- Cocaine Lab Key
QBCore.Functions.CreateUseableItem("cokelabkey", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('cr-cocaine:client:UseLabKey', source)
end)

QBCore.Functions.CreateUseableItem("stone", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('gang:key', source)
end)