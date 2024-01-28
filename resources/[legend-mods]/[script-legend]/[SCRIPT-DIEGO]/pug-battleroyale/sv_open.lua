local QBCore = exports[Config.CoreName]:GetCoreObject()

for k, v in pairs(Config.RoyaleLoot) do
	QBCore.Functions.CreateUseableItem(v.name, function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1) then
			TriggerClientEvent('Pug:client:UseRoyaleItem', source, item)
		end
	end)
end
QBCore.Functions.CreateUseableItem('pug-vr', function(source, item)
    if Config.HasPaintball then
        TriggerClientEvent('Pug:client:ViewBattleGameMenus', source, item)
    else
        TriggerClientEvent('Pug:client:ViewBattleRoyale', source, item)
    end
end)
RegisterServerEvent('Pug:server:BothVRGamesMenus', function()
    if Config.HasPaintball then
        TriggerClientEvent('Pug:client:ViewBattleGameMenus', source)
    else
        TriggerClientEvent('Pug:client:ViewBattleRoyale', source)
    end
end)
RegisterServerEvent('Pug:server:SaveRoyaleItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local PlayerItems = Player.PlayerData.items
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		if Config.Debug then
			print(Result[1].gameitems, 'data table')
		end
		if Result[1].gameitems == "nothing" then
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { json.encode(PlayerItems), CitizenId })
		end
	else
		if Config.Debug then
			print('data table not found')
		end
		MySQL.insert.await('INSERT INTO pug_paintball (citizenid, gameitems, kills, deaths, wins) VALUES (?,?,?,?,?)', {
			CitizenId, json.encode(PlayerItems), 0, 0, 0
		})
	end
	Wait(200)
	Player.Functions.ClearInventory(src)
	if Config.Debug then
		print('clearing ' .. src)
	end
end)
RegisterServerEvent('Pug:server:GiveRoyaleItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		Wait(1000)
		if Config.Debug then
			print(Result[1].gameitems, 'data table2')
		end
		if Result[1].gameitems == "nothing" then
		else
            for k, v in pairs(json.decode(Result[1].gameitems)) do
                if tostring(string.lower(Config.InventoryType)) == "qb" then
                    exports["qb-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
				elseif tostring(string.lower(Config.InventoryType)) == "lj" then
					exports["lj-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
                elseif tostring(string.lower(Config.InventoryType)) == "ox" then 
                    local ox_inventory = exports.ox_inventory
                    if Config.Debug then
                        print(v.count, "count")
                    end
                    ox_inventory:AddItem(src, v.name, v.count, v.metadata, v.slot)
                else
                    Player.Functions.AddItem(v.name, v.amount, false, v.info)
                end
            end
			Wait(500)
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { "nothing", CitizenId })
		end
	end
end)
