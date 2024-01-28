Citizen.CreateThread(function()
    RequestIpl("bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo") -- Cocaine Lab
    EnableInteriorProp(247553, "set_up")
    EnableInteriorProp(247553, "security_high")
    EnableInteriorProp(247553, "equipment_upgrade")
    EnableInteriorProp(247553, "production_upgrade")
    EnableInteriorProp(247553, "coke_press_upgrade")
    EnableInteriorProp(247553, "table_equipment_upgrade")
    EnableInteriorProp(247553, "coke_cut_01")
    EnableInteriorProp(247553, "coke_cut_02")
    EnableInteriorProp(247553, "coke_cut_03")
    EnableInteriorProp(247553, "coke_cut_04")
    EnableInteriorProp(247553, "coke_cut_05")
    -----------------------------------------------------------------------------------------------
    RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo") -- Meth Lab
    EnableInteriorProp(247041, "meth_lab_upgrade")
    EnableInteriorProp(247041, "meth_lab_production")
    EnableInteriorProp(247041, "meth_lab_security_high")
    EnableInteriorProp(247041, "meth_lab_setup")
end)

-- Citizen.CreateThread(function()
--    RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
--    local interiorID = GetInteriorAtCoords(945.78, -1136.98, 11.65)
--    if (not IsInteriorReady(interiorID)) then
--     Wait(1)
--     end
--    EnableInteriorProp(interiorID, "meth_lab_upgrade")
--    EnableInteriorProp(interiorID, "meth_lab_production")
--    EnableInteriorProp(interiorID, "meth_lab_security_high")
--    EnableInteriorProp(interiorID, "meth_lab_setup")
-- end)