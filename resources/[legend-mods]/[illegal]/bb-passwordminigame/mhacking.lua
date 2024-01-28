RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenHackingGame(rakamsayisi, callback)
    Callbackk = callback
	SetNuiFocus(true, false)
	SendNUIMessage({
        type = "open", 
        rakamsayisi = rakamsayisi,
    })
end