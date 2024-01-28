-- Crucial for scenes.
mLibs = exports["meta_libs"]

Config = {
  Lang              = 'en',           -- Currently only supports en.
  Debug             = true,          -- Remove after testing.
  ShowDebugText     = false,          -- Display drawtext for zone? Mostly used for debugging.

  InteractControl   = 38,             -- Control code to interact with most things.
  SlingDrugsControl = 47,             -- Hotkey to sling drugs.
  SlingByHotkey     = true,           -- If false must use /slingdrugs command
  InteractDist      = 2.0,            -- Distance to interact with things.
  InfluenceInHouse  = false,          -- Gain influence inside playerhousing?

  InfluenceTick     = 5,           -- how long between influence gain/loss tick?

  DisplayZoneForAll = false,           -- Display territory zone blips for all?
  DrugProcessBlip   = false,           -- Display drug process blip for gang members?

  MaxPlayerCount    = 150,             -- Change if using onesync I guess?
  StartEvent        = 'Thread',       -- If you don't want to start the mod by Citizen.CreateThread, change from "Thread" to your event name.
                                      -- NOTE: Must be client event/non-networked event.

  DrugSellDist      = 10.0,           -- Distance peds will buy drugs from
  DrugBuyChance     = 50,             -- % Chance for ped to buy drugs from a player.
  SalesReportChance = 1,              -- % Chance for ped to report player to police if they didn't buy the drugs.
  SellDrugsTimer    = 5000,           -- How long does the drug deal take? (MS)
  MinSellAmount     = 1,              -- Minimum amount of drugs to sell
  MaxSellAmount     = 20,             -- Max amount of drugs to sell

  DirtyReward       = false,           -- For drug deals. If false, receive clean money.
  DirtyAccount      = 'black_money',  -- For many things. Make sure you set this properly.

  SetJobEvent       = 'db:setJob',   -- Probably don't change this if you're using .
  SetJob2Event      = 'db:setJob2',  -- If youre using job2...

  UsingItemLimit    = true,           -- if using  item limits
  UsingWeightLimit  = false,          -- if using  item weight

  SqlSaveTimer      = 5,              -- minutes for zone influence to save to database

  SmackCheaters     = false,           -- SmackCheaters will kill players who try to duplicate items during production.

  PoliceJobs = {
    'police',                         -- The police job names.
    'police',
  },

  GangJobs = {                        -- List all jobs that are able to contest for and control territories here.
    "police",                          -- NOTE: Don't need to include police. Thats taken from PoliceJobs table above.
    "police",
    "police",
    "mechanic",
  }
}



-- The color for the blip when gang/job is controlling zone.
BlipColors = {
  police  = 0,
  grove   = 2,
  ballas  = 7,
  vagos   = 70,
  lostmc  = 1,
}

-- Colors for drawtext.
TextColors = {
  police  = "white",              
  mechanic   = "green",
  ballas  = "purple",
  vagos   = "yellow",
  lostmc  = "red",
}

-- Don't touch.
_U = Langs[Config.Lang]  

Territories = {
  ["Davis"] = {
    openzone  = true,
    control   = "grove",
    influence = 100.0,
    zone      = "DAVIS",

    canSell = false,

    areas = {
      [1] = {
        location  = vector3(53.95,-1818.36,27.66),
        width     = 390.0,
        height    = 210.0,
        heading   = 50,
        display   = 3
      },
      [2] = {
        location  = vector3(169.062, -1587.663, 77.28895),
        width     = 260.0,
        height    = 300.0,
        heading   = 50,
        display   = 3
      },
      [3] = {
        location  = vector3(-159.324, 6321.624, 31.581),
        width     = 260.0,
        height    = 600.0,
        heading   = 50,
        display   = 3
      }, 
    },

    blipData = {

    },

    -- WEED GROW HOUSE
    actions = {
      ["entry"] = {
        helpText = _U["enter_growhouse"],
        location = vector3(215.89743, -1862.001, 30.862939),
      },
      ["exit"] = {
        helpText = _U["leave_growhouse"],
        location = vector3(1066.28, -3183.46, -39.16),
      },
      ["trim_plant"] = {
        helpText    = _U["trim_plant"],
        progText    = _U["trim_plant_prog"],

        requireRate = 4,
        requireRate2 = 1,
        requireItem = true,
        requireItem2 = true,
        requireItem = "cannabis",
        requireItem2 = "empty_weed_bag",
        rewardItem  = "weed_ak47",
        rewardRate  = 1,

        location    = vector3(1038.14,-3205.45,-38.16),
        offset      = vector3(-0.3, 0.4, 0.96),
        rotation    = vector3(0.0, 0.0, 90.0),
        time        = 30000,
        act         = "Weed",
        id          = 1,
        scene       = 2,
      },
      ["trim_plant2"] = {
        helpText    = _U["trim_plant"],
        progText    = _U["trim_plant_prog"],

        requireRate = 4,
        requireRate2 = 1,
        requireItem = true,
        requireItem2 = true,
        requireItem = "cannabis",
        requireItem2 = "empty_weed_bag",
        rewardItem  = "weed",
        rewardRate  = 1,

        location    = vector3(1033.6508, -3205.723, -38.16),  
        offset      = vector3(-0.3, 0.4, 0.96),
        rotation    = vector3(0.0, 0.0, 90.0),
        time        = 30000,
        act         = "Weed",
        id          = 2,
        scene       = 2,
      },
    }
  },

  -- CHAMBERLAIN HILLS
  ["ChamberlainHills"] = {
    openzone  = true,
    control   = "ballas",
    influence = 100.0,
    zone      = "NCHU",

    canSell = false,

    areas = {
      [1] = {
        location  = vector3(-147.9323, -1600.784, 38.29156),
        width     = 200.0,
        height    = 280.0,
        heading   = 50,
        display   = 3
      },
    },

    blipData = {

    },

    -- METH LABORATORY
    actions = {
      ["entry"] = {
        helpText = _U["enter_methlab"],
        location = vector3(-2175.593, 4294.9042, 49.061088),
      },
      ["exit"] = {
        helpText = _U["leave_methlab"],
        location = vector3(997.0199, -3200.684, -36.39373),
      },
      ["cook_meth"] = {
        helpText    = _U["cook_meth"],
        progText    = _U["cook_meth_prog"],

        requireRate = 2, 
        requireItem = true,
        requireRate2 = 2, 
        requireItem2 = true,
        requireItem = "sodiumhydroxide",
        requireItem2 = "propene",
        rewardItem  = "methboil",
        rewardRate  = 2,

        location    = vector3(1005.80,-3200.40,-38.90),
        offset      = vector3(-4.88,-1.95,0.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 73000,
        act         = "Meth",
        id          = 3,
        scene       = 1,
      },
      ["package_meth"] = {
        helpText    = _U["package_meth"],
        progText    = _U["package_meth_prog"],

        requireItem = true,
        requireItem2 = true,
        requireRate = 2, 
        requireRate2 = 2, 
        requireItem = "methbag",
        requireItem2 = "methboil",
        rewardItem  = "blue_meth",
        rewardRate  = 2,

        location    = vector3(1011.80,-3194.90,-38.99),
        offset      = vector3(4.48,1.7,1.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 50000,
        act         = "Meth",
        id          = 4,
        scene       = 2,
      },
    }
  },

  -- RANCHO
  ["Rancho"] = {
    openzone  = true,
    control   = "vagos",
    influence = 100.0,
    zone      = "CYPRE",

    canSell = false,

    areas = {
      [1] = {
        location  = vector3(320.2412, -2039.633, 28.96141),
        width     = 290.0,
        height    = 220.0,
        heading   = 50,
        display   = 3
      },
      [2] = {
        location  = vector3(413.2437, -1782.743, 40.27221),
        width     = 370.0,
        height    = 300.0,
        heading   = 50,
        display   = 3
      },
      [3] = {
        location  = vector3(-1897.938, 2059.712, 140.909),
        width     = 370.0,
        height    = 300.0,
        heading   = 50,
        display   = 3
      },  
    },

    blipData = {

    },

    -- COCAINE FACTORY
    actions = {
      ["entry"] = {
        helpText = _U["enter_cokelab"],
        location = vector3(850.59497,-2504.307,40.723716),
      },
      ["exit"] = {
        helpText = _U["leave_cokelab"],
        location = vector3(1088.74, -3187.61, -38.99),
      },
      ["gather_cocaine1"] = {
        helpText    = _U["gather_cocaine"],
        progText    = _U["gather_cocaine_prog"],

        requireRate = 1, 
        requireRate2 = 2, 
        requireItem = true,
        requireItem2 = true,
        requireItem = "coke_brick",
        requireItem2 = "empty_weed_bag",
        rewardItem  = "coke_small_brick",
        rewardRate  = 2,

        location    = vector3(1093.18,-3194.925,-39.60),
        offset      = vector3(1.911,0.31,0.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 25000,
        act         = "Cocaine",
        id          = 5,
        scene       = 1,
      },
      ["gather_cocaine2"] = {
        helpText    = _U["gather_cocaine"],
        progText    = _U["gather_cocaine_prog"],

        requireRate = 1, 
        requireRate2 = 2, 
        requireItem = true,
        requireItem2 = true,
        requireItem = "coke_brick",
        requireItem2 = "empty_weed_bag",
        rewardItem  = "coke_small_brick",
        rewardRate  = 2,

        location    = vector3(1095.3569, -3194.769, -39.60),
        offset      = vector3(1.911,0.31,0.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 25000,
        act         = "Cocaine",
        id          = 7,
        scene       = 1,
      },
      ["gather_cocaine3"] = {
        helpText    = _U["gather_cocaine"],
        progText    = _U["gather_cocaine_prog"],

        requireRate = 1, 
        requireRate2 = 2, 
        requireItem = true,
        requireItem2 = true,
        requireItem = "coke_brick",
        requireItem2 = "empty_weed_bag",
        rewardItem  = "coke_small_brick",
        rewardRate  = 2,

        location    = vector3(1090.5341, -3194.81, -39.60),
        offset      = vector3(1.911,0.31,0.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 25000,
        act         = "Cocaine",
        id          = 8,
        scene       = 1,
      },
      ["package_cocaine"] = {
        helpText    = _U["package_cocaine"],
        progText    = _U["package_cocaine_prog"],

        requireItem = true,
        requireItem2 = true,
        requireRate = 1, 
        requireRate2 = 4,
        requireItem = "coke_small_brick",
        requireItem2 = "empty_weed_bag",
        rewardItem  = "cokebaggy",
        rewardRate  = 4,

        location    = vector3(1101.245,-3198.82,-39.60),
        offset      = vector3(7.663,-2.222,0.395),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 59000,
        act         = "Cocaine",
        id          = 6,
        scene       = 2,
      }, 
    }
  },
} 

-- Animation dicts for scenes.
SceneDicts = {
  Cocaine = {
    [1] = 'anim@amb@business@coc@coc_unpack_cut_left@',
    [2] = 'anim@amb@business@coc@coc_packing_hi@',
  },
  Meth = {
    [1] = 'anim@amb@business@meth@meth_monitoring_cooking@cooking@',
    [2] = 'anim@amb@business@meth@meth_smash_weight_check@',
  },
  Weed = {
    [1] = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
    [2] = 'anim@amb@business@weed@weed_sorting_seated@',
  }, 
  Money = {
    [1] = 'anim@amb@business@cfm@cfm_counting_notes@',
    [2] = 'anim@amb@business@cfm@cfm_cut_sheets@',
    [3] = 'anim@amb@business@cfm@cfm_drying_notes@',
  }
}

-- Animation for player within scenes.
PlayerAnims = {
  Cocaine = {
    [1] = 'coke_cut_v5_coccutter',
    [2] = 'full_cycle_v3_pressoperator'
  },
  Meth = {
    [1] = 'chemical_pour_short_cooker',
    [2] = 'break_weigh_v3_char01',
  },
  Weed = {
    [1] = 'weed_spraybottle_crouch_spraying_02_inspector',
    [2] = "sorter_right_sort_v3_sorter02",
  }, 
  Money = {
    [1] = 'note_counting_v2_counter',
    [2] = 'extended_load_tune_cut_billcutter',
    [3] = 'loading_v3_worker',
  }
}

-- Animation for entities within scenes.
SceneAnims = {
  Cocaine = {
    [1] = {
      bakingsoda  = 'coke_cut_v5_bakingsoda',
      creditcard1 = 'coke_cut_v5_creditcard',
      creditcard2 = 'coke_cut_v5_creditcard^1',     
    },
    [2] = {
      scoop     = 'full_cycle_v3_scoop',
      box1      = 'full_cycle_v3_FoldedBox',
      dollmold  = 'full_cycle_v3_dollmould',
      dollcast1 = 'full_cycle_v3_dollcast',
      dollcast2 = 'full_cycle_v3_dollCast^1',
      dollcast3 = 'full_cycle_v3_dollCast^2',
      dollcast4 = 'full_cycle_v3_dollCast^3',
      press     = 'full_cycle_v3_cokePress',
      doll      = 'full_cycle_v3_cocdoll',
      bowl      = 'full_cycle_v3_cocbowl',
      boxed     = 'full_cycle_v3_boxedDoll',
    },
  },
  Meth = {
    [1] = {
      ammonia   = 'chemical_pour_short_ammonia',
      clipboard = 'chemical_pour_short_clipboard',
      pencil    = 'chemical_pour_short_pencil',
      sacid     = 'chemical_pour_short_sacid',
    },
    [2] = {
      box1      = 'break_weigh_v3_box01',
      box2      = 'break_weigh_v3_box01^1',
      clipboard = 'break_weigh_v3_clipboard',
      methbag1  = 'break_weigh_v3_methbag01',
      methbag2  = 'break_weigh_v3_methbag01^1',
      methbag3  = 'break_weigh_v3_methbag01^2',
      methbag4  = 'break_weigh_v3_methbag01^3',
      methbag5  = 'break_weigh_v3_methbag01^4',
      methbag6  = 'break_weigh_v3_methbag01^5',
      methbag7  = 'break_weigh_v3_methbag01^6',
      pen       = 'break_weigh_v3_pen',
      scale     = 'break_weigh_v3_scale',
      scoop     = 'break_weigh_v3_scoop',     
    },
  },
  Weed = {
    [1] = {},
    [2] = {
      weeddry1  = 'sorter_right_sort_v3_weeddry01a',
      weeddry2  = 'sorter_right_sort_v3_weeddry01a^1',
      weedleaf1 = 'sorter_right_sort_v3_weedleaf01a',
      weedleaf2 = 'sorter_right_sort_v3_weedleaf01a^1',
      weedbag   = 'sorter_right_sort_v3_weedbag01a',
      weedbud1a = 'sorter_right_sort_v3_weedbud02b',
      weedbud2a = 'sorter_right_sort_v3_weedbud02b^1',
      weedbud3a = 'sorter_right_sort_v3_weedbud02b^2',
      weedbud4a = 'sorter_right_sort_v3_weedbud02b^3',
      weedbud5a = 'sorter_right_sort_v3_weedbud02b^4',
      weedbud6a = 'sorter_right_sort_v3_weedbud02b^5',
      weedbud1b = 'sorter_right_sort_v3_weedbud02a',
      weedbud2b = 'sorter_right_sort_v3_weedbud02a^1',
      weedbud3b = 'sorter_right_sort_v3_weedbud02a^2',
      bagpile   = 'sorter_right_sort_v3_weedbagpile01a',
      weedbuck  = 'sorter_right_sort_v3_bucket01a',
      weedbuck  = 'sorter_right_sort_v3_bucket01a^1',
    },
  },
  Money = {
    [1] = {
      binmoney  = 'note_counting_v2_binmoney',
      moneybin  = 'note_counting_v2_moneybin',
      money1    = 'note_counting_v2_moneyunsorted',
      money2    = 'note_counting_v2_moneyunsorted^1',
      wrap1     = 'note_counting_v2_moneywrap',
      wrap2     = 'note_counting_v2_moneywrap^1',
    },
    [2] = {
      cutter    = 'extended_load_tune_cut_papercutter',
      singlep1  = 'extended_load_tune_cut_singlemoneypage',
      singlep2  = 'extended_load_tune_cut_singlemoneypage^1',
      singlep3  = 'extended_load_tune_cut_singlemoneypage^2',
      table     = 'extended_load_tune_cut_table',
      stack     = 'extended_load_tune_cut_moneystack',
      strip1    = 'extended_load_tune_cut_singlemoneystrip',
      strip2    = 'extended_load_tune_cut_singlemoneystrip^1',
      strip3    = 'extended_load_tune_cut_singlemoneystrip^2',
      strip4    = 'extended_load_tune_cut_singlemoneystrip^3',
      strip5    = 'extended_load_tune_cut_singlemoneystrip^4',
      sinstack  = 'extended_load_tune_cut_singlestack',
    },
    [3] = {
      bucket    = 'loading_v3_bucket',
      money1    = 'loading_v3_money01',
      money2    = 'loading_v3_money01^1',
    }
  },
}

-- Objects for entities within scenes.
SceneItems = {
  Cocaine = {
    [1] = {
      bakingsoda  = 'bkr_prop_coke_bakingsoda_o',
      creditcard1 = 'prop_cs_credit_card',
      creditcard2 = 'prop_cs_credit_card',
    },
    [2] = {
      scoop     = 'bkr_prop_coke_fullscoop_01a',
      doll      = 'bkr_prop_coke_doll',
      boxed     = 'bkr_prop_coke_boxedDoll',
      dollcast1 = 'bkr_prop_coke_dollCast',
      dollcast2 = 'bkr_prop_coke_dollCast',
      dollcast3 = 'bkr_prop_coke_dollCast',
      dollcast4 = 'bkr_prop_coke_dollCast',
      dollmold  = 'bkr_prop_coke_dollmould',
      bowl      = 'bkr_prop_coke_fullmetalbowl_02',
      press     = 'bkr_prop_coke_press_01b',      
      box1      = 'bkr_prop_coke_dollboxfolded',
    },
  },
  Meth = {
    [1] = {
      ammonia   = 'bkr_prop_meth_ammonia',
      clipboard = 'bkr_prop_fakeid_clipboard_01a',
      pencil    = 'bkr_prop_fakeid_penclipboard',
      sacid     = 'bkr_prop_meth_sacid',
    },
    [2] = {
      box1      = 'bkr_prop_meth_bigbag_04a',
      box2      = 'bkr_prop_meth_bigbag_03a',
      clipboard = 'bkr_prop_fakeid_clipboard_01a',
      methbag1  = 'bkr_prop_meth_openbag_02',
      methbag2  = 'bkr_prop_meth_openbag_02',
      methbag3  = 'bkr_prop_meth_openbag_02',
      methbag4  = 'bkr_prop_meth_openbag_02',
      methbag5  = 'bkr_prop_meth_openbag_02',
      methbag6  = 'bkr_prop_meth_openbag_02',
      methbag7  = 'bkr_prop_meth_openbag_02',
      pen       = 'bkr_prop_fakeid_penclipboard',
      scale     = 'bkr_prop_coke_scale_01',
      scoop     = 'bkr_prop_meth_scoop_01a',     
    },
  },
  Weed = {
    [1] = {},
    [2] = {
      weeddry1  = 'bkr_prop_weed_dry_01a',
      weeddry2  = 'bkr_prop_weed_dry_01a',
      weedleaf1 = 'bkr_prop_weed_leaf_01a',
      weedleaf2 = 'bkr_prop_weed_leaf_01a',
      weedbag   = 'bkr_prop_weed_bag_01a',
      weedbud1a = 'bkr_prop_weed_bud_02b',
      weedbud2a = 'bkr_prop_weed_bud_02b',
      weedbud3a = 'bkr_prop_weed_bud_02b',
      weedbud4a = 'bkr_prop_weed_bud_02b',
      weedbud5a = 'bkr_prop_weed_bud_02b',
      weedbud6a = 'bkr_prop_weed_bud_02b',
      weedbud1b = 'bkr_prop_weed_bud_02a',
      weedbud2b = 'bkr_prop_weed_bud_02a',
      weedbud3b = 'bkr_prop_weed_bud_02a',
      bagpile   = 'bkr_prop_weed_bag_pile_01a',
      weedbuck  = 'bkr_prop_weed_bucket_open_01a',
      weedbuck  = 'bkr_prop_weed_bucket_open_01a',
    },
  },
  Money = {
    [1] = {
      binmoney  = 'bkr_prop_coke_tin_01',
      moneybin  = 'bkr_prop_tin_cash_01a',
      money1    = 'bkr_prop_money_unsorted_01',
      money2    = 'bkr_prop_money_unsorted_01',
      wrap1     = 'bkr_prop_money_wrapped_01',
      wrap2     = 'bkr_prop_money_wrapped_01',
    },
    [2] = {
      cutter    = 'bkr_prop_fakeid_papercutter',
      singlep1  = 'bkr_prop_cutter_moneypage',
      singlep2  = 'bkr_prop_cutter_moneypage',
      singlep3  = 'bkr_prop_cutter_moneypage',
      table     = 'bkr_prop_fakeid_table',
      stack     = 'bkr_prop_cutter_moneystack_01a',
      strip1    = 'bkr_prop_cutter_moneystrip',
      strip2    = 'bkr_prop_cutter_moneystrip',
      strip3    = 'bkr_prop_cutter_moneystrip',
      strip4    = 'bkr_prop_cutter_moneystrip',
      strip5    = 'bkr_prop_cutter_moneystrip',
      sinstack  = 'bkr_prop_cutter_singlestack_01a',
    },
    [3] = {
      bucket    = 'bkr_prop_money_pokerbucket',
      money1    = 'bkr_prop_money_unsorted_01',
      money2    = 'bkr_prop_money_unsorted_01',
    }
  },
}

-- Ignore me. Don't touch.
GangLookup = {} for k,v in pairs(Config.GangJobs) do GangLookup[v] = true; end; for k,v in pairs(Config.PoliceJobs) do GangLookup[v] = true; end; 
PoliceLookup = {}; for k,v in pairs(Config.PoliceJobs) do PoliceLookup[v] = true; end; 

FrameworkStart = function()
  while not QBCore do
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj; end)
    Wait(0)
  end
end

-- Start 'er up.
Citizen.CreateThread(FrameworkStart)