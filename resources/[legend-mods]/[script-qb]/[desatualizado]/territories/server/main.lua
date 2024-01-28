local ModReady = true
local SqlReady = true
print = function(...)
end
error = function(...)
end

local QBCore = exports['qb-core']:GetCoreObject() 

local buzyTasks = {}

QBCore.Functions.CreateCallback("checkifbuzy", function(source, cb, actionName)
    if(buzyTasks[actionName] ~= nil) then
        if buzyTasks[actionName] then
            local Target = QBCore.Functions.GetPlayer(buzyTasks[actionName])
            if Target ~= nil then 
                cb(true)
            else 
                buzyTasks[actionName] = false
                cb(false)    
            end 
        else 
            cb(false)    
        end    
    else
        cb(false)
    end
end)

RegisterServerEvent('drugs:server:setstatus')
AddEventHandler('drugs:server:setstatus', function(status, actionName)
    local src = source
    if status then status = src end    
    buzyTasks[actionName] = status
end)


Start = function()
    if Territories and type(Territories) == "table" then
        for k, v in pairs(Territories) do
            Territories[k].players = {}
        end
    end
    
end

MarketAccess = {}
MarketCheck = function()
    local controlling = {}
    if Territories and type(Territories) == "table" then
        for k, v in pairs(Territories) do
            if v and type(v) == "table" and v.control then
                controlling[v.control] = (controlling[v.control] or 0) + 1
            end
        end
        for k, v in pairs(controlling) do
            if v >= 2 then
                if not MarketAccess[k] then
                    MarketAccess[k] = true
                    TriggerClientEvent("Territories:GotMarketAccess", -1, k)
                end
            else
                if MarketAccess[k] then
                    MarketAccess[k] = false
                    TriggerClientEvent("Territories:LostMarketAccess", -1, k)
                end
            end
        end
    end
end

EnterZone = function(zone, job)
    local _source = source
    if
        not Territories or type(Territories) ~= "table" or not Territories[zone] or type(Territories[zone]) ~= "table" or
            not Territories[zone].players
     then
        return
    end
    Territories[zone].players[_source] = job
end
LeaveZone = function(zone, job)
    local _source = source
    if
        not Territories or type(Territories) ~= "table" or not Territories[zone] or type(Territories[zone]) ~= "table" or
            not Territories[zone].players
     then
        return
    end
    Territories[zone].players[_source] = nil
end


RegisterServerEvent("Territories:RewardPlayer")
AddEventHandler("Territories:RewardPlayer", function(roomId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- if not QBCore.Functions.CheckSecurityToken(src, securityToken, Player.PlayerData.securityToken, "Territories:RewardPlayer") then
    --     return
    -- end

    RewardPlayer(roomId)
end)

RewardPlayer = function(action)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
        
        if action.rewardItem and action.rewardRate then
            local canContinue = true
            local giveCount = (action.rewardRate or 1)
                local itemData = xPlayer.Functions.GetItemByName(action.requireItem)
                local itemData2 = xPlayer.Functions.GetItemByName(action.requireItem2)
                if itemData ~= nil and itemData2 ~= nil and itemData.amount >=  action.requireRate and  itemData2.amount >=  action.requireRate2 then
                    if action.requireItem and action.requireRate > 0 then
                        xPlayer.Functions.RemoveItem(action.requireItem, action.requireRate)
                        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[action.requireItem], "remove")
                    elseif action.requireCash and action.requireCash > 0 then
                        xPlayer.Functions.RemoveMoney("cash", action.requireCash)
                    end
                    if action.requireItem2 and action.requireRate2 > 0 then
                        xPlayer.Functions.RemoveItem(action.requireItem2, action.requireRate2)
                        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[action.requireItem2], "remove")
                    end
                    xPlayer.Functions.AddItem(action.rewardItem, giveCount,nil, nil, "drugs-process")
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[action.rewardItem], "add")
                -- else
                --     TriggerClientEvent('QBCore:Notify', source, "Vah Bete Vah!", "error")
                --     DropPlayer(source, "Wah Bete Humse Chalaki Nahi Karo to Acha Hoga")
                end
        elseif action.rewardCash and action.rewardCash > 0 then
            xPlayer.Functions.AddMoney("cash",action.rewardCash)
        end
end

Utils.event(1, EnterZone, "Territories:EnterZone")

Utils.event(1, LeaveZone, "Territories:LeaveZone")

Utils.event(1, PlayerLogin, "Territories:PlayerLogin")

Utils.event(1, Init, "Territories:Init")
