local QBCore = exports['qb-core']:GetCoreObject() 

QBCore.Functions.CreateUseableItem('cokebrick', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local brick = GetItem(source, "cokebrick").count >= 1
    local scale = GetItem(source, "hqscale").count >= 1
    local bags = GetItem(source, "empty_weed_bag").count >= 10
    
    if not bags or not brick then
        if not bags then
            TriggerClientEvent("QBCore:Notify",source, "Not enough empty baggies.", 'error')
        else
            TriggerClientEvent("QBCore:Notify",source, "Not enough Cocaine Brick.", 'error')
        end
        return
    end
    
    local maxCokeOutput = 7
        
    if not scale then
        maxCokeOutput = 5
    end

    if GetItem(source, "coke10g").count <= 40 or (not scale and GetItem(source, "coke10g").count <= 44) then
            Player.Functions.RemoveItem("cokebrick",1)
            Player.Functions.RemoveItem("empty_weed_bag",10)
        
            TriggerClientEvent("cr-labs:CocaineBrick10g",source)
        
            Player.Functions.AddItem("coke10g",maxCokeOutput)
        else
        TriggerClientEvent("QBCore:Notify",source, "Your inventory is full.", 'error')
    end
end)

QBCore.Functions.CreateUseableItem('coke10g', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local coke = GetItem(source, "coke10g").count >= 1
    local scale = GetItem(source, "hqscale").count >= 1
    local bags = GetItem(source, "empty_weed_bag").count >= 10
    
    if not bags or not coke then
        if not bags then
            TriggerClientEvent("QBCore:Notify",source, "Not enough empty baggies.", 'error')
        else
            TriggerClientEvent("QBCore:Notify",source, "Not enough Cocaine (10g).", 'error')
        end
        return
    end
    
    local maxCoke1gOutput = 10
        
    if not scale then
        maxCoke1gOutput = 6
    end
    
    if GetItem(source, "cokebaggy").count <= 40 or (not scale and GetItem(source, "cokebaggy").count <= 44) then
        
            Player.Functions.RemoveItem("coke10g",1)
            Player.Functions.RemoveItem("empty_weed_bag",10)
        
            TriggerClientEvent("cr-labs:Cocaine10gCoke1g",source)
        
            Player.Functions.AddItem("cokebaggy",maxCoke1gOutput)
        else
        TriggerClientEvent("QBCore:Notify",source, "Your inventory is full.", 'error')
    end
end)

QBCore.Functions.CreateUseableItem('methbrick', function(source, item)
        
    local Player = QBCore.Functions.GetPlayer(source)
    local brick = GetItem(source, "methbrick").count >= 1
    local scale = GetItem(source, "hqscale").count >= 1
    local bags = GetItem(source, "empty_weed_bag").count >= 10
    
    if not bags or not brick then
        if not bags then
            TriggerClientEvent("QBCore:Notify",source, "Not enough empty baggies.", 'error')
        else
            TriggerClientEvent("QBCore:Notify",source, "Not enough Methamphetamine Brick.", 'error')
        end
        return
    end
    
    local maxMethOutput = 7
        
    if not scale then
        maxMethOutput = 5
    end
    
    if GetItem(source, "meth10g").count <= 40 or (not scale and GetItem(source, "meth10g").count <= 44) then
        
            Player.Functions.RemoveItem("methbrick",1)
            Player.Functions.RemoveItem("empty_weed_bag",10)
        
            TriggerClientEvent("cr-labs:MethBrick10g",source)
        
            Player.Functions.AddItem("meth10g",maxMethOutput)
        else
        TriggerClientEvent("QBCore:Notify",source, "Your inventory is full.", 'error')
    end
end)

QBCore.Functions.CreateUseableItem('meth10g', function(source, item)
        
    local Player = QBCore.Functions.GetPlayer(source)
    local meth = GetItem(source, "meth10g").count >= 1
    local scale = GetItem(source, "hqscale").count >= 1
    local bags = GetItem(source, "empty_weed_bag").count >= 10
    
    if not bags or not meth then
        if not bags then
            TriggerClientEvent("QBCore:Notify",source, "Not enough empty baggies.", 'error')
        else
            TriggerClientEvent("QBCore:Notify",source, "Not enough Methamphetamine (10g).", 'error')
        end
        return
    end
    
    local maxMeth1gOutput = 10
        
    if not scale then
        maxMeth1gOutput = 6
    end
    
    if GetItem(source, "methbag").count <= 40 or (not scale and GetItem(source, "methbag").count <= 44) then
        
            Player.Functions.RemoveItem("meth10g",1)
            Player.Functions.RemoveItem("empty_weed_bag",10)
        
            TriggerClientEvent("cr-labs:Meth10gCoke1g",source)
        
            Player.Functions.AddItem("methbag",maxMeth1gOutput)
        else
        TriggerClientEvent("QBCore:Notify",source, "Your inventory is full.", 'error')
    end
end)

function GetItem(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 0

    for k,v in pairs(Player['PlayerData']['items']) do
        if v.name == item then
            count = count + v.amount
        end
    end
    
    return { name = item, count = count }
end