local QBCore = exports['qb-core']:GetCoreObject() 

RegisterNetEvent('cr-blackmarket:sbuyitems')
AddEventHandler('cr-blackmarket:sbuyitems', function(products)
    local src = source
    local data = Config.Products[products]
    local Player = QBCore.Functions.GetPlayer(source)
    local moneyPlayer = tonumber(Player.PlayerData.money.cash)
    if moneyPlayer > data.price then
        Player.Functions.RemoveMoney('cash', tonumber(data.price), 'black-market')
        if Player.Functions.GetItemByName(products) then
            TriggerEvent('cr-logs:server:createLog', 'blackmarket-buy', 'Item bought (' ..products.. ') for $' ..data.price.. '.'  , "", src)
        else
            Player.Functions.AddItem(products, 1, false)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[products], "add")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Not enough money.", 'error')
    end
end)

local ItemList = {
    ["gallary_stolenart"] = 250,
    ["gallary_starry_night"] = 250,
    ["gallary_portrait_of_drgachet"] = 350,
    ["gallary_les_femmes_dalger"] = 350,
    ["gallary_maneki_neko"] = 350,
    ["gallary_maltese_falcon"] = 350,
    ["gallary_payne_portrait"] = 350,
    ["gallary_dora_maar_auchat"] = 500,
    ["gallary_skull"] = 600,
    ["gallary_egg"] = 600,
    ["gallary_greek_bust"] = 700,
    ["gallary_mona_lisa"] = 1300,
    ["gallary_dragon"] = 1500,
    ["sapphire"] = 50,
    ["emerald"] = 100,
    ["ruby"] = 200,
    ["vase"] = 100,
    ["grandconversion"] = 100,
}

RegisterNetEvent('cr-blackmarket:sellitemsv', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "blackmarket items sold")
        TriggerEvent('cr-logs:server:createLog', 'blackmarket-sell', 'Items sold for $' ..price.. "." , "", src)
        TriggerClientEvent('QBCore:Notify', src, " You recieved $" ..price.. " for your stuff.", 'success')
    end
end)

--------------------------- 2nd Market
RegisterNetEvent('cr-blackmarket2:sbuyitems')
AddEventHandler('cr-blackmarket2:sbuyitems', function(products)
    local src = source
    local data = Config.Products2[products]
    local Player = QBCore.Functions.GetPlayer(source)
    local moneyPlayer = tonumber(Player.PlayerData.money.cash)
    if moneyPlayer > data.price then
        Player.Functions.RemoveMoney('cash', tonumber(data.price), 'black-market')
        if Player.Functions.GetItemByName(products) then
            TriggerEvent('cr-logs:server:createLog', 'blackmarket-buy', 'Item bought (' ..products.. ') for $' ..data.price.. '.'  , "", src)
        else
            Player.Functions.AddItem(products, 1, false)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[products], "add")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Not enough money.", 'error')
    end
end)

local ItemList2 = {
    ["band"] = 50,
    ["cashstack"] = 100,
    ["headphones"] = 100,
    ["samsungphone"] = 100,
    ["iphone"] = 100,
    ["goldchain"] = 100,
    ["diamond_ring"] = 100,
    ["goldcoin"] = 150,
    ["diamond_ring"] = 150,
    ["goldbar"] = 800,
    ["rolex"] = 250,
    ["markedbills"] = 500,
    ["inkedmoneybag"] = 3000,
    ["fish_dolphin"] = 340,
    ["fish_shark"] = 375,
    ["fish_whale"] = 420,
    ["bobcatsecuritycard"] = 25000,
}

RegisterNetEvent('cr-blackmarket2:sellitemsv', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList2[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList2[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "blackmarket items sold")
        TriggerEvent('cr-logs:server:createLog', 'blackmarket-sell', 'Items sold for $' ..price.. "." , "", src)
        TriggerClientEvent('QBCore:Notify', src, " You recieved $" ..price.. " for your stuff.", 'success')
    end
end)