local QBCore = exports['qb-core']:GetCoreObject() 

local SeatsTaken = {}

-- SEATS
RegisterServerEvent('cr-chairs:sitChair:server')
AddEventHandler('cr-chairs:sitChair:server', function(object)
	table.insert(SeatsTaken, object)
end)

RegisterServerEvent('cr-chairs:getup:server')
AddEventHandler('cr-chairs:getup:server', function(object)
	local _SeatsTaken = {}
	for i=1, #SeatsTaken, 1 do
		if object ~= SeatsTaken[i] then
			table.insert(_SeatsTaken, SeatsTaken[i])
		end
	end
	SeatsTaken = _SeatsTaken
end)

RegisterServerEvent('sit-chairs:getChairId:server')
AddEventHandler('sit-chairs:getChairId:server', function(id)
    local found = false

	if SeatsTaken[id] ~= nil then
		found = true
	end
    TriggerClientEvent('cr-chairs:getChairId', source, found)
end)