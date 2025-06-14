local QBCore = exports['qb-core']:GetCoreObject()
local PlayerGang = {}
local isInMenu = false
local sleep

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
end)

-- MENU
local menu = MenuV:CreateMenu(false, 'Gang Boss Menu', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'main')
local menu2 = MenuV:CreateMenu(false, 'Society money', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'society')
local menu3 = MenuV:CreateMenu(false, 'Employee Management', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'employees')
local menu4 = MenuV:CreateMenu(false, 'Recruit Menu', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'recruit')

RegisterNetEvent('qb-gangmenu:client:openMenu')
AddEventHandler('qb-gangmenu:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)


local menu_button = menu:AddButton({
    icon = '📋',
    label = 'Employees',
    value = menu3,
    description = 'Manage Employees'
})
local menu_button1 = menu:AddButton({
    icon = '🤝',
    label = 'Recruit',
    value = menu4,
    description = 'Recruit New Members'
})
local menu_button2 = menu:AddButton({
    icon = '📦',
    label = 'Storage',
    value = nil,
    description = 'Personal Storage'
})
local menu_button3 = menu:AddButton({
    icon = '👕',
    label = 'Outfits',
    value = nil,
    description = 'View Outfits'
})
local menu_button4 = menu:AddButton({
    icon = '💰',
    label = 'Society Money',
    value = menu2,
    description = 'View/Manage Society Money'
})
local menu_button5 = menu2:AddButton({
    icon = '💲',
    label = '',
    value = nil,
    description = 'Current Society Amount'
})
local menu_button6 = menu2:AddButton({
    icon = '🤑',
    label = 'Withdraw',
    value = menu2,
    description = 'Withdraw Money From Society'
})
local menu_button7 = menu2:AddButton({
    icon = '🏦',
    label = 'Deposit',
    value = menu2,
    description = 'Deposit Money Into Society'
})

-- Storage
menu_button2:On("select", function()
    MenuV:CloseMenu(menu)
     
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 500,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerGang.name)
end)


RegisterNetEvent('gang:stash')
AddEventHandler('gang:stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 500,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerGang.name)
end)


-- Outfit
menu_button3:On("select", function()
    MenuV:CloseMenu(menu)
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

-- Society
menu_button4:On('select', function()
    UpdateSociety()
end)

-- Withdraw
menu_button6:On("select", function()
    local result = LocalInput('Withdrawal Amount', 16, '')
    if result ~= nil and PlayerGang.name and PlayerGang.isboss then
        TriggerServerEvent("qb-gangmenu:server:withdrawMoney", tonumber(result))
        UpdateSociety()
    else
        QBCore.Functions.Notify('Not High Enough Rank', "error")
    end
end)

-- Deposit
menu_button7:On("select", function()
    local result = LocalInput('Deposit Amount', 16, '')
    if result ~= nil then
        TriggerServerEvent("qb-gangmenu:server:depositMoney", tonumber(result))
        UpdateSociety()
    end
end)

-- Employees
menu_button:On("select", function()
    menu3:ClearItems()
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetEmployees', function(cb)
        for k,v in pairs(cb) do
            local menu_button8 = menu3:AddButton({
                label = v.grade.name.. ' ' ..v.name,
                value = v,
                description = 'Employee',
                select = function(btn)
                    if PlayerGang.name and PlayerGang.isboss then
                    local select = btn.Value
                        ManageEmployees(select)
                    end
                end
            })
        end
    end, PlayerGang.name)
end)

-- Recruit
menu_button1:On("select", function()
    menu4:ClearItems()
    local playerPed = PlayerPedId()
    for k,v in pairs(QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 10.0)) do
        if v and v ~= PlayerId() then
            local menu_button10 = menu4:AddButton({
                label = GetPlayerName(v),
                value = v,
                description = 'Available Recruit',
                select = function(btn)
                    local select = btn.Value
                    TriggerServerEvent('qb-gangmenu:server:giveJob', GetPlayerServerId(v))
                end
            })
        end
    end
end)

-- RegisterCommand("fuel", function()
--     TriggerEvent("cdn-fuel:client:fuel")
-- end)

-- MAIN THREAD
CreateThread(function()
    while true do
        sleep = 1000
        if PlayerGang.name ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Gangs) do
                if k == PlayerGang.name then
                    if #(pos - v) < 1.0 then
                        sleep = 5
                        DrawText3D(v, "~g~E~w~ - Gang Menu")
                        if IsControlJustReleased(0, 38) then
                            MenuV:OpenMenu(menu)
                        end
                    end
                end
            end
        end
      Wait(sleep)
    end
end)

-- FUNCTIONS
function UpdateSociety()
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetAccount', function(cb)
        menu_button5.Label = 'Society Amount: $' ..comma_value(cb)
    end, PlayerGang.name)
end

function ManageEmployees(employee)
    local manageroptions = MenuV:CreateMenu(false, employee.name .. ' Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv')
    manageroptions:ClearItems()
    MenuV:OpenMenu(manageroptions)
    buttons = {
        [1] = {
            icon = '↕️',
            label = "Promote/Demote",
            value = "promote",
            description = "Promote " .. employee.name
        },
        [3] = {
            icon = '🔥',
            label = "Fire",
            value = "Fire",
            description = "Release " .. employee.name
        }
    }
    for k, v in pairs(buttons) do
        if PlayerGang.name and PlayerGang.grade.level >= employee.level then
            local menu_button9 = manageroptions:AddButton({
                icon = v.icon,
                label = v.label,
                value = v.value,
                description = v.description,
                select = function(btn)
                    local values = btn.Value
                    if values == 'promote' then
                        local result = LocalInput('New Grade Level', 3, '')
                        if result ~= nil then
                            TriggerServerEvent('qb-gangmenu:server:updateGrade', employee.empSource, tonumber(result))
                        end
                    else
                        TriggerServerEvent('qb-gangmenu:server:fireEmployee', employee.empSource)
                    end
                end
            })
        end
    end
end

-- UTIL
function DrawText3D(v, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(v, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 0)
    ClearDrawOrigin()
end

function LocalInput(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
        return result
    end
end

function comma_value(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end
