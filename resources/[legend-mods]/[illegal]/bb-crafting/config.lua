Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = 'Workbench',

UseLimitSystem = false, -- Enable if your esx uses limit system

CraftingStopWithDistance = true, -- Crafting will stop when not near workbench

ExperiancePerCraft = 100, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {

['misc'] = {
	Label = 'MISC',
	Image = 'fishingrod',
	Jobs = {}
},
['medical'] = {
	Label = 'MEDICAL',
	Image = 'bandage',
	Jobs = {doctor, ambulance}
}
},

MechCategories = {
['mechanic'] = {
	Label = 'MECHANICS',
	Image = 'advancedkit',
	Jobs = {}
}
},

GunCategories = {
['weapons'] = {
	Label = 'WEAPONS',
	Image = 'WEAPON_APPISTOL',
	Jobs = {}
},
['attachments'] = {
	Label = 'ATTACHMENTS',
	Image = 'smg_scope',
	Jobs = {}
}
},


PermanentItems = { -- Items that dont get removed when crafting
	['wrench'] = true
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque

['bandage'] = {
	ItemName = 'bandage',
	Level = 0, -- From what level this item will be craftable
	Category = 'medical', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 2, -- The amount that will be crafted
	SuccessRate = 100, -- 100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['clothe'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['wood'] = 1,
	}
}, 

['fishingrod'] = {
	ItemName = 'fishingrod',
	Level = 0, -- From what level this item will be craftable
	Category = 'misc', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 3, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['wood'] = 3 -- item name and count, adding items that dont exist in database will crash the script
	}
},

-- // ATTACHMENTS Craft stuff

['pistol_extendedclip'] = {
	ItemName = 'Pistol Extended Clip',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 5,
		["steel"] = 5,
		["rubber"] = 5
	}
},
['pistol_suppressor'] = {
	ItemName = 'Pistol Suppressor',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 95,
		["steel"] = 120,
		["rubber"] = 25
	}
},
['weapon_pistol'] = {
	ItemName = 'Colt 1911',
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 35,
		["steel"] = 100,
		["iron"] = 85,
	
	}
},
['weapon_revolver_mk2'] = {
	ItemName = 'Revolver MK2',
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 50,
		["steel"] = 125,
		["iron"] = 95,
	
	}
},
['weapon_microsmg'] = {
	ItemName = 'Micro SMG',
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 50,
		["steel"] = 125,
		["iron"] = 95,
	
	}
},
['smg_extendedclip'] = {
	ItemName = 'SMG Extended Clip',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
	}
},
['rifle_extendedclip'] = {
	ItemName = 'Rifle Extended Clip',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
	}
},
['rifle_drummag'] = {
	ItemName = 'Rifle Drummag',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
	}
},
['smg_flashlight'] = {
	ItemName = 'SMG Flashlight',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	    ["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
	}
},
['smg_suppressor'] = {
	ItemName = 'SMG Suppressor',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["steel"] = 25,
	["aluminum"] = 70,
	["plastic"] = 80
	}
},
['smg_scope'] = {
	ItemName = 'SMG Scope',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["steel"] = 25,
	["aluminum"] = 70,
	["plastic"] = 80
	}
},
['weapon_compactrifle'] = {
	ItemName = 'Compact Rifle',
	Level = 00, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["steel"] = 25,
	["aluminum"] = 70,
	["plastic"] = 80
	}
},


['weapon_pumpshotgun'] = {
	ItemName = 'Pump Shotgun',
	Level = 00, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 110,
		["steel"] = 125,
		["aluminum"] = 50

	}
},
['shotgun_ammo'] = {
	ItemName = 'Shotgun Ammo',
	Level = 01, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 5, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
	}
},
['smg_ammo'] = {
	ItemName = 'SMG Ammo',
	Level = 01, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 5, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 55,
		["aluminum"] = 80,
		["copper"] = 60
	}
},
['rifle_ammo'] = {
	ItemName = 'Rifle Ammo',
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 5, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 50,
		["aluminum"] = 75,
		["copper"] = 50
	}
},

-- // mech stuff

['mechanic_tools'] = {
	ItemName = 'Mechanic tools',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 30,
        ["steel"] = 49,
        ["aluminum"] = 10,
	}
},
['mech_toolbox'] = {
	ItemName = 'mech_toolbox',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 40,
        ["steel"] = 19,
        ["iron"] = 180,
        ["rubber"] = 9
	}
},
['turbo_lvl_1'] = {
	ItemName = 'Turbo Level 1',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
        ["steel"] = 509,
        ["iron"] = 180,
        ["rubber"] = 30
	}
},
['stock_transmission'] = {
	ItemName = 'Stock Transmission',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["steel"] = 469,
        ["iron"] = 180,
        ["rubber"] = 10
	}
},
['race_transmission'] = {
	ItemName = 'Race Transmission',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 300,
        ["steel"] = 469,
        ["iron"] = 180,
        ["copper"] = 100,
        ["rubber"] = 70  -- item name and count, adding items that dont exist in database will crash the script
	}
},
['race_transmission_4wd'] = {
	ItemName = 'Race Transmission 4WD',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 150,
        ["steel"] = 469,
        ["aluminum"] = 25,
        ["iron"] = 180,
        ["copper"] = 100,
        ["rubber"] = 111 -- item name and count, adding items that dont exist in database will crash the script
	}
},
['race_transmission_fwd'] = {
	ItemName = 'Race Transmission FWD',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 165,
        ["steel"] = 105,
        ["aluminum"] = 30,
        ["iron"] = 180,
        ["copper"] = 100,
        ["rubber"] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
},
['stock_suspension'] = {
	ItemName = 'Stock Suspension',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 10,
        ["iron"] = 180,
        ["copper"] = 100, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['race_suspension'] = {
	ItemName = 'Race Suspension',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["steel"] = 149,
        ["aluminum"] = 120,
        ["iron"] = 180,
        ["copper"] = 100,
        ["rubber"] = 70 -- item name and count, adding items that dont exist in database will crash the script
	}
},
['stock_engine'] = {
	ItemName = 'Stock Engine',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 25,
        ["iron"] = 100,
        ["copper"] = 80,
        ["rubber"] = 10,
        ["plastic"] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
},
['v8engine'] = {
	ItemName = 'v8engine',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 165,
        ["steel"] = 105,
        ["aluminum"] = 30,
        ["iron"] = 180,
        ["copper"] = 100,
        ["rubber"] = 60,
        ["plastic"] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
},
['2jzengine'] = {  -- toyota engine
	ItemName = '2jzengine',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 195,
        ["steel"] = 115,
        ["aluminum"] = 90,
        ["iron"] = 80,
        ["copper"] = 90,
        ["rubber"] = 20,  -- item name and count, adding items that dont exist in database will crash the script
	}
},
['lambov10'] = {
	ItemName = 'lambov10',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 150,
        ["steel"] = 115,
        ["aluminum"] = 225,
        ["iron"] = 110,
        ["copper"] = 100,
        ["rubber"] = 60, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['musv8'] = { 
	ItemName = 'musv8',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 185,
        ["steel"] = 115,
        ["aluminum"] = 210,
        ["iron"] = 180,
        ["copper"] = 150,
        ["rubber"] = 60, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['shonen'] = { -- japanese 'lambo' type engine
	ItemName = 'shonen',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 265,
        ["steel"] = 125,
        ["aluminum"] = 240,
        ["iron"] = 190,
        ["copper"] = 150,
        ["rubber"] = 80, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['rb26det'] = {  -- nissan skyline engine
	ItemName = 'rb26det',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 265,
        ["steel"] = 115,
        ["aluminum"] = 230,
        ["iron"] = 90,
        ["copper"] = 180,
        ["rubber"] = 70, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['rotary7'] = { -- 
	ItemName = 'rotary7',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 295,
        ["steel"] = 235,
        ["aluminum"] = 230,
        ["iron"] = 680,
        ["copper"] = 280,
        ["rubber"] = 180, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['m297zonda'] = { -- supercar engine
	ItemName = 'm297zonda',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 365,
        ["steel"] = 245,
        ["aluminum"] = 230,
        ["iron"] = 160,
        ["copper"] = 400,
        ["rubber"] = 160, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['m158huayra'] = { -- supercar mercedes
	ItemName = 'm158huayra',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 375,
        ["steel"] = 225,
        ["aluminum"] = 260,
        ["iron"] = 180,
        ["copper"] = 600,
        ["rubber"] = 180, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['k20a'] = { -- v8engine 
	ItemName = 'k20a',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 265,
        ["steel"] = 115,
        ["aluminum"] = 230,
        ["iron"] = 90,
        ["copper"] = 180,
        ["rubber"] = 70, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['gt3flat6'] = {
	ItemName = 'gt3flat6',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 165,
        ["steel"] = 115,
        ["aluminum"] = 140,
        ["iron"] = 90,
        ["copper"] = 170,
        ["rubber"] = 40, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['predatorv8'] = {
	ItemName = 'predatorv8',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 265,
        ["steel"] = 115,
        ["aluminum"] = 130,
        ["iron"] = 90,
        ["copper"] = 180,
        ["rubber"] = 70, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['p60b40'] = { -- BMW v8engine
	ItemName = 'p60b40',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 165,
        ["steel"] = 95,
        ["aluminum"] = 140,
        ["iron"] = 90,
        ["copper"] = 110,
        ["rubber"] = 20,-- item name and count, adding items that dont exist in database will crash the script
	}
},
['michelin_tires'] = {
	ItemName = 'Michelin Tires',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["iron"] = 180,
        ["rubber"] = 50,
        ["plastic"] = 60  -- item name and count, adding items that dont exist in database will crash the script
	}
},
['stock_brakes'] = {
	ItemName = 'Stock Brakes',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 65,
        ["steel"] = 105,
        ["aluminum"] = 30,
        ["rubber"] = 60, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['race_brakes'] = {
	ItemName = 'Race Brakes',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["steel"] = 205,
        ["aluminum"] = 230,
		["steel"] = 105,
        ["rubber"] = 160, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['stock_sparkplugs'] = {
	ItemName = 'Stock Sparkplugs',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["steel"] = 50,
        ["iron"] = 280,
        ["copper"] = 400, -- item name and count, adding items that dont exist in database will crash the script
	}
},
['ngk_sparkplugs'] = {
	ItemName = 'Ngk Sparkplugs',
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanic', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["steel"] = 100,
        ["iron"] = 480,
        ["copper"] = 600, -- item name and count, adding items that dont exist in database will crash the script
	}
}

},
Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
		
		{coords = vector3(-196.3735,-1318.485,32.08951), jobs = 'mechanic', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },       					--bennys 1 
		{coords = vector3(101.26113891602,6615.810546875,33.58126831054), jobs = 'mechanic', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },      	--North LS customs
		{coords = vector3(93.52, 3754.21, 41.57), jobs = {}, Categories = 'GunCategories', blip = false, recipes = {}, radius = 3.0 }, --Gun crafting 1 
		{coords = vector3(164.9575,-1323.114,26.81208), jobs = {}, Categories = 'GunCategories', blip = false, recipes = {}, radius = 3.0} --Gun crafting 2 

},
 

Text = {

    ['not_enough_ingredients'] = 'You dont have enough ingredients',
    ['you_cant_hold_item'] = 'You cant hold the item',
    ['item_crafted'] = 'Item crafted!',
    ['wrong_job'] = 'You cant open this workbench',
    ['workbench_hologram'] = '[~b~E~w~] Workbench',
    ['wrong_usage'] = 'Wrong usage of command',
    ['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
    ['crafting_failed'] = 'You failed to craft the item!'

}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
