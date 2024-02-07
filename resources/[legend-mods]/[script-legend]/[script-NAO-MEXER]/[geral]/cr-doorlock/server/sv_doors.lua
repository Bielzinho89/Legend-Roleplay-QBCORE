local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent('cr-doorlock:server:updateState')
AddEventHandler('cr-doorlock:server:updateState', function(door, forced)
    local doorKey = tonumber(door)

    if not doorKey or not Config.Doors[doorKey] then
        return
    end

    if forced == nil then
        forced = false
    end
    --print(not Config.Doors[doorKey].locked)
    Config.Doors[doorKey].locked = not Config.Doors[doorKey].locked
    TriggerClientEvent('cr-doorlock:client:updateState', -1, doorKey, Config.Doors[doorKey].locked, forced)
end)

AddEventHandler('playerJoining', function()
    TriggerClientEvent('cr-doorlock:initialize', source, Config.Doors)
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    TriggerClientEvent('cr-doorlock:initialize', -1, Config.Doors)
end)