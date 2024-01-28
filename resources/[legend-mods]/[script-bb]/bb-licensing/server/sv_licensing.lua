local QBCore = exports['qb-core']:GetCoreObject() 

QBCore.Functions.CreateUseableItem("customlicense", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.PlayerData.items[item.slot]
    if ItemData.info.bname ~= nil then
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            local PlayerPed = GetPlayerPed(source)
            local TargetPed = GetPlayerPed(v)
            local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
            if dist < 3.0 then
                TriggerClientEvent('chat:addMessage', v,  {
                    template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Business Name:</strong> {1} <br><strong>Business Owner:</strong> {2} <br><strong>Business Type:</strong> {3} <br><strong>Issue Date:</strong> {4} <br><strong>Expiry Date:</strong> {5} <br><strong>Issuing Authority:</strong> {6} </div></div>',
                    args = {'Business License', item.info.bname, item.info.bowner, item.info.btype, item.info.idate, item.info.edate, item.info.iname}
                })
            end
        end

        if ItemData.description == 'Custom License' then 

            Player.PlayerData.items[item.slot].description = 
            "<p><strong>Business Name: </strong><span>" ..
            ItemData.info.bname ..
            "</span></p><p><strong>Business Owner: </strong><span>" ..
            ItemData.info.bowner ..
            "</span></p><p><strong>Business Type: </strong><span>" ..
            ItemData.info.btype ..
            "</span></p><p><strong>Reg. Address: </strong><span>" ..
            ItemData.info.baddress ..
            "</span></p><p><strong>Issue Date: </strong><span>" ..
            ItemData.info.idate ..
            "</span></p><p><strong>Expiry Date: </strong><span>" ..
            ItemData.info.edate ..
            "</span></p><p><strong>Issuing Authority: </strong><span>" ..
            ItemData.info.iname ..
            "</span></p>"

            Player.Functions.SetInventory(Player.PlayerData.items, true)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'This License is not valid.')
    end
end)

RegisterServerEvent('cr-licensing:server:NewLicense')  
AddEventHandler('cr-licensing:server:NewLicense', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    
    if data ~= nil then
        Player.Functions.AddItem('customlicense', 1, false, data)
        TriggerClientEvent('QBCore:Notify', src, 'You issued a new License! It is added to your Inventory.', 'success', 8000)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["customlicense"], "add")
    end
end)