-- tuner: -44.18402, -1097.083, -40
-- Tuner: 935.63, -968.52, -40.42
-- Fastlane: -795.02, -226.4, -40
local QBCore = exports['qb-core']:GetCoreObject()
local inPolyZone = nil
local showroomOpen = false
local sr
local staticCam
local staticLargeCam
local showLargeCam = false
local isLargeCamActive = false
local camTimer = 0
local vehicle

function CreateShowroomVehicle2(showroom, vehicleName)
  if vehicle then
    DeleteEntity(vehicle)
  end
  RequestModel(vehicleName)

  while not HasModelLoaded(vehicleName) do
    Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(vehicleName)

  if showroom == 'tuner' then
    CalculateCamPos(vehicleName, 18)
    return CreateVehicle(vehicleName, 935.63, -968.52, -43.99, 181.74, false, false)
  elseif showroom == 'tuner' then
    CalculateCamPos(vehicleName, 18)
    return CreateVehicle(vehicleName, 935.63, -968.52, -43.99, 181.74, false, false)
  elseif showroom == 'fastlane' then
    CalculateCamPos(vehicleName, 15.5)
    return CreateVehicle(vehicleName, -794.1, -226.18, -43.38, 78.68, false, false)
  end
end

function RenderStaticCam(showroom)
  if not showroomOpen then
    return
  end
  staticCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
  if (showroom == 'tuner') then -- if (showroom == 'fastlane') then
    SetCamCoord(staticCam, 938.49, -972.12, -43.0)
    SetCamRot(staticCam, -15.0, 0.0, 47.45)
    SetFocusPosAndVel(938.49, -972.12, -41.3, 0.0, 0.0, 0.0)
  elseif showroom == 'tuner' then
    SetCamCoord(staticCam, 938.49, -972.12, -43.0)
    SetCamRot(staticCam, -15.0, 0.0, 47.45)
    SetFocusPosAndVel(938.49, -972.12, -41.3, 0.0, 0.0, 0.0)
  elseif showroom == 'tuner' then
    SetCamCoord(staticCam, 938.49, -972.12, -43.0)
    SetCamRot(staticCam, -15.0, 0.0, 47.45)
    SetFocusPosAndVel(938.49, -972.12, -41.3, 0.0, 0.0, 0.0)
  end
  SetCamFov(staticCam, 50.0)
  RenderScriptCams(true, false, 0, 1, 0)
end

function CalculateCamPos(model, largeCamSize)
  local minDim, maxDim = GetModelDimensions(model)
  local modelSize = maxDim - minDim
  local modelVolume = modelSize.x * modelSize.y * modelSize.z
  showLargeCam = modelVolume > largeCamSize
  camTimer = 1000
end

function openShowroom2(showroom)
  showroomOpen = true
  sr = showroom
  SendNUIMessage({shop = sr })
  Wait(250)
  -- exports["np-ui"]:hideInteraction()
  Citizen.CreateThread(function()
    Wait(1000)
    if sr == "tuner" then
      TriggerEvent("inhotel", true)
    end
    RenderStaticCam(sr)
  end)
  Citizen.CreateThread(function()
    while showroomOpen do
      if camTimer > 0 then
        camTimer = camTimer - 500
      elseif showLargeCam then
        if not isLargeCamActive then
          staticLargeCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
          SetCamCoord(staticLargeCam, GetCamCoord(staticCam))
          SetCamRot(staticLargeCam, GetCamRot(staticCam, 2))
          SetCamFov(staticLargeCam, 70.0)
          SetCamActiveWithInterp(staticLargeCam, staticCam, 1000, 100, 0)
          isLargeCamActive = true
        end
      elseif isLargeCamActive then
        SetCamActiveWithInterp(staticCam, staticLargeCam, 1000, 100, 0)
        isLargeCamActive = false
      end
      Wait(500)
    end
  end)
end

RegisterNUICallback("np-ui:application-closed2", function(data, cb)
  if data.name ~= "showroom" then return end
  Citizen.CreateThread(function()
    showroomOpen = false
    if sr == "tuner" then
      TriggerEvent("inhotel", false)
    end
    DoScreenFadeOut(0)
    Wait(400)
    DoScreenFadeIn(1000)
    SetNuiFocus(false, false)
    ClearFocus()
    RenderScriptCams(false, false, 0, 1, 0)
    DeleteEntity(vehicle)
  end)
end)

local function getField(field)
  return GetVehicleHandlingFloat(vehicle, 'CHandlingData', field)
end

local statsCache = {}
local function calculateStats()
  local info = {}

  local model = GetEntityModel(vehicle)
  local brand = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, model, Citizen.ResultAsString()))

  if statsCache[model] then return statsCache[model].info, statsCache[model].vehClass, statsCache[model].brand end

  local isMotorCycle = IsThisModelABike(model)

  local fInitialDriveMaxFlatVel = getField("fInitialDriveMaxFlatVel")
  local fInitialDriveForce = getField("fInitialDriveForce")
  local fDriveBiasFront = getField("fDriveBiasFront")
  local fInitialDragCoeff = getField("fInitialDragCoeff")
  local fTractionCurveMax = getField("fTractionCurveMax")
  local fTractionCurveMin = getField("fTractionCurveMin")
  local fSuspensionReboundDamp = getField("fSuspensionReboundDamp")
  local fBrakeForce = getField("fBrakeForce")
  local force = fInitialDriveForce
  if fInitialDriveForce > 0 and fInitialDriveForce < 1 then
    force = force * 1.1
  end
  local accel = (fInitialDriveMaxFlatVel * force) / 10
  info[#info + 1] = { name = "Acceleration", value = accel }
  local speed = ((fInitialDriveMaxFlatVel / fInitialDragCoeff) * (fTractionCurveMax + fTractionCurveMin)) / 40
  if isMotorCycle then
    speed = speed * 2
  end
  info[#info + 1] = { name = "Speed", value = speed }
  local handling = (fTractionCurveMax + fSuspensionReboundDamp) * fTractionCurveMin
  if isMotorCycle then
    handling = handling / 2
  end
  info[#info + 1] = { name = "Handling", value = handling }
  local braking = ((fTractionCurveMin / fInitialDragCoeff) * fBrakeForce) * 7
  info[#info + 1] = { name = "Braking", value = braking }
  local perfRating = ((accel * 5) + speed + handling + braking) * 15
  local vehClass = "F"
  if isMotorCycle then
    vehClass = "M"
  elseif perfRating > 900 then
    vehClass = "X"
  elseif perfRating > 700 then
    vehClass = "S"
  elseif perfRating > 550 then
    vehClass = "A"
  elseif perfRating > 400 then
    vehClass = "B"
  elseif perfRating > 325 then
    vehClass = "C"
  else
    vehClass = "D"
  end
  statsCache[model] = { info = info, vehClass = vehClass, brand = brand }
  return info, vehClass, brand
end

RegisterNUICallback("np-ui:aracdegis", function(data, cb)
  vehicle = CreateShowroomVehicle2(sr, data.model)
  SetVehicleDirtLevel(vehicle, 0.0)
  local info, vehClass, brand = calculateStats()
  cb({ data = { info = info, vehClass = vehClass, brand = brand }, meta = { ok = true, message = 'done' } })
end)

AddEventHandler("np-tunershop:enterExperiencee", function()
  openShowroom2("tuner")
  SetNuiFocus(true, true)
end)


Citizen.CreateThread(function()
  exports['qb-target']:AddCircleZone("showroom2", vector3(131.03712, -3007.645, 7.0408883), 0.9, {
    name = "hospitalstash",
    --radius = 0.3
    debugPoly = false,
    --heading=250,
}, {
    options = {
        {
            event = "np-tunershop:enterExperiencee",
            icon = "fas fa-car",
            label = "View Catalog"
        },
    },
    job = {"all"},
    distance = 1.5
})
end)



-- local targetActive = false
-- AddEventHandler("np:target:changed", function(pEntity, pEntityType)
--   if not pEntity or pEntityType ~= 3 then
--     if targetActive then
--       targetActive = false
--       isInsideZone = false
--       exports["np-ui"]:hideInteraction()
--     end
--     return
--   end
--   if GetEntityModel(pEntity) == 1723506536 and not targetActive then
--     targetActive = true
--     exports["np-ui"]:showInteraction("[E] View Catalog")
--     listenForKeypress(inPolyZone)
--   elseif GetEntityModel(pEntity) ~= 1723506536 and targetActive then
--     targetActive = false
--     isInsideZone = false
--     exports["np-ui"]:hideInteraction()
--   end
-- end)


RegisterCommand("showroom", function()
  sr = "tuner"
  openShowroom2(sr)
  SetNuiFocus(true, true)
end)