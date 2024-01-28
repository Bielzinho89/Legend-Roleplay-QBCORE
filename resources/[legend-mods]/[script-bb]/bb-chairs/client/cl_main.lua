local QBCore = exports['qb-core']:GetCoreObject() 

local sitting = false
local pos = nil
local lastPos = nil
local currentScenario = nil
local data = nil
local object = nil
local id = 0
local distance = 0

Citizen.CreateThread(function()
	local Sitables = {}

	for k, v in pairs(Config.Props) do
		table.insert(Sitables, GetHashKey(v))
	end

	exports['qb-target']:AddTargetModel(Sitables, {
        options = {
            {
                event = "cr-chairs:chairSit",
                icon = "fas fa-chair",
                label = "Sit",
            },
        },
        job = {"all"},
        distance = 1.5
    })

	while true do
		Citizen.Wait(100)

		if sitting and not IsPedUsingScenario(PlayerPedId(), currentScenario) then
			Standup()
		end
	end
end)

Citizen.CreateThread(function()
    while true do
     Wait(1)
    if IsControlJustPressed(1, 73) then
        if sitting then
            Standup()
        end
    end
    end
end)

RegisterNetEvent('cr-chairs:chairSit', function()
    if not IsPedInAnyVehicle(PlayerPedId()) then
        if sitting then
            Standup()
        else
            object, distance = GetNearChair()

            if distance < 1.5 then
                local hash = GetEntityModel(object)
                data = nil
                local modelName = nil
                local found = false
                for k,v in pairs(Config.Sitable) do
                    if GetHashKey(k) == hash then
                        data = v
                        modelName = k
                        found = true
                        break
                    end
                end

                if found then
                    sit(object, modelName, data)
                end
            else
                QBCore.Functions.Notify('You are not near something to sit on.', 'error')
            end
        end
    else
        QBCore.Functions.Notify('You cant sit on a chair whlist in vehicle.', 'error')
    end
end)

function GetNearChair()
	local obj, dist
	local coords = GetEntityCoords(PlayerPedId())
	for i=1, #Config.Props do
		obj = GetClosestObjectOfType(coords, 3.0, GetHashKey(Config.Props[i]), false, false, false)
		dist = #(coords - GetEntityCoords(obj))
		if dist < 1.6 then
			return obj, dist
		end
	end
	return nil, nil
end

function Standup()
    local playerPed = PlayerPedId()
	ClearPedTasks(playerPed)
	sitting = false
	--SetEntityCoords(playerPed, lastPos)
	FreezeEntityPosition(playerPed, false)
    TriggerServerEvent('cr-chairs:getup:server', id)
    id = 0
	currentScenario = nil
end

function sit(object)
	pos = GetEntityCoords(object)
	id = math.random(11111, 99999)
    TriggerServerEvent('sit-chairs:getChairId:server', id)
end

RegisterNetEvent('cr-chairs:getChairId', function(occupied)
    if occupied then
        QBCore.Functions.Notify('Someone is already sitting on that chair.', 'error')
        id = 0
        currentScenario = nil
    else
        local playerPed = PlayerPedId()
        lastPos = GetEntityCoords(playerPed)
        TriggerServerEvent('cr-chairs:sitChair:server', id)
        currentScenario = data.scenario
        TaskStartScenarioAtPosition(playerPed, currentScenario, pos.x, pos.y, pos.z - data.verticalOffset, GetEntityHeading(object) + 180.0, 0, true, true)
        sitting = true
    end
end)