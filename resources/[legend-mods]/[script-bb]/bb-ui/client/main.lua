
Config = {}
Config.Bennytext = {
	[1] = {coords = vector3(-210.0, -1320.4, 30.17), distance = 5, key = 38, eventname = 'event:control:bennys1', text = '[E] Bennys'},
	[2] = {coords = vector3(-306.52, -987.24, 30.36), distance = 5, key = 47, eventname = 'example:testevent', text = 'Parking'},
	[3] = {coords = vector3(-298.7, -989.29, 30.36), distance = 5, key = 74, eventname = 'example:testevent', text = 'Parking'},
	[4] = {coords = vector3(-240.55, -1260.54, 29.96), distance = 5, key = 38, eventname = 'example:testevent', text = 'Test'},
	[5] = {coords = vector3(-323.35, -981.79, 30.39), distance = 5, key = 47, eventname = 'example:testevent', text = 'Parking'},
	[6] = {coords = vector3(-298.7, -989.29, 30.36), distance = 5, key = 74, eventname = 'example:testevent', text = 'Parking'},
	[7] = {coords = vector3(-191.9, -1162.29, 23.67), distance = 5, key = 38, eventname = 'example:testevent', text = 'Impound'},
	[8] = {coords = vector3(-37.46, -1103.86, 26.42), distance = 5, key = 47, eventname = 'example:testevent', text = 'Pdm'},
	[9] = {coords = vector3(19.13, -1110.36, 29.8), distance = 5, key = 74, eventname = 'example:testevent', text = 'Ammunation'},
	[10] = {coords = vector3(112.27, -1086.63, 28.49), distance = 5, key = 38, eventname = 'example:testevent', text = 'Vehicle Rental'},
	[11] = {coords = vector3(150.23, -1040.85, 29.37), distance = 5, key = 47, eventname = 'example:testevent', text = 'Bank'},
	[12] = {coords = vector3(427.28, -980.95, 30.71), distance = 8, key = 74, eventname = 'example:testevent', text = 'Police Department'},
	[13] = {coords = vector3(224.63, -787.97, 30.73), distance = 18, key = 74, eventname = 'example:testevent', text = 'Pillbox Garage'},
	[14] = {coords = vector3(296.47, -584.2, 42.72), distance = 15, key = 74, eventname = 'example:testevent', text = 'Pillbox Hospital'},
	[15] = {coords = vector3(276.15, -330.5, 44.5), distance = 15, key = 74, eventname = 'example:testevent', text = 'Parking'},
	[16] = {coords = vector3(374.53, 325.66, 103.57), distance = 5, key = 74, eventname = 'example:testevent', text = 'Shop'},
    [17] = {coords = vector3(449.88, -976.21, 25.0), distance = 5, key = 38, eventname = 'event:control:bennys2', text = '[E] Police Workshop'},
    [18] = {coords = vector3(-34.3, -1052.92, 27.72), distance = 5, key = 38, eventname = 'event:control:bennys1', text = '[E] Bennys'},
    [19] = {coords = vector3(544.39, -179.3, 53.82), distance = 7, key = 38, eventname = 'event:control:bennys1', text = '[E] Auto Exotic'},
    [20] = {coords = vector3(482.31, -995.27, 30.69), distance = 1, key = 38, eventname = 'example:testevent', text = '[E] Police Armory'},
    [21] = {coords = vector3(480.86, -989.93, 30.69), distance = 1, key = 38, eventname = 'example:testevent', text = '[E] Personal Locker'},
    [22] = {coords = vector3(473.12, -996.33, 26.27), distance = 1, key = 38, eventname = 'example:testevent', text = '[E] Trash'},
    [23] = {coords = vector3(472.37, -1014.97, 26.27), distance = 3, key = 38, eventname = 'example:testevent', text = '[E] Scan Fingerprint'},
    [24] = {coords = vector3(473.31, -1007.55, 26.27), distance = 3, key = 38, eventname = 'example:testevent', text = 'Evidence'},
    [25] = {coords = vector3(447.69, -997.55, 30.68), distance = 3, key = 38, eventname = 'example:testevent', text = 'Evidence'},
    [26] = {coords = vector3(475.08, -997.44, 26.27), distance = 3, key = 38, eventname = 'example:testevent', text = 'Evidence'},
    [27] = {coords = vector3(457.63, -1009.76, 28.31), distance = 2, key = 38, eventname = 'example:testevent', text = 'PD Impound'},
    [28] = {coords = vector3(448.81, -981.07, 43.69), distance = 2, key = 38, eventname = 'example:testevent', text = '[E] Spawn/Store Helicopter'},
    [29] = {coords = vector3(332.22, -595.94, 43.28), distance = 2, key = 38, eventname = 'example:testevent', text = '[E] Basement'},
    [30] = {coords = vector3(345.72, -582.53, 28.8), distance = 2, key = 38, eventname = 'example:testevent', text = '[E] Groundfloor'},
}





Citizen.CreateThread(function()
    local alreadyEnteredZone = false
    local text = nil
    while true do
        wait = 2
        local ped = PlayerPedId()
        local inZone = false
        for cd = 1, #Config.Bennytext do
            local dist = #(GetEntityCoords(ped)-vector3(Config.Bennytext[cd].coords.x, Config.Bennytext[cd].coords.y, Config.Bennytext[cd].coords.z))
            if dist <= Config.Bennytext[cd].distance then
                wait = 2
                inZone  = true
                text = Config.Bennytext[cd].text

                if IsControlJustReleased(0, Config.Bennytext[cd].key) then
                    TriggerEvent(Config.Bennytext[cd].eventname)
                end
                break
            else
                wait = 2000
            end
        end
        
        if inZone and not alreadyEnteredZone then
            alreadyEnteredZone = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', text)
        end

        if not inZone and alreadyEnteredZone then
            alreadyEnteredZone = false
            TriggerEvent('cd_drawtextui:HideUI')
        end
        Citizen.Wait(wait)
    end
end)