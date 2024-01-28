local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent("cr-meth:server:changedoorstate")
AddEventHandler("cr-meth:server:changedoorstate", function()
    TriggerClientEvent('cr-meth:client:changedoorstate', -1, true)
    Citizen.Wait(60000)
    TriggerClientEvent('cr-meth:client:changedoorstate', -1, false)
end)

QBCore.Functions.CreateCallback('cr-meth:server:MixingCheck', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local acetone = Player.Functions.GetItemByName("acetone")
        local ammonia = Player.Functions.GetItemByName("ammonia")
        local pseudoephedrine = Player.Functions.GetItemByName("pseudoephedrine")
        local hydroacid = Player.Functions.GetItemByName("hydroacid")
        local iodine_crystals = Player.Functions.GetItemByName("iodine_crystals")
        local sulfuricacid = Player.Functions.GetItemByName("sulfuricacid")
        local glucose = Player.Functions.GetItemByName("glucose")
	    if (acetone and ammonia and pseudoephedrine and hydroacid and iodine_crystals and sulfuricacid and glucose) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent("cr-meth:server:removemixing")
AddEventHandler("cr-meth:server:removemixing", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('acetone', 1)
    Player.Functions.RemoveItem('ammonia', 1)
    Player.Functions.RemoveItem('pseudoephedrine', 1)
    Player.Functions.RemoveItem('hydroacid', 1)
    Player.Functions.RemoveItem('iodine_crystals', 1)
    Player.Functions.RemoveItem('sulfuricacid', 1)
    Player.Functions.RemoveItem('glucose', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["acetone"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["ammonia"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["pseudoephedrine"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["hydroacid"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["iodine_crystals"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["sulfuricacid"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["glucose"], "remove")
end)

RegisterServerEvent("cr-meth:server:mixreward")
AddEventHandler("cr-meth:server:mixreward", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('rawmeth', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rawmeth'], "add")
end)

QBCore.Functions.CreateCallback('cr-meth:server:CookingCheck', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local item = Player.Functions.GetItemByName("rawmeth")
	    if (item) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent("cr-meth:server:removecooking")
AddEventHandler("cr-meth:server:removecooking", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('rawmeth', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["rawmeth"], "remove")
end)

RegisterServerEvent("cr-meth:server:cookingreward")
AddEventHandler("cr-meth:server:cookingreward", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('drymeth', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drymeth'], "add")
end)

QBCore.Functions.CreateCallback('cr-meth:server:PackingCheck', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local drymeth = Player.Functions.GetItemByName("drymeth")
	    if (drymeth) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent("cr-meth:server:removepacking")
AddEventHandler("cr-meth:server:removepacking", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('drymeth', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["drymeth"], "remove")
end)

RegisterServerEvent("cr-meth:server:packingreward")
AddEventHandler("cr-meth:server:packingreward", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('methbrick', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['methbrick'], "add")
end)

QBCore.Functions.CreateUseableItem("methlabkey", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('cr-meth:client:UseLabKey', source)
end)