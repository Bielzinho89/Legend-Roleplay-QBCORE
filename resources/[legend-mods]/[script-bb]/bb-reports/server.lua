local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/956891445606879253/E8dbROIVI87Jn-sT0l0EzCeGVDjga8BW-QkOiLgFVnEMY4xBfNxSXg8F75_uV0BXHlqz" --put ur webhook

RegisterServerEvent('log')
AddEventHandler('log', function(data)



    local connect = {
        {
            ["color"] = "125",
            ["title"] = "New Report | " ..data.plate.."-"..data.lastname,
            ["description"] = "Discord Name: \n **"..data.plate.."** \n Report Type: \n **"..data.lastname.."** \n \n What Happened?: \n**"..data.why.."**\n INGAME NAME?:\n **"..data.plate.."**",
	        ["footer"] = {
                ["text"] = "www.fivemm.shop",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "New Report",  avatar_url = "https://media.discordapp.net/attachments/842756916400095232/956892291048550430/logo.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

