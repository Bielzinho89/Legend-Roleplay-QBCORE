QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateCallback("qb-banking:server:GetBankData", function(source, cb)
    local src = source
    if not src then return end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local PlayerMoney = Player.PlayerData.money["bank"] or 0 
    local CitizenId = Player.PlayerData.citizenid 

    local TransactionHistory = {}
    local TransactionRan = false
    local tbl = {}
    tbl[1] = {
        type = "personal",
        amount = PlayerMoney
    }

    local job = Player.PlayerData.job

    if (job.name and job.grade.name) then
        if(SimpleBanking.Config["business_ranks"][string.lower(job.grade.name)] or SimpleBanking.Config["business_ranks_overrides"][string.lower(job.name)] and SimpleBanking.Config["business_ranks_overrides"][string.lower(job.name)][string.lower(job.grade.name)]) then
            
            local result =  exports["oxmysql"]:executeSync('SELECT * FROM society WHERE name= ?', {job.name})
            local data = result[1]

            if data ~= nil then
                tbl[#tbl + 1] = {
                    type = "business",
                    name = job.label,
                    amount = format_int(data.money) or 0
                }
            end
        end
    end

    local gang = Player.PlayerData.gang

    if (gang.name and gang.grade.name) then
        if(SimpleBanking.Config["business_ranks"][string.lower(gang.grade.name)] or SimpleBanking.Config["business_ranks_overrides"][string.lower(gang.name)] and SimpleBanking.Config["business_ranks_overrides"][string.lower(gang.name)][string.lower(gang.grade.name)]) then

            local result = exports["oxmysql"]:executeSync('SELECT * FROM society WHERE name= ?', {gang.name})
            local data = result[1]

            if data ~= nil then
                tbl[#tbl + 1] = {
                    type = "organization",
                    name = gang.label,
                    amount = format_int(data.money) or 0
                }
            end
        end
    end

    local result = exports["oxmysql"]:executeSync("SELECT * FROM transaction_history WHERE citizenid =  ? AND DATE(date) > (NOW() - INTERVAL "..SimpleBanking.Config["Days_Transaction_History"].." DAY)", {Player.PlayerData.citizenid})

    if result ~= nil then
        TransactionRan = true
        TransactionHistory = result
    end


    repeat
        Wait(0)
    until 
        TransactionRan
    cb(tbl, TransactionHistory)
end)



QBCore.Commands.Add('givecash', 'Give money to players around you.', {{name = 'id', help = 'Player ID'}, {name = 'amount', help = 'Amount'}}, true, function(source, args)
    local src = source
    local id = tonumber(args[1])
    local amount = math.ceil(tonumber(args[2]))
    
    if id and amount then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local xReciv = QBCore.Functions.GetPlayer(id)
        
        if xReciv and xPlayer then
            if not xPlayer.PlayerData.metadata["isdead"] then
                local distance = xPlayer.PlayerData.metadata["inlaststand"] and 3.0 or 10.0
                if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(id))) < distance then
                    if xPlayer.Functions.RemoveMoney('cash', amount) then
                        if xReciv.Functions.AddMoney('cash', amount) then
                            TriggerClientEvent("qb-banking:client:givecashaniamtion", source)
                            TriggerClientEvent('QBCore:Notify', src, "Successful " .. tostring(amount) .. '$ an ID ' .. tostring(id) .. ' given.', "success")
                            TriggerClientEvent('QBCore:Notify', id, tostring(amount) .. '$ from ID ' .. tostring(src).. " receive.", "success")
                        else
                            TriggerClientEvent('QBCore:Notify', src, "Couldn't give the money to the requested ID!", "error")
                        end
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You don't have that much money!", "error")
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You are too far away!", "error")
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You are dead ! WTF?", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Wrong ID!", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "That's the right way to do it: /givecash [ID] [AMOUNT]", "error")
    end
end)