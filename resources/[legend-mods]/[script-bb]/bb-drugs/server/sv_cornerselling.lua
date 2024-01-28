local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('cr-drugs:server:cornerselling:getAvailableDrugs', function(source, cb)
    local AvailableDrugs = {}
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for i = 1, #Config.CornerSellingDrugsList, 1 do
        local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

        if item ~= nil then
            AvailableDrugs[#AvailableDrugs+1] = {
                item = item.name,
                amount = item.amount,
                label = QBCore.Shared.Items[item.name]["label"]
            }
        end
    end

    if next(AvailableDrugs) ~= nil then
        cb(AvailableDrugs)
    else
        cb(nil)
    end
end)

RegisterServerEvent('cr-drugs:server:sellCornerDrugs')
AddEventHandler('cr-drugs:server:sellCornerDrugs', function(item, amount, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItem = Player.Functions.GetItemByName(item)
    local AvailableDrugs = {}
    if hasItem.amount >= amount then

        TriggerClientEvent('QBCore:Notify', src, 'Offer accepted!', 'success')
        --exports['qb-dispatch']:DrugSale()
        Player.Functions.RemoveItem(item, amount)
        Player.Functions.AddItem("markedbills", price)
		TriggerEvent('cr-logs:server:createLog', 'cornerselling', 'Sold his drugs for ' .. price .. " roll of cash.", "", src)
        -- Player.Functions.AddMoney('cash', price, "sold-cornerdrugs")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")

        for i = 1, #Config.CornerSellingDrugsList, 1 do
            local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

            if item ~= nil then
                AvailableDrugs[#AvailableDrugs+1] = {
                    item = item.name,
                    amount = item.amount,
                    label = QBCore.Shared.Items[item.name]["label"]
                }
            end
        end

        TriggerClientEvent('cr-drugs:client:refreshAvailableDrugs', src, AvailableDrugs)
    else
        TriggerClientEvent('cr-drugs:client:cornerselling', src)
    end
end)

RegisterServerEvent('cr-drugs:server:robCornerDrugs')
AddEventHandler('cr-drugs:server:robCornerDrugs', function(item, amount, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local AvailableDrugs = {}

    Player.Functions.RemoveItem(item, amount)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")

    for i = 1, #Config.CornerSellingDrugsList, 1 do
        local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

        if item ~= nil then
            AvailableDrugs[#AvailableDrugs+1] = {
                item = item.name,
                amount = item.amount,
                label = QBCore.Shared.Items[item.name]["label"]
            }
        end
    end

    TriggerClientEvent('cr-drugs:client:refreshAvailableDrugs', src, AvailableDrugs)
end)