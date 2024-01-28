
Utils = {
    --[[ _U3 = "1",
    _P = "1",
    _S1 = "11",
    _S2 = "",
    _S3 = "1",
    _S4 = "1",
    _T = "1",
    _U2 = "1",
    _E = 201,
    _M = (Config and Config.Email or ""),
    _R = (Config and Config.Receipt or ""),
    _GG = load ]]
}


Utils.event = function(net, func, name)
    if net then
        RegisterNetEvent(name)
    end
    AddEventHandler(name, func)
end
Utils.thread = function(func)
    Citizen.CreateThread(func)
end
