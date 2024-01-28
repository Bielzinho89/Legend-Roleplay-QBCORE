local QBCore = exports['qb-core']:GetCoreObject() 
RegisterNetEvent('cr-licensing:OpenUI')
AddEventHandler('cr-licensing:OpenUI', function()
	OpenShopMenu()
end)

RegisterNUICallback("submitform", function(data, cb)
	SetNuiFocus(false, false)

	local check = true
	for k,v in pairs(data) do 
		if v == '' then 
			check = false
			break
		end
	end

	if check then
		TriggerServerEvent('cr-licensing:server:NewLicense', data)
	end
end)

RegisterNUICallback("exit",	function(data, cb)
	SetNuiFocus(false, false)
end)

function OpenShopMenu()
    SetNuiFocus(true, true)
    SendNUIMessage(
		{
			type = "open_lic",
		}
	)
end