local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateCallback("showroom:purchase2Vehicle", function(source, cb, model, price, amount)
	local src = source;
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local cash = xPlayer.PlayerData.money["cash"]
	local plate = GeneratePlate()
	if xPlayer.PlayerData.money["cash"] >= price  then
        xPlayer.Functions.RemoveMoney('cash', price)
		purchase2Car(src, model, plate)
		cb(true, model)
	else
		TriggerClientEvent('QBCore:Notify', src, 'You dont have a money', 'error')
	end
end)

function purchase2Car(source, model, plate)
	local src = source
    local model = model
    local hashkey = GetHashKey(model)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local cid = xPlayer.PlayerData.citizenid
    local plate = GeneratePlate()
	local garage = ""
	exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, garage, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
		xPlayer.PlayerData.license,
		cid,
		model,
		garage,
		hashkey,
		'{}',
		plate,
		0
	})
	TriggerClientEvent('qb-npvehicleshop2:client:buyShowroomVehicle2', src, model, plate)
	TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your purchase2!', 'success')
end


RegisterNetEvent('qb-vehicleshop:server:buyShowroomVehicle', function(vehicle)
    local src = source
    local vehicle = vehicle.buyVehicle
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local cash = pData.PlayerData.money['cash']
    local bank = pData.PlayerData.money['bank']
    local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
    local plate = GeneratePlate()
    if cash > vehiclePrice then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            0
        })
        TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your purchase!', 'success')
        TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        pData.Functions.RemoveMoney('cash', vehiclePrice, 'vehicle-bought-in-showroom')
        exports['jl-carboost']:AddVIN(plate)
    elseif bank > vehiclePrice then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            0
        })
        TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your purchase!', 'success')
        TriggerClientEvent('qb-npvehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        pData.Functions.RemoveMoney('bank', vehiclePrice, 'vehicle-bought-in-showroom')
        exports['jl-carboost']:AddVIN(plate)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough money', 'error')
    end
end)

function GeneratePlate()
    local plate = math.random(0, 99)..""..GetRandomLetter(3)..""..math.random(0, 999)
    local result = exports.oxmysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    end
    return plate:upper()
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end
