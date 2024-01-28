local QBCore = exports['qb-core']:GetCoreObject() 

local chicken = vehicleBaseRepairCost

RegisterServerEvent('nn-bennys:attemptPurchase')
AddEventHandler('nn-bennys:attemptPurchase', function(type, upgradeLevel)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local balance = Player.PlayerData.money["bank"]

    local price;

    if type == "repair" then
        price = chicken;
    elseif type == "performance" or (vehicleCustomisationPrices[type] and vehicleCustomisationPrices[type].prices) then
        price = vehicleCustomisationPrices[type].prices[upgradeLevel];
    elseif vehicleCustomisationPrices[type] then
        price = vehicleCustomisationPrices[type].price;
    else
        return false;
    end

    if (Player.PlayerData.money.cash >= price) then
        Player.Functions.RemoveMoney('cash', chicken);
        TriggerClientEvent('nn-bennys:purchaseSuccessful', source);
    elseif (Player.PlayerData.money.bank >= price) then
        Player.Functions.RemoveMoney('bank', chicken)
        TriggerClientEvent('nn-bennys:purchaseSuccessful', source)
    else
        TriggerClientEvent('nn-bennys:purchaseFailed', source);
    end
end)

RegisterServerEvent('nn-bennys:updateRepairCost')
AddEventHandler('nn-bennys:updateRepairCost', function(cost)
    chicken = cost
end)

RegisterServerEvent("updateVehicle")
AddEventHandler("updateVehicle", function(myCar)
    QBCore.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `mods` = '"..json.encode(myCar).."' WHERE `plate` = '"..myCar.plate.."'");
end)
