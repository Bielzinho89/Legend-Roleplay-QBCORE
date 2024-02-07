return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["chair45"] = {
		label = "Dark Brown Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair45.png",
		}
	},

	["chair54"] = {
		label = "Old Wooden Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair54.png",
		}
	},

	["windowtint4"] = {
		label = "Window Tint Stage 4",
		weight = 2200,
		stack = true,
		close = true,
		description = "Window Tint Stage 4",
		client = {
			image = "stockwindowtint4.png",
		}
	},

	["gallary_egg"] = {
		label = "Napoleonic Egg",
		weight = 0,
		stack = true,
		close = false,
		description = "Faberge Series",
		client = {
			image = "gallary_egg.png",
		}
	},

	["chair74"] = {
		label = "Yellow Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair74.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop",
		client = {
			image = "laptop.png",
		}
	},

	["cooked_sausage"] = {
		label = "Cooked Sausage",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_sausage.png",
		}
	},

	["marijuana_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 0,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "marijuana_nutrition.png",
		}
	},

	["bass"] = {
		label = "Bass",
		weight = 1250,
		stack = false,
		close = false,
		description = "A normal fish Tatses pretty good!",
		client = {
			image = "bass.png",
		}
	},

	["emptycowbucket"] = {
		label = "Empty Bucket",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "emptybucket.png",
		}
	},

	["hydroacid"] = {
		label = "Hydrochloric Acid",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hydroacid.png",
		}
	},

	["weedplant_weed"] = {
		label = "Dried Weed",
		weight = 100,
		stack = true,
		close = false,
		description = "Weed ready for packaging",
		client = {
			image = "weedplant_weed.png",
		}
	},

	["joint_ak47"] = {
		label = "AK Strain Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint_ak47.png",
		}
	},

	["chair37"] = {
		label = "Dark Brown Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair37.png",
		}
	},

	["rawmeth"] = {
		label = "Batch of Raw Methamphetamine",
		weight = 5000,
		stack = true,
		close = true,
		description = "Shit's still crystal, needs to be dried.",
		client = {
			image = "rawmeth.png",
		}
	},

	["uwu_toy3"] = {
		label = "uWu Citruz",
		weight = 50,
		stack = true,
		close = false,
		description = "Citruz ",
		client = {
			image = "uwu_toy3.png",
		}
	},

	["inkedmoneybag"] = {
		label = "Inked Money Bag",
		weight = 10000,
		stack = true,
		close = false,
		description = "Made with cheap ink that expires",
		client = {
			image = "markedbills.png",
		}
	},

	["pseudoephedrine"] = {
		label = "Pseudoephedrine",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pseudoephedrine.png",
		}
	},

	["goldcoin"] = {
		label = "Gold Coin",
		weight = 0,
		stack = true,
		close = false,
		description = "Check inside for chocolate",
		client = {
			image = "goldcoin.png",
		}
	},

	["canofcorn"] = {
		label = "Can Of Corn",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "canofcorn.png",
		}
	},

	["chair105"] = {
		label = "Light Material Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair105.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["visa"] = {
		label = "Visa Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM",
		client = {
			image = "visacard.png",
		}
	},

	["weedplant_packedweed"] = {
		label = "Packed Weed",
		weight = 100,
		stack = false,
		close = false,
		description = "Weed ready for sale",
		client = {
			image = "weedplant_weed.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["chair46"] = {
		label = "White Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair46.png",
		}
	},

	["apple"] = {
		label = "Apple",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "apple.png",
		}
	},

	["chair108"] = {
		label = "White Casino Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair108.png",
		}
	},

	["mdmchain"] = {
		label = "Represent!",
		weight = 1,
		stack = false,
		close = true,
		description = "Represent!",
		client = {
			image = "np_mdm_chain.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["chair31"] = {
		label = "Black Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair31.png",
		}
	},

	["gallary_trophy"] = {
		label = "Trophy",
		weight = 0,
		stack = true,
		close = false,
		description = "Winner!",
		client = {
			image = "gallary_trophy.png",
		}
	},

	["marijuana_joint3g"] = {
		label = "Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "3g joint",
		client = {
			image = "marijuana_joint3g.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["blacklight"] = {
		label = "Xenons - Blacklight",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "blacklight.png",
		}
	},

	["joint"] = {
		label = "Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint.png",
		}
	},

	["hotpink"] = {
		label = "Xenons - Hot Pink",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "hotpink.png",
		}
	},

	["chair15"] = {
		label = "Old Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair15.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["thermitecharge"] = {
		label = "Thermite Charge",
		weight = 10000,
		stack = false,
		close = true,
		description = "This thing burns!",
		client = {
			image = "thermite_charge.png",
		}
	},

	["cheese"] = {
		label = "Pizza Cheese",
		weight = 100,
		stack = true,
		close = true,
		description = "Cheese for Cooking!",
		client = {
			image = "cheese.png",
		}
	},

	["chair20"] = {
		label = "Blue Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair20.png",
		}
	},

	["red"] = {
		label = "Xenons - Red",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "red.png",
		}
	},

	["killerwhale"] = {
		label = "Whale",
		weight = 15000,
		stack = false,
		close = false,
		description = "Killer Whale",
		client = {
			image = "killerwhale.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed-plant-seed.png",
		}
	},

	["lvaccesscodes"] = {
		label = "Goldssssss",
		weight = 0,
		stack = true,
		close = true,
		description = "Gold Heist",
		client = {
			image = "paper.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["snowball"] = {
		label = "Snowball",
		weight = 0,
		stack = true,
		close = true,
		description = "Should have catched it :D",
		client = {
			image = "snowball.png",
		}
	},

	["chair8"] = {
		label = "Lime Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair8.png",
		}
	},

	["chair83"] = {
		label = "Orange Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair83.png",
		}
	},

	["raw_beef"] = {
		label = "Raw Beef",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_beef.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["pixellaptop"] = {
		label = "ConverLaptop",
		weight = 10000,
		stack = false,
		close = true,
		description = "Pixel 3 (os) 0.6.9",
		client = {
			image = "tablet.png",
		}
	},

	["chair39"] = {
		label = "Striped Wicker Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair39.png",
		}
	},

	["mintgreen"] = {
		label = "Xenons - Mint Green",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "mintgreen.png",
		}
	},

	["fishicebox"] = {
		label = "Fishing Ice Chest",
		weight = 2500,
		stack = false,
		close = true,
		description = "Ice Box to store all of your fish",
		client = {
			image = "fishicebox.png",
		}
	},

	["casino_member"] = {
		label = "Casino Membership",
		weight = 500,
		stack = false,
		close = false,
		description = "Diamond Casino Member Card",
		client = {
			image = "casino_member.png",
		}
	},

	["weed_og-kush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed-baggie.png",
		}
	},

	["spoiler1"] = {
		label = "Custom Spoiler",
		weight = 4000,
		stack = true,
		close = true,
		description = "Custom Spoiler",
		client = {
			image = "spoiler1.png",
		}
	},

	["chair5"] = {
		label = "Old Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair5.png",
		}
	},

	["ponypink"] = {
		label = "Xenons - Pony Pink",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "ponypink.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["marijuana_trowel"] = {
		label = "Trowel",
		weight = 0,
		stack = true,
		close = true,
		description = "Small handheld garden shovel",
		client = {
			image = "marijuana_trowel.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["chair43"] = {
		label = "Wicker Lawn Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair43.png",
		}
	},

	["sharktiger"] = {
		label = "Shark",
		weight = 5000,
		stack = false,
		close = false,
		description = "Tigershark",
		client = {
			image = "sharktiger.png",
		}
	},

	["chair69"] = {
		label = "Dark Material Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair69.png",
		}
	},

	["coffeemaker"] = {
		label = "Coffee Maker",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "np_stolencoffee.png",
		}
	},

	["white"] = {
		label = "Xenons - White",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "white.png",
		}
	},

	["chair41"] = {
		label = "Grey Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair41.png",
		}
	},

	["chair76"] = {
		label = "Black Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair76.png",
		}
	},

	["stone"] = {
		label = "Stone",
		weight = 2000,
		stack = true,
		close = false,
		description = "Stone woo",
		client = {
			image = "stone.png",
		}
	},

	["stock"] = {
		label = "Xenons - Stock",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "stock.png",
		}
	},

	["chair9"] = {
		label = "Standard Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair9.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["marijuana_scale"] = {
		label = "Scale",
		weight = 0,
		stack = true,
		close = false,
		description = "This is not what it looks like",
		client = {
			image = "marijuana_scale.png",
		}
	},

	["meatboar"] = {
		label = "Boar Tusks",
		weight = 100,
		stack = true,
		close = false,
		description = "Boar Tusks",
		client = {
			image = "boartusks.png",
		}
	},

	["uwubbessence"] = {
		label = "BerryBlue Essence",
		weight = 200,
		stack = true,
		close = true,
		description = "Essence from the Blueberry Gods.",
		client = {
			image = "uwubbessence.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["goldchain"] = {
		label = "Golden Chain",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["chair62"] = {
		label = "Green Camping Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair62.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["stingray"] = {
		label = "Stingray",
		weight = 2500,
		stack = false,
		close = false,
		description = "Stingray",
		client = {
			image = "stingray.png",
		}
	},

	["burger-heartstopper"] = {
		label = "Heartstopper",
		weight = 2500,
		stack = true,
		close = true,
		description = "Sates Hunger.",
		client = {
			image = "bs_the-heart-stopper.png",
		}
	},

	["chair78"] = {
		label = "Wine Red Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair78.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["chair34"] = {
		label = "Red Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair34.png",
		}
	},

	["uncut_ruby"] = {
		label = "Uncut Ruby",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Ruby",
		client = {
			image = "uncut_ruby.png",
		}
	},

	["tea"] = {
		label = "Tempting Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "Its not just tea...",
		client = {
			image = "tea.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["chair97"] = {
		label = "Plastic Lawn Chair 2",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair97.png",
		}
	},

	["fish_bass"] = {
		label = "Bass",
		weight = 1000,
		stack = true,
		close = false,
		description = "Striped Bass. Bass like the fish, not the officer",
		client = {
			image = "fish_bass.png",
		}
	},

	["engine3"] = {
		label = "Engine Upgrade D",
		weight = 125,
		stack = true,
		close = true,
		description = "Engine Upgrade 3",
		client = {
			image = "engine_parts_d.png",
		}
	},

	["burger-raw"] = {
		label = "Raw Patty",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_patty_raw.png",
		}
	},

	["uncut_diamond"] = {
		label = "Uncut Diamond",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Diamond",
		client = {
			image = "uncut_diamond.png",
		}
	},

	["chair88"] = {
		label = "Black Deco Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair88.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["uwu_toy1"] = {
		label = "uWu Blitz",
		weight = 50,
		stack = true,
		close = false,
		description = "Blitz ",
		client = {
			image = "uwu_toy1.png",
		}
	},

	["ammonia"] = {
		label = "Pure Ammonia",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ammonia.png",
		}
	},

	["transmission0"] = {
		label = "Stock Transmission A",
		weight = 125,
		stack = true,
		close = true,
		description = "Stock Transmission",
		client = {
			image = "transmission_parts_a.png",
		}
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["chair38"] = {
		label = "Ol' Rocking Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair38.png",
		}
	},

	["chair7"] = {
		label = "Fancy Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair7.png",
		}
	},

	["katana_05"] = {
		label = "Katana 5",
		weight = 11000,
		stack = false,
		close = true,
		description = "When you were partying, I studied the blade.",
		client = {
			image = "np_cursed-katana.png",
		}
	},

	["fish_flounder"] = {
		label = "Flounder",
		weight = 1000,
		stack = true,
		close = false,
		description = "I went fishing and all I got was this lousy flounder",
		client = {
			image = "fish_flounder.png",
		}
	},

	["meatbird"] = {
		label = "Bird Feather",
		weight = 100,
		stack = true,
		close = false,
		description = "Bird Feather",
		client = {
			image = "birdfeather.png",
		}
	},

	["gallary_starry_night"] = {
		label = "Starry Night",
		weight = 0,
		stack = true,
		close = false,
		description = "Neither ear nor there",
		client = {
			image = "gallary_starry_night.png",
		}
	},

	["chair110"] = {
		label = "Black Metal Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair110.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["spoiler0"] = {
		label = "Stock Spoiler",
		weight = 7500,
		stack = true,
		close = true,
		description = "Stock Spoiler",
		client = {
			image = "spoiler0.png",
		}
	},

	["uwupancake"] = {
		label = "uWu Pancake",
		weight = 200,
		stack = true,
		close = true,
		description = "Korean savory pancake made with scallions.",
		client = {
			image = "uwupancake.png",
		}
	},

	["chair82"] = {
		label = "Small Black Stool",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair82.png",
		}
	},

	["fish_boot"] = {
		label = "Boot",
		weight = 1000,
		stack = true,
		close = false,
		description = "insert shit here",
		client = {
			image = "fish_boot.png",
		}
	},

	["gallary_portrait_of_drgachet"] = {
		label = "Portrait of Dr.Gachet",
		weight = 0,
		stack = true,
		close = false,
		description = "Van Gogh 1890",
		client = {
			image = "gallary_portrait_of_drgachet.png",
		}
	},

	["chair14"] = {
		label = "White Leather Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair14.png",
		}
	},

	["chair32"] = {
		label = "Luxury Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair32.png",
		}
	},

	["acetone"] = {
		label = "Acetone",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "acetone_ethyl.png",
		}
	},

	["marijuana_1oz_mid"] = {
		label = "1oz marijuana",
		weight = 2800,
		stack = false,
		close = false,
		description = "1oz mid grade marijuana",
		client = {
			image = "marijuana_1oz_mid.png",
		}
	},

	["fishingbait"] = {
		label = "Fishing Bait",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its a bait man",
		client = {
			image = "fishingbait.png",
		}
	},

	["cooked_bacon"] = {
		label = "Cooked Bacon",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_bacon.png",
		}
	},

	["meatlion"] = {
		label = "Cougar Claws",
		weight = 100,
		stack = true,
		close = false,
		description = "Cougar Claw",
		client = {
			image = "cougarclaw.png",
		}
	},

	["hydriodicacid"] = {
		label = "Hydroiodic Acid",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hydriodicacid.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["limegreen"] = {
		label = "Xenons - Lime Green",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "limegreen.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["fishtacklebox"] = {
		label = "Tackle Box",
		weight = 1000,
		stack = true,
		close = true,
		description = "Seems to be left over tackle box from another fisherman",
		client = {
			image = "fishtacklebox.png",
		}
	},

	["vagoschain"] = {
		label = "Represent!",
		weight = 1,
		stack = false,
		close = true,
		description = "Represent!",
		client = {
			image = "np_vagos_chain.png",
		}
	},

	["suspension0"] = {
		label = "Stock Suspension A",
		weight = 125,
		stack = true,
		close = true,
		description = "Stock Suspension",
		client = {
			image = "stock_suspension.png",
		}
	},

	["brake2"] = {
		label = "Brakes Upgrade C",
		weight = 125,
		stack = true,
		close = true,
		description = "Brake Upgrade 2",
		client = {
			image = "brake_parts_c.png",
		}
	},

	["sulfuricacid"] = {
		label = "Sulfuric Acid",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sulfuricacid.png",
		}
	},

	["uwububbleteablueberry"] = {
		label = "Berry Blue B-T",
		weight = 200,
		stack = true,
		close = true,
		description = "Lavender Tea with Blueberry Boba.",
		client = {
			image = "uwububbleteablueberry.png",
		}
	},

	["weed_purple-haze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed-plant-seed.png",
		}
	},

	["cokebrick"] = {
		label = "Cocaine Brick (100g)",
		weight = 10000,
		stack = true,
		close = true,
		description = "Increases your Stamina and Movement Speed, Breaks down into product.",
		client = {
			image = "cokebrick.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed-plant-seed.png",
		}
	},

	["specialbadge"] = {
		label = "Police Badge",
		weight = 1000,
		stack = true,
		close = true,
		description = "Special Badge of Law Enforcements",
		client = {
			image = "specialbadge.png",
		}
	},

	["drill"] = {
		label = "Drill",
		weight = 20000,
		stack = true,
		close = false,
		description = "The real deal...",
		client = {
			image = "drill.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["burger-torpedo"] = {
		label = "Torpedo",
		weight = 310,
		stack = true,
		close = true,
		description = "Sates Hunger.",
		client = {
			image = "bs_torpedo.png",
		}
	},

	["katana_04"] = {
		label = "Katana 4",
		weight = 11000,
		stack = false,
		close = true,
		description = "When you were partying, I studied the blade.",
		client = {
			image = "np_cursed-katana.png",
		}
	},

	["raw_ham"] = {
		label = "Raw Ham",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_ham.png",
		}
	},

	["ironore"] = {
		label = "Iron Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Iron, a base ore.",
		client = {
			image = "ironore.png",
		}
	},

	["chair19"] = {
		label = "White Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair19.png",
		}
	},

	["uwusushi"] = {
		label = "uWu Sushi",
		weight = 200,
		stack = true,
		close = true,
		description = "Designed as a window to your soul.",
		client = {
			image = "uwusushi.png",
		}
	},

	["band"] = {
		label = "Band of Notes",
		weight = 0,
		stack = true,
		close = false,
		description = "Lots of low denominators - Indicates drug sales.",
		client = {
			image = "cashstack.png",
		}
	},

	["drillbit"] = {
		label = "Drill Bit",
		weight = 1000,
		stack = true,
		close = false,
		description = "A Drill Bit, needs to be used with a Hand Drill",
		client = {
			image = "drillbit.png",
		}
	},

	["brake1"] = {
		label = "Brakes Upgrade B",
		weight = 125,
		stack = true,
		close = true,
		description = "Brake Upgrade 1",
		client = {
			image = "brake_parts_b.png",
		}
	},

	["chair80"] = {
		label = "Orange Louncher",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair80.png",
		}
	},

	["orange"] = {
		label = "Xenons - Orange",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "orange.png",
		}
	},

	["cooked_pork"] = {
		label = "Cooked Pork",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_pork.png",
		}
	},

	["chair13"] = {
		label = "Orange Leather Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair13.png",
		}
	},

	["meatpig"] = {
		label = "Pig Meat",
		weight = 100,
		stack = true,
		close = false,
		description = "Pig Meat",
		client = {
			image = "pigpelt.png",
		}
	},

	["chair47"] = {
		label = "Black Wicker Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair47.png",
		}
	},

	["newstape"] = {
		label = "Video Tape",
		weight = 1000,
		stack = false,
		close = true,
		description = "Empty Video Tape",
		client = {
			image = "np_news_tape.png",
		}
	},

	["chair84"] = {
		label = "Orange Deco Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair84.png",
		}
	},

	["uwuvanillasandy"] = {
		label = "uWu V-Icecream Sandy",
		weight = 200,
		stack = true,
		close = true,
		description = "Sweet Vanilla Biscuit filled with Icecreamy!",
		client = {
			image = "uwuvanillasandy.png",
		}
	},

	["detector"] = {
		label = "Metal Detector",
		weight = 10000,
		stack = false,
		close = true,
		description = "You have been detected",
		client = {
			image = "detector.png",
		}
	},

	["chair11"] = {
		label = "Black Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair11.png",
		}
	},

	["chair18"] = {
		label = "Blue Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair18.png",
		}
	},

	["uncut_emerald"] = {
		label = "Uncut Emerald",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Emerald",
		client = {
			image = "uncut_emerald.png",
		}
	},

	["fishbait"] = {
		label = "Fish Bait",
		weight = 400,
		stack = true,
		close = true,
		description = "Fishing bait",
		client = {
			image = "fishbait.png",
		}
	},

	["rawpumpkin"] = {
		label = "Raw Pumpkin",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_pumpkin.png",
		}
	},

	["slicedpie"] = {
		label = "Slice of Pie",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "slicedpie.png",
		}
	},

	["ruby_ring"] = {
		label = "Ruby Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "A ruby ring seems like the jackpot to me!",
		client = {
			image = "ruby_ring.png",
		}
	},

	["suspension1"] = {
		label = "Suspension Upgrade B",
		weight = 125,
		stack = true,
		close = true,
		description = "Suspension Upgrade 1",
		client = {
			image = "stock_suspension.png",
		}
	},

	["chair86"] = {
		label = "Red Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair86.png",
		}
	},

	["tapiokaballs"] = {
		label = "Tapioka Balls",
		weight = 200,
		stack = true,
		close = true,
		description = "Tapioka Balls ingredient for Bubble Tea!",
		client = {
			image = "tapiokaballs.png",
		}
	},

	["apple_juice"] = {
		label = "Apple Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "apple_juice.png",
		}
	},

	["uwumisosoup"] = {
		label = "uWu Miso Soup",
		weight = 200,
		stack = true,
		close = true,
		description = "Fungus never tasted so good!",
		client = {
			image = "uwumisosoup.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["chair35"] = {
		label = "Ergonomic Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair35.png",
		}
	},

	["engine2"] = {
		label = "Engine Upgrade C",
		weight = 125,
		stack = true,
		close = true,
		description = "Engine Upgrade 2",
		client = {
			image = "engine_parts_c.png",
		}
	},

	["markedbills"] = {
		label = "Marked Money",
		weight = 1000,
		stack = false,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["electricblue"] = {
		label = "Xenons - Electric Blue",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "electricblue.png",
		}
	},

	["uwububbleteamint"] = {
		label = "Minty B-T",
		weight = 200,
		stack = true,
		close = true,
		description = "Matcha Tea with Mint Boba.",
		client = {
			image = "uwububbleteamint.png",
		}
	},

	["uwucupcake"] = {
		label = "uWu Cupcake",
		weight = 200,
		stack = true,
		close = true,
		description = "Sugar Kitty Cupcake!",
		client = {
			image = "uwucupcake.png",
		}
	},

	["gallary_greek_bust"] = {
		label = "Greek Bust",
		weight = 0,
		stack = true,
		close = false,
		description = "You sure its Greek?",
		client = {
			image = "gallary_greek_bust.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["spoiler2"] = {
		label = "Custom Spoiler",
		weight = 5000,
		stack = true,
		close = true,
		description = "Custom Spoiler",
		client = {
			image = "spoiler2.png",
		}
	},

	["chair109"] = {
		label = "Cream Wicker Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair109.png",
		}
	},

	["chair77"] = {
		label = "Yellow Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair77.png",
		}
	},

	["tomatopaste"] = {
		label = "tomato Paste",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomatopaste.png",
		}
	},

	["burger-sodasyrup"] = {
		label = "Soda Syrup",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_ingredients_hfcs.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["rollcash"] = {
		label = "Roll of Small Notes",
		weight = 0,
		stack = true,
		close = false,
		description = "Lots of low denominators - Indicates drug sales.",
		client = {
			image = "cash-roll.png",
		}
	},

	["brake3"] = {
		label = "Brakes Upgrade S",
		weight = 125,
		stack = true,
		close = true,
		description = "Brake Upgrade 3",
		client = {
			image = "brake_parts_s.png",
		}
	},

	["chair16"] = {
		label = "White Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair16.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["chair75"] = {
		label = "Oak Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair75.png",
		}
	},

	["dolphin"] = {
		label = "Dolphin",
		weight = 5000,
		stack = false,
		close = false,
		description = "Dolphin",
		client = {
			image = "dolphin.png",
		}
	},

	["full_watering_can"] = {
		label = "Full Watering Can",
		weight = 1000,
		stack = false,
		close = false,
		description = "Watering can filled with water for watering plants",
		client = {
			image = "watering_can.png",
		}
	},

	["hotsauce"] = {
		label = "Hot Sauce",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hotsauce.png",
		}
	},

	["casino_whitechip"] = {
		label = "Casino Chip",
		weight = 0,
		stack = true,
		close = false,
		description = "Diamond Casino Slot Machine Chip",
		client = {
			image = "casino_whitechip.png",
		}
	},

	["rice"] = {
		label = "Rice",
		weight = 200,
		stack = true,
		close = true,
		description = "Rice - cooking ingredient",
		client = {
			image = "rice.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["chair3"] = {
		label = "Metal Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair3.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["toy-egg"] = {
		label = "Burgershot Toy Egg",
		weight = 1000,
		stack = true,
		close = true,
		description = "Gives Random Toys",
		client = {
			image = "toy-egg.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["chair106"] = {
		label = "Purple Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair106.png",
		}
	},

	["mango"] = {
		label = "Mango",
		weight = 300,
		stack = true,
		close = true,
		description = "Mango",
		client = {
			image = "mango.png",
		}
	},

	["casino_goldchip"] = {
		label = "Casino Chip",
		weight = 0,
		stack = true,
		close = false,
		description = "Diamond Casino Chip",
		client = {
			image = "casino_goldchip.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["sapphire_necklace"] = {
		label = "Sapphire Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "A sapphire necklace seems like the jackpot to me!",
		client = {
			image = "sapphire_necklace.png",
		}
	},

	["fertilizer"] = {
		label = "Fertilizer",
		weight = 0,
		stack = false,
		close = false,
		description = "Fertilizante",
		client = {
			image = "fertilizer.png",
		}
	},

	["chair79"] = {
		label = "Black Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair79.png",
		}
	},

	["marijuana_crop_low"] = {
		label = "Harvested Crop",
		weight = 5500,
		stack = true,
		close = false,
		description = "low grade harvested marijuana crop",
		client = {
			image = "marijuana_crop_low.png",
		}
	},

	["transmission1"] = {
		label = "Transmission Upgrade B",
		weight = 125,
		stack = true,
		close = true,
		description = "Transmission Upgrade 1",
		client = {
			image = "transmission_parts_b.png",
		}
	},

	["chair94"] = {
		label = "Grey Luxury Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair94.png",
		}
	},

	["burger-meatfree"] = {
		label = "MeatFree",
		weight = 125,
		stack = true,
		close = true,
		description = "Sates Hunger.",
		client = {
			image = "bs_meat-free.png",
		}
	},

	["cokelabkey"] = {
		label = "Key to a Door (C)",
		weight = 1000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "labkey.png",
		}
	},

	["suspension3"] = {
		label = "Suspension Upgrade D",
		weight = 125,
		stack = true,
		close = true,
		description = "Suspension Upgrade 3",
		client = {
			image = "race_suspension.png",
		}
	},

	["chair85"] = {
		label = "Wine Red Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair85.png",
		}
	},

	["fish_dolphin"] = {
		label = "Baby Dolphin",
		weight = 100000,
		stack = false,
		close = false,
		description = "A fucking dolphin! Someone might be interested in buying it? Lol, jk. Throw it back. Unless..?",
		client = {
			image = "fish_dolphin.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed-baggie.png",
		}
	},

	["chair51"] = {
		label = "Green Lawn Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair51.png",
		}
	},

	["chair63"] = {
		label = "Blue Camping Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair63.png",
		}
	},

	["goldore"] = {
		label = "Gold Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Gold Ore",
		client = {
			image = "goldore.png",
		}
	},

	["burger-bun"] = {
		label = "Bun",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_bun.png",
		}
	},

	["tv"] = {
		label = "TV",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "np_stolentv.png",
		}
	},

	["grandconversion"] = {
		label = "Grand Conversion Auto",
		weight = 0,
		stack = true,
		close = false,
		description = "Just gotta be sharp",
		client = {
			image = "grandconversion.png",
		}
	},

	["uwumintessence"] = {
		label = "Mint Essence",
		weight = 200,
		stack = true,
		close = true,
		description = "Essence from the Mint Gods.",
		client = {
			image = "uwumintessence.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["chair72"] = {
		label = "Grey Sun Lounger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair72.png",
		}
	},

	["chair96"] = {
		label = "Light Brown Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair96.png",
		}
	},

	["marijuana_lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "Cheap tweaker lighter, Still does the job",
		client = {
			image = "marijuana_lighter.png",
		}
	},

	["chair67"] = {
		label = "White Metal Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair67.png",
		}
	},

	["drymeth"] = {
		label = "Batch of Dried Methamphetamine",
		weight = 1000,
		stack = true,
		close = true,
		description = "Dried Amp waiting to be packaged.",
		client = {
			image = "drymeth.png",
		}
	},

	["leather"] = {
		label = "Leather",
		weight = 100,
		stack = true,
		close = false,
		description = "Some big taco brother",
		client = {
			image = "leather.png",
		}
	},

	["anchor"] = {
		label = "Boat Anchor",
		weight = 2500,
		stack = true,
		close = true,
		description = "Boat Anchor",
		client = {
			image = "anchor.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more",
		client = {
			image = "evidence.png",
		}
	},

	["gallary_maneki_neko"] = {
		label = "Maneki Neko",
		weight = 0,
		stack = true,
		close = false,
		description = "Good fortune beckons",
		client = {
			image = "gallary_maneki_neko.png",
		}
	},

	["vcomputerusb"] = {
		label = "Money Heist",
		weight = 0,
		stack = true,
		close = true,
		description = "Money Heist",
		client = {
			image = "np_heist_usb_black.png",
		}
	},

	["gallary_vip"] = {
		label = "Gallery VIP",
		weight = 0,
		stack = true,
		close = false,
		description = "VIP Membership Card",
		client = {
			image = "gallary_vip.png",
		}
	},

	["disabler"] = {
		label = "Tracker Disabling Tool",
		weight = 0,
		stack = false,
		close = true,
		description = "Plug this in and keep moving.",
		client = {
			image = "disabler.png",
		}
	},

	["turbo0"] = {
		label = "Remove Turbo",
		weight = 125,
		stack = true,
		close = true,
		description = "No Turbo",
		client = {
			image = "turbo.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["emerald"] = {
		label = "Emerald Gemstone",
		weight = 0,
		stack = true,
		close = false,
		description = "Even more green than nature",
		client = {
			image = "emerald.png",
		}
	},

	["chair53"] = {
		label = "Fancy Garden Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair53.png",
		}
	},

	["corncob"] = {
		label = "Corn Cob",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "corncob.png",
		}
	},

	["coca"] = {
		label = "Coca Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coca.png",
		}
	},

	["marijuana_3.5_high"] = {
		label = "3.5g marijuana",
		weight = 2800,
		stack = false,
		close = true,
		description = "3.5g high grade marijuana",
		client = {
			image = "marijuana_3.5_high.png",
		}
	},

	["casino_bluechip"] = {
		label = "Casino Chip",
		weight = 0,
		stack = true,
		close = false,
		description = "Diamond Casino Roulette Chip",
		client = {
			image = "casino_bluechip.png",
		}
	},

	["weed_og-kush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed-plant-seed.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["marijuana_joint"] = {
		label = "Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "1g joint",
		client = {
			image = "marijuana_joint.png",
		}
	},

	["gold_ring"] = {
		label = "Gold Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "A gold ring seems like the jackpot to me!",
		client = {
			image = "gold_ring.png",
		}
	},

	["fishingrod"] = {
		label = "Fishing Rod",
		weight = 750,
		stack = true,
		close = true,
		description = "A fishing rod for adventures with friends!!",
		client = {
			image = "fishingrod.png",
		}
	},

	["yellow"] = {
		label = "Xenons - Yellow",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "yellow.png",
		}
	},

	["chair28"] = {
		label = "Grey Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair28.png",
		}
	},

	["chair21"] = {
		label = "Metal Lawn Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair21.png",
		}
	},

	["nori"] = {
		label = "Nori Sheets",
		weight = 200,
		stack = true,
		close = true,
		description = "Gift from the Ocean, goes well with Rice",
		client = {
			image = "nori.png",
		}
	},

	["chair70"] = {
		label = "Dark Brown Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair70.png",
		}
	},

	["burger-murdermeal"] = {
		label = "Murder Meal",
		weight = 125,
		stack = true,
		close = true,
		description = "An Amazing Murder Meal with a chance of a toy.",
		client = {
			image = "burger-box.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["turbo1"] = {
		label = "Turbo Upgrade",
		weight = 125,
		stack = true,
		close = true,
		description = "Turbo",
		client = {
			image = "turbo.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["gallary_payne_portrait"] = {
		label = "Portrait of Payne",
		weight = 0,
		stack = true,
		close = false,
		description = "Cue tongue pop",
		client = {
			image = "gallary_payne_portrait.png",
		}
	},

	["uwububbletearose"] = {
		label = "Rosey B-T",
		weight = 200,
		stack = true,
		close = true,
		description = "Sakura Rose Tea with Vanilla Boba.",
		client = {
			image = "uwububbletearose.png",
		}
	},

	["chair49"] = {
		label = "Brown Wodd Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair49.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 100,
		stack = true,
		close = false,
		description = "A Diamond that shimmers",
		client = {
			image = "diamond.png",
		}
	},

	["gallary_dora_maar_auchat"] = {
		label = "Dora Maar au Chat",
		weight = 0,
		stack = true,
		close = false,
		description = "Picasso 1941",
		client = {
			image = "gallary_dora_maar_auchat.png",
		}
	},

	["weedplant_seedf"] = {
		label = "Female Weed Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "Female Weed Seed",
		client = {
			image = "weedplant_seed.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 5000,
		stack = false,
		close = true,
		description = "News Camera | Property of Weazel News",
		client = {
			image = "np_news_camera.png",
		}
	},

	["fish_whale"] = {
		label = "Baby Whale",
		weight = 100000,
		stack = false,
		close = false,
		description = "A fucking whale! Someone might be interested in buying it? Lol, jk. Throw it back. Unless..?",
		client = {
			image = "fish_whale.png",
		}
	},

	["joint_ww"] = {
		label = "White Widow Strain Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint_ww.png",
		}
	},

	["carbon"] = {
		label = "Carbon",
		weight = 1000,
		stack = true,
		close = false,
		description = "Carbon, a base ore.",
		client = {
			image = "carbon.png",
		}
	},

	["raw_sausage"] = {
		label = "Raw Sausage",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_sausage.png",
		}
	},

	["weedplant_package"] = {
		label = "Suspicious Package",
		weight = 10000,
		stack = false,
		close = false,
		description = "Suspicious Package",
		client = {
			image = "weedplant_package.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["milk"] = {
		label = "Milk",
		weight = 200,
		stack = true,
		close = true,
		description = "Milk",
		client = {
			image = "milkcarton.png",
		}
	},

	["chair99"] = {
		label = "Gamer Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair99.png",
		}
	},

	["spoiler3"] = {
		label = "Custom Spoiler",
		weight = 4500,
		stack = true,
		close = true,
		description = "Custom Spoiler",
		client = {
			image = "spoiler3.png",
		}
	},

	["chair36"] = {
		label = "Comfy Ergonomic Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair36.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 1500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["ruby"] = {
		label = "Ruby Gemstone",
		weight = 0,
		stack = true,
		close = false,
		description = "Red like hell and fire",
		client = {
			image = "ruby.png",
		}
	},

	["katana_03"] = {
		label = "Katana 3",
		weight = 11000,
		stack = false,
		close = true,
		description = "When you were partying, I studied the blade.",
		client = {
			image = "np_cursed-katana.png",
		}
	},

	["chair58"] = {
		label = "Zebra Print Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair58.png",
		}
	},

	["c4"] = {
		label = "c4",
		weight = 10,
		stack = true,
		close = true,
		description = "Illegal Explosive",
		client = {
			image = "np_c4.png",
		}
	},

	["tofu"] = {
		label = "Firm Tofu",
		weight = 200,
		stack = true,
		close = true,
		description = "Tofu. Save a Cow and chow on Tofu!",
		client = {
			image = "tofu.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["mixedlettuce"] = {
		label = "Mixed Lettuce",
		weight = 250,
		stack = true,
		close = true,
		description = "Crispy assortment of mixed lettuce",
		client = {
			image = "mixedlettuce.png",
		}
	},

	["burger-toy2"] = {
		label = "Pink Teddy",
		weight = 50,
		stack = false,
		close = false,
		description = "A Fluffy Pink Teddy from the Atic",
		client = {
			image = "beaniebaby.png",
		}
	},

	["engine0"] = {
		label = "Stock Engine A",
		weight = 125,
		stack = true,
		close = true,
		description = "Stock Engine",
		client = {
			image = "engine_parts_a.png",
		}
	},

	["chair103"] = {
		label = "Green Metal Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair103.png",
		}
	},

	["chair87"] = {
		label = "White Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair87.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["gallery_regular"] = {
		label = "Gallery Subscription",
		weight = 0,
		stack = true,
		close = false,
		description = "Regular Membership Card",
		client = {
			image = "gallery_regular.png",
		}
	},

	["gallary_stolenart"] = {
		label = "Art",
		weight = 0,
		stack = true,
		close = false,
		description = "A random piece of art",
		client = {
			image = "gallary_stolenart.png",
		}
	},

	["chair25"] = {
		label = "Red Plastic Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair25.png",
		}
	},

	["weedplant_branch"] = {
		label = "Weed Branch",
		weight = 10000,
		stack = false,
		close = false,
		description = "Weed plant",
		client = {
			image = "weedplant_branch.png",
		}
	},

	["microwave"] = {
		label = "Microwave",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "np_stolenmicrowave.png",
		}
	},

	["fish_mackerel"] = {
		label = "Mackerel",
		weight = 1000,
		stack = true,
		close = false,
		description = "Sometimes holy",
		client = {
			image = "fish_mackerel.png",
		}
	},

	["marijuana_seeds"] = {
		label = "Marijuana Seeds",
		weight = 500,
		stack = true,
		close = true,
		description = "marijuana seeds",
		client = {
			image = "marijuana_seeds.png",
		}
	},

	["chillypepper"] = {
		label = "Chilly Pepper",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chillypepper.png",
		}
	},

	["chair33"] = {
		label = "Black Comfy Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair33.png",
		}
	},

	["cgchain"] = {
		label = "Represent!",
		weight = 1,
		stack = false,
		close = true,
		description = "Represent!",
		client = {
			image = "np_cg_chain.png",
		}
	},

	["chair40"] = {
		label = "Grey Leather Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair40.png",
		}
	},

	["fob_racing_basic"] = {
		label = "Basic Racing Fob",
		weight = 500,
		stack = false,
		close = true,
		description = "This basic fob allows someone to join custom races.",
		client = {
			image = "fob_racing_basic.png",
		}
	},

	["keya"] = {
		label = "Labkey A",
		weight = 0,
		stack = false,
		close = false,
		description = "Labkey A..",
		client = {
			image = "keya.png",
		}
	},

	["engine4"] = {
		label = "Engine Upgrade S",
		weight = 125,
		stack = true,
		close = true,
		description = "Engine Upgrade 4",
		client = {
			image = "engine_parts_s.png",
		}
	},

	["chair17"] = {
		label = "Green Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair17.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["meatrabbit"] = {
		label = "Rabbit Fur",
		weight = 100,
		stack = true,
		close = false,
		description = "Rabbit Fur",
		client = {
			image = "rabbitfur.png",
		}
	},

	["chair52"] = {
		label = "Worn Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair52.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "A baggie of Meth",
		client = {
			image = "meth_baggy.png",
		}
	},

	["uncut_sapphire"] = {
		label = "Uncut Sapphire",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Sapphire",
		client = {
			image = "uncut_sapphire.png",
		}
	},

	["joint_ogk"] = {
		label = "OGKush Strain Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint_ogk.png",
		}
	},

	["burger-potato"] = {
		label = "Bag of Potatoes",
		weight = 1500,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_potato.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["huntingbait"] = {
		label = "Hunting Bait",
		weight = 150,
		stack = true,
		close = true,
		description = "Hunting Bait",
		client = {
			image = "huntingbait.png",
		}
	},

	["chair81"] = {
		label = "Blue Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair81.png",
		}
	},

	["package"] = {
		label = "Suspicious Package",
		weight = 25000,
		stack = false,
		close = false,
		description = "Package covered in tape and milk stickers.\
Marked for Police Seizure",
		client = {
			image = "package.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed-baggie.png",
		}
	},

	["fishinglootbig"] = {
		label = "Treasure Chest",
		weight = 2500,
		stack = true,
		close = true,
		description = "The lock seems to be intact, Might need a key",
		client = {
			image = "fishinglootbig.png",
		}
	},

	["coke10g"] = {
		label = "10g Cocaine",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coke10g.png",
		}
	},

	["flour"] = {
		label = "Flour",
		weight = 200,
		stack = true,
		close = true,
		description = "Flour - cooking ingredient",
		client = {
			image = "flour.png",
		}
	},

	["heistlaptop4"] = {
		label = "Laptop",
		weight = 20000,
		stack = false,
		close = true,
		description = "Pre-configured to access certain systems. Marked for police seizure.",
		client = {
			image = "laptop04.png",
		}
	},

	["umami"] = {
		label = "Umami Beans",
		weight = 300,
		stack = true,
		close = true,
		description = "Healthy and Delicious",
		client = {
			image = "umami.png",
		}
	},

	["ruby_necklace"] = {
		label = "Ruby Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "A ruby necklace seems like the jackpot to me!",
		client = {
			image = "ruby_necklace.png",
		}
	},

	["goldenshower"] = {
		label = "Xenons - Golden Shower",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "goldenshower.png",
		}
	},

	["misopaste"] = {
		label = "Miso Paste",
		weight = 200,
		stack = true,
		close = true,
		description = "Miso Paste - cooking ingredient",
		client = {
			image = "misopaste.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["marijuana_1oz_low"] = {
		label = "1oz marijuana",
		weight = 2800,
		stack = false,
		close = false,
		description = "1oz low grade marijuana",
		client = {
			image = "marijuana_1oz_low.png",
		}
	},

	["uwu_toy4"] = {
		label = "uWu Zoxy",
		weight = 50,
		stack = true,
		close = false,
		description = "Zoxy ",
		client = {
			image = "uwu_toy4.png",
		}
	},

	["emptynitrous"] = {
		label = "Empty Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Empty Nitrous :D",
		client = {
			image = "nitrous.png",
		}
	},

	["sapphire"] = {
		label = "Sapphire Gemstone",
		weight = 0,
		stack = true,
		close = false,
		description = "Blue like the ocean",
		client = {
			image = "sapphire.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["stancerkit"] = {
		label = "Stancer KIT",
		weight = 20000,
		stack = false,
		close = true,
		description = "Browse online like a true gangsta",
		client = {
			image = "laptop_prac.png",
		}
	},

	["empty_watering_can"] = {
		label = "Empty Watering Can",
		weight = 500,
		stack = false,
		close = true,
		description = "Empty watering can",
		client = {
			image = "watering_can.png",
		}
	},

	["grapes"] = {
		label = "Grapes",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "grapes.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["chair44"] = {
		label = "Old Posh Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair44.png",
		}
	},

	["chair91"] = {
		label = "White Leather Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair91.png",
		}
	},

	["burger-softdrink"] = {
		label = "Soft Drink",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ice Cold Drink.",
		client = {
			image = "bs_softdrink.png",
		}
	},

	["pearlscard"] = {
		label = "Pearls Seafood",
		weight = 100,
		stack = true,
		close = true,
		description = "A special member of Pearl's Seafood Restaurant",
		client = {
			image = "pearlscard.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["heistlaptop3"] = {
		label = "Laptop",
		weight = 20000,
		stack = false,
		close = true,
		description = "Pre-configured to access certain systems. Marked for police seizure.",
		client = {
			image = "laptop03.png",
		}
	},

	["suspension2"] = {
		label = "Suspension Upgrade C",
		weight = 125,
		stack = true,
		close = true,
		description = "Suspension Upgrade 2",
		client = {
			image = "stock_suspension.png",
		}
	},

	["heistlaptop1"] = {
		label = "Laptop",
		weight = 20000,
		stack = false,
		close = true,
		description = "Pre-configured to access certain systems. Marked for police seizure.",
		client = {
			image = "laptop01.png",
		}
	},

	["atmobject"] = {
		label = "ATM",
		weight = 200,
		stack = false,
		close = true,
		description = "ATM",
		client = {
			image = "expert_atmobj.png",
		}
	},

	["beef"] = {
		label = "Beef",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beef.png",
		}
	},

	["chair24"] = {
		label = "Old White Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair24.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["rawsugar"] = {
		label = "Raw Sugar",
		weight = 200,
		stack = true,
		close = true,
		description = "Raw Sugar - cooking ingredient",
		client = {
			image = "rawsugar.png",
		}
	},

	["gallary_les_femmes_dalger"] = {
		label = "Les Femmes d'Alger",
		weight = 0,
		stack = true,
		close = false,
		description = "Picasso 1955",
		client = {
			image = "gallary_les_femmes_dalger.png",
		}
	},

	["10kgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["marijuana_water"] = {
		label = "Plant Water",
		weight = 0,
		stack = true,
		close = true,
		description = "Plant water",
		client = {
			image = "marijuana_water.png",
		}
	},

	["joint_bph"] = {
		label = "Purple Haze Strain Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint_bph.png",
		}
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 200,
		stack = true,
		close = true,
		description = "A Road To Happieness!!",
		client = {
			image = "cannabis.png",
		}
	},

	["chair101"] = {
		label = "Black Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair101.png",
		}
	},

	["chair10"] = {
		label = "Black Office Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair10.png",
		}
	},

	["windowtint0"] = {
		label = "Window Tint",
		weight = 2200,
		stack = true,
		close = true,
		description = "Stock Window Tint",
		client = {
			image = "stockwindowtint.png",
		}
	},

	["chair6"] = {
		label = "Grey Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair6.png",
		}
	},

	["burger-moneyshot"] = {
		label = "Moneyshot",
		weight = 300,
		stack = true,
		close = true,
		description = "Sates Hunger.",
		client = {
			image = "bs_money-shot.png",
		}
	},

	["powdercoke"] = {
		label = "Batch of Cocaine Powder",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "powdercoke.png",
		}
	},

	["burger-lettuce"] = {
		label = "Lettuce",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_lettuce.png",
		}
	},

	["windowtint1"] = {
		label = "Window Tint Stage 1",
		weight = 2200,
		stack = true,
		close = true,
		description = "Window Tint Stage 1",
		client = {
			image = "stockwindowtint1.png",
		}
	},

	["k9"] = {
		label = "Police K9",
		weight = 1000,
		stack = true,
		close = true,
		description = "Call For Back Up Buddy",
		client = {
			image = "k9.png",
		}
	},

	["chair59"] = {
		label = "Lime Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair59.png",
		}
	},

	["glucose"] = {
		label = "500g Glucose",
		weight = 1000,
		stack = true,
		close = true,
		description = "Mmmm Glucose.",
		client = {
			image = "glucose.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["avocado"] = {
		label = "Avocado",
		weight = 300,
		stack = true,
		close = true,
		description = "Avocado",
		client = {
			image = "avocado.png",
		}
	},

	["transmission2"] = {
		label = "Transmission Upgrade C",
		weight = 125,
		stack = true,
		close = true,
		description = "Transmission Upgrade 2",
		client = {
			image = "transmission_parts_c.png",
		}
	},

	["weed_purple-haze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed-baggie.png",
		}
	},

	["burger-mshake"] = {
		label = "Milkshake",
		weight = 125,
		stack = true,
		close = true,
		description = "Hand-scooped for you!",
		client = {
			image = "bs_milkshake.png",
		}
	},

	["methbrick"] = {
		label = "Methamphetamine Brick (100g)",
		weight = 10000,
		stack = true,
		close = true,
		description = "Increases your Stamina and Movement Speed, Breaks down into product.",
		client = {
			image = "methbrick.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["chair29"] = {
		label = "Blue Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair29.png",
		}
	},

	["chair73"] = {
		label = "Dark Brown Wood Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair73.png",
		}
	},

	["chair102"] = {
		label = "Red Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair102.png",
		}
	},

	["brake0"] = {
		label = "Stock Brakes A",
		weight = 125,
		stack = true,
		close = true,
		description = "Stock Brake",
		client = {
			image = "brake_parts_a.png",
		}
	},

	["plant_tub"] = {
		label = "Plant Tub",
		weight = 1000,
		stack = true,
		close = false,
		description = "Pot for planting plants",
		client = {
			image = "plant_tub.png",
		}
	},

	["windowtint3"] = {
		label = "Window Tint Stage 3",
		weight = 2200,
		stack = true,
		close = true,
		description = "Window Tint Stage 3",
		client = {
			image = "stockwindowtint3.png",
		}
	},

	["iodine_crystals"] = {
		label = "Iodine Crystals",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "iodine_crystals.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["fish_shark"] = {
		label = "Baby Shark",
		weight = 100000,
		stack = false,
		close = false,
		description = "A fucking shark! Someone might be interested in buying it? Lol, jk. Throw it back. Unless..?",
		client = {
			image = "fish_shark.png",
		}
	},

	["cleaningkit"] = {
		label = "Cleaning Kit",
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["mackerel"] = {
		label = "Mackerel",
		weight = 2500,
		stack = false,
		close = false,
		description = "Mackerel",
		client = {
			image = "mackerel.png",
		}
	},

	["meatcow"] = {
		label = "Cow Pelt",
		weight = 100,
		stack = true,
		close = false,
		description = "Cow Pelt",
		client = {
			image = "cowpelt.png",
		}
	},

	["handdrill"] = {
		label = "Hand Drill",
		weight = 1000,
		stack = true,
		close = false,
		description = "A Hand Drill, can be used on jewellery",
		client = {
			image = "handdrill.png",
		}
	},

	["burger-bleeder"] = {
		label = "Bleeder",
		weight = 250,
		stack = true,
		close = true,
		description = "Sates Hunger.",
		client = {
			image = "bs_the-bleeder.png",
		}
	},

	["koilchain"] = {
		label = "Represent!",
		weight = 1,
		stack = false,
		close = true,
		description = "Represent!",
		client = {
			image = "np_sloth_chain.png",
		}
	},

	["chair107"] = {
		label = "Red Deco Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair107.png",
		}
	},

	["chair2"] = {
		label = "Wood Lounger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair2.png",
		}
	},

	["burger-fries"] = {
		label = "Fries",
		weight = 125,
		stack = true,
		close = true,
		description = "Sates Hunger.",
		client = {
			image = "bs_fries.png",
		}
	},

	["methlabkey"] = {
		label = "Key to a Door (M)",
		weight = 1000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "labkey.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["uwuroseessence"] = {
		label = "Rose Essence",
		weight = 200,
		stack = true,
		close = true,
		description = "Essence from the Rose Gods.",
		client = {
			image = "uwuroseessence.png",
		}
	},

	["marijuana_crop_high"] = {
		label = "Harvested Crop",
		weight = 5500,
		stack = true,
		close = false,
		description = "high grade harvested marijuana crop",
		client = {
			image = "marijuana_crop_high.png",
		}
	},

	["chair30"] = {
		label = "Light Grey Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair30.png",
		}
	},

	["emerald_necklace"] = {
		label = "Emerald Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "A emerald necklace seems like the jackpot to me!",
		client = {
			image = "emerald_necklace.png",
		}
	},

	["meth10g"] = {
		label = "10g Methamphetamine",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "meth10g.png",
		}
	},

	["vase"] = {
		label = "Ancient Vase",
		weight = 0,
		stack = true,
		close = false,
		description = "Probably older than your whole family combined",
		client = {
			image = "vase.png",
		}
	},

	["gallary_dragon"] = {
		label = "Dragon",
		weight = 0,
		stack = true,
		close = false,
		description = "Hopefully its not useless like in GOT",
		client = {
			image = "gallary_dragon.png",
		}
	},

	["chair61"] = {
		label = "Cream Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair61.png",
		}
	},

	["chair48"] = {
		label = "Brown Metal Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair48.png",
		}
	},

	["egg"] = {
		label = "Chicken Egg",
		weight = 200,
		stack = true,
		close = true,
		description = "Egg - cooking ingredient",
		client = {
			image = "egg.png",
		}
	},

	["uwu_toy2"] = {
		label = "uWu Scratzes",
		weight = 50,
		stack = true,
		close = false,
		description = "Scratzes ",
		client = {
			image = "uwu_toy2.png",
		}
	},

	["chair4"] = {
		label = "Old Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair4.png",
		}
	},

	["burger-tomato"] = {
		label = "Tomato",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_tomato.png",
		}
	},

	["chair50"] = {
		label = "Plastic Lawn Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair50.png",
		}
	},

	["chair1"] = {
		label = "Black Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair1.png",
		}
	},

	["tuna"] = {
		label = "Blue Fin Tuna",
		weight = 300,
		stack = true,
		close = true,
		description = "Blue Fin Tuna - cooking ingredient",
		client = {
			image = "tuna.png",
		}
	},

	["rawcoke"] = {
		label = "Batch of Raw Cocaine",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rawcoke.png",
		}
	},

	["telescope"] = {
		label = "Telescope",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "tel.png",
		}
	},

	["chair23"] = {
		label = "Posh White Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair23.png",
		}
	},

	["chair60"] = {
		label = "Brown Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair60.png",
		}
	},

	["fish_cod"] = {
		label = "Cod",
		weight = 1000,
		stack = true,
		close = false,
		description = "Modern Warfare",
		client = {
			image = "fish_cod.png",
		}
	},

	["chair71"] = {
		label = "Brown Lounger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair71.png",
		}
	},

	["marijuana_1oz_high"] = {
		label = "1oz marijuana",
		weight = 2800,
		stack = false,
		close = false,
		description = "1oz high grade marijuana",
		client = {
			image = "marijuana_1oz_high.png",
		}
	},

	["casino_vip"] = {
		label = "V.I.P Membership",
		weight = 500,
		stack = false,
		close = false,
		description = "Diamond Casino V.I.P Card",
		client = {
			image = "casino_vip.png",
		}
	},

	["uwubentobox"] = {
		label = "^=◕ᴥ◕=^ Bento Box",
		weight = 225,
		stack = true,
		close = true,
		description = "A ◕ᴥ◕ Selection with a surprise!",
		client = {
			image = "uwubentobox.png",
		}
	},

	["art"] = {
		label = "Art",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "np_stolenart.png",
		}
	},

	["chair66"] = {
		label = "Yellow Wicker Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair66.png",
		}
	},

	["chair95"] = {
		label = "Dark Brown Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair95.png",
		}
	},

	["casino_blackchip"] = {
		label = "Casino Chip",
		weight = 0,
		stack = true,
		close = false,
		description = "Diamond Casino Blackjack Chip",
		client = {
			image = "casino_blackchip.png",
		}
	},

	["marijuana_baggies"] = {
		label = "Baggies",
		weight = 0,
		stack = true,
		close = true,
		description = "Need some baggies? i got some baggies",
		client = {
			image = "marijuana_baggies.png",
		}
	},

	["codfish"] = {
		label = "Cod",
		weight = 2500,
		stack = false,
		close = false,
		description = "Cod",
		client = {
			image = "codfish.png",
		}
	},

	["weedplant_seedm"] = {
		label = "Male Weed Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "Male Weed Seed",
		client = {
			image = "weedplant_seed.png",
		}
	},

	["uwuchocsandy"] = {
		label = "uWu C-Icecream Sandy",
		weight = 200,
		stack = true,
		close = true,
		description = "Sweet Chocolate Biscuit filled with Icecreamy!",
		client = {
			image = "uwuchocsandy.png",
		}
	},

	["fishingtin"] = {
		label = "Fishing Tin",
		weight = 2500,
		stack = true,
		close = false,
		description = "Fishing Tin",
		client = {
			image = "fishingtin.png",
		}
	},

	["chair55"] = {
		label = "Old Metal ",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair55.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["burger-mshakeformula"] = {
		label = "Milkshake Formula",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_ingredients_icecream.png",
		}
	},

	["casino_redchip"] = {
		label = "Casino Chip",
		weight = 0,
		stack = true,
		close = false,
		description = "Diamond Casino Inside Track Chip",
		client = {
			image = "casino_redchip.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["toy-eggg"] = {
		label = "RoosterRest Toy Egg",
		weight = 1000,
		stack = true,
		close = true,
		description = "Gives Random Toys",
		client = {
			image = "toy-eggg.png",
		}
	},

	["spoiler4"] = {
		label = "Custom Spoiler",
		weight = 5000,
		stack = true,
		close = true,
		description = "Custom Spoiler",
		client = {
			image = "spoiler4.png",
		}
	},

	["marijuana_crop_mid"] = {
		label = "Harvested Crop",
		weight = 5500,
		stack = true,
		close = false,
		description = "mid grade harvested marijuana crop",
		client = {
			image = "marijuana_crop_mid.png",
		}
	},

	["chair93"] = {
		label = "Brown Luxury Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair93.png",
		}
	},

	["raw_pork"] = {
		label = "Raw Pork",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_pork.png",
		}
	},

	["chair90"] = {
		label = "White Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair90.png",
		}
	},

	["meatcoyote"] = {
		label = "Coyote Pelt",
		weight = 100,
		stack = true,
		close = false,
		description = "Coyote Pelt",
		client = {
			image = "coyotepelt.png",
		}
	},

	["diamond_necklace"] = {
		label = "Diamond Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "A diamond necklace seems like the jackpot to me!",
		client = {
			image = "diamond_necklace.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["fishingloot"] = {
		label = "Metal Box",
		weight = 500,
		stack = true,
		close = true,
		description = "Seems to be a corroded from the salt water, Should be easy to open",
		client = {
			image = "fishingloot.png",
		}
	},

	["weed_white-widow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed-baggie.png",
		}
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["sapphire_ring"] = {
		label = "Sapphire Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "A sapphire ring seems like the jackpot to me!",
		client = {
			image = "sapphire_ring.png",
		}
	},

	["methbag"] = {
		label = "Methamphetamine (1g)",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed is the name of the game.",
		client = {
			image = "methbag.png",
		}
	},

	["gsfchain"] = {
		label = "Represent!",
		weight = 1,
		stack = false,
		close = true,
		description = "Represent!",
		client = {
			image = "np_gsf_chain.png",
		}
	},

	["bakingsoda"] = {
		label = "Baking Soda",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its Baking Soda..?",
		client = {
			image = "bakingsoda.png",
		}
	},

	["suspension4"] = {
		label = "Suspension Upgrade S",
		weight = 125,
		stack = true,
		close = true,
		description = "Suspension Upgrade 4",
		client = {
			image = "race_suspension.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["sharkhammer"] = {
		label = "Shark",
		weight = 5000,
		stack = false,
		close = false,
		description = "Hammerhead Shark",
		client = {
			image = "sharkhammer.png",
		}
	},

	["tomato"] = {
		label = "tomato",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato.png",
		}
	},

	["drone"] = {
		label = "drone",
		weight = 0,
		stack = false,
		close = false,
		description = "Fertilizante",
		client = {
			image = "drone.png",
		}
	},

	["uwubudhabowl"] = {
		label = "uWu Budha Bowl",
		weight = 200,
		stack = true,
		close = true,
		description = "Bowl of nourishment and balance.",
		client = {
			image = "uwubudhabowl.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["chair89"] = {
		label = "Light Blue Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair89.png",
		}
	},

	["raw_bacon"] = {
		label = "Raw Bacon",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_bacon.png",
		}
	},

	["cashstack"] = {
		label = "Stack of Cash",
		weight = 0,
		stack = true,
		close = false,
		description = "All nice and sequential.",
		client = {
			image = "cashstack.png",
		}
	},

	["gallary_trophy3"] = {
		label = "Racing Trophy",
		weight = 0,
		stack = true,
		close = false,
		description = "All I do is win",
		client = {
			image = "gallary_trophy3.png",
		}
	},

	["chair68"] = {
		label = "White Metal Dining Chair 2",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair68.png",
		}
	},

	["gallary_skull"] = {
		label = "Diamond Skull",
		weight = 0,
		stack = true,
		close = false,
		description = "For the Love of God - Hirst 2007",
		client = {
			image = "gallary_skull.png",
		}
	},

	["chair56"] = {
		label = "Old Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair56.png",
		}
	},

	["fishingboot"] = {
		label = "Fishing Boot",
		weight = 2500,
		stack = true,
		close = false,
		description = "Fishing Boot",
		client = {
			image = "fishingboot.png",
		}
	},

	["weed_bag"] = {
		label = "Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real fast.",
		client = {
			image = "weed-baggie.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["greenpepper"] = {
		label = "Green Pepper",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "greenpepper.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed-plant-seed.png",
		}
	},

	["towingrope"] = {
		label = "Towing Rope",
		weight = 200,
		stack = false,
		close = true,
		description = "Towing Rope",
		client = {
			image = "expert_towingrope.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["burger-toy1"] = {
		label = "Action Figure",
		weight = 50,
		stack = false,
		close = false,
		description = "An Action Figure From the late 90's",
		client = {
			image = "action-figure.png",
		}
	},

	["safecracker"] = {
		label = "Safe Cracker",
		weight = 1000,
		stack = false,
		close = true,
		description = "Useful for opening strong locks.",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["rentalpapers"] = {
		label = "Rental Papers",
		weight = 0,
		stack = false,
		close = false,
		description = "Yea, this is my car i can prove it!",
		client = {
			image = "receipt.png",
		}
	},

	["windowtint2"] = {
		label = "Window Tint Stage 2",
		weight = 2200,
		stack = true,
		close = true,
		description = "Window Tint Stage 2",
		client = {
			image = "stockwindowtint2.png",
		}
	},

	["emerald_ring"] = {
		label = "Emerald Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "A emerald ring seems like the jackpot to me!",
		client = {
			image = "emerald_ring.png",
		}
	},

	["chair64"] = {
		label = "Striped Camping Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair64.png",
		}
	},

	["gallary_mona_lisa"] = {
		label = "Mona Lisa",
		weight = 0,
		stack = true,
		close = false,
		description = "Da Vinci 1517",
		client = {
			image = "gallary_mona_lisa.png",
		}
	},

	["meatdeer"] = {
		label = "Deer Horns",
		weight = 100,
		stack = true,
		close = false,
		description = "Deer Horns",
		client = {
			image = "deerhorns.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["gallery_premium"] = {
		label = "Gallery Premium",
		weight = 0,
		stack = true,
		close = false,
		description = "Premiere Membership Card",
		client = {
			image = "gallery_premium.png",
		}
	},

	["chair65"] = {
		label = "Posh Lounger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair65.png",
		}
	},

	["blue"] = {
		label = "Xenons - Blue",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "blue.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 5000,
		stack = false,
		close = true,
		description = "News Microphone | Property of Weazel News",
		client = {
			image = "np_news_mic.png",
		}
	},

	["chair12"] = {
		label = "Used Brown Office Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair12.png",
		}
	},

	["chair22"] = {
		label = "Posh Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair22.png",
		}
	},

	["weed_white-widow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed-plant-seed.png",
		}
	},

	["chair27"] = {
		label = "Black Leather Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair27.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["copperore"] = {
		label = "Copper Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Copper, a base ore.",
		client = {
			image = "copperore.png",
		}
	},

	["vanillabean"] = {
		label = "Vanilla Bean",
		weight = 200,
		stack = true,
		close = true,
		description = "Vanilla Bean - cooking ingredient",
		client = {
			image = "vanillabean.png",
		}
	},

	["chair92"] = {
		label = "Brown Couch",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair92.png",
		}
	},

	["engine1"] = {
		label = "Engine Upgrade B",
		weight = 125,
		stack = true,
		close = true,
		description = "Engine Upgrade 1",
		client = {
			image = "engine_parts_b.png",
		}
	},

	["fish_bluefish"] = {
		label = "Bluefish",
		weight = 1000,
		stack = true,
		close = false,
		description = "Whoever coined this name was a genius",
		client = {
			image = "fish_bluefish.png",
		}
	},

	["fishingkey"] = {
		label = "Corroded Key",
		weight = 100,
		stack = true,
		close = true,
		description = "A weathered key that looks usefull",
		client = {
			image = "fishingkey.png",
		}
	},

	["marijuana_phone"] = {
		label = "Burner Phone",
		weight = 0,
		stack = true,
		close = true,
		description = "Burner phone used to sell eights",
		client = {
			image = "marijuana_phone.png",
		}
	},

	["driver_license"] = {
		label = "Drivers License",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["chair57"] = {
		label = "Purple Leather Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair57.png",
		}
	},

	["chair104"] = {
		label = "Blue Metal Dining Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair104.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["milkbucket"] = {
		label = "Milk Bucket",
		weight = 75,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milkbucket.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["flounder"] = {
		label = "Flounder",
		weight = 2500,
		stack = false,
		close = false,
		description = "Flounder",
		client = {
			image = "flounder.png",
		}
	},

	["heistlaptop2"] = {
		label = "Laptop",
		weight = 20000,
		stack = false,
		close = true,
		description = "Pre-configured to access certain systems. Marked for police seizure.",
		client = {
			image = "laptop02.png",
		}
	},

	["fish"] = {
		label = "Fish",
		weight = 1000,
		stack = true,
		close = false,
		description = "Just a fish",
		client = {
			image = "fish.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["cerberuschain"] = {
		label = "Represent!",
		weight = 1,
		stack = false,
		close = true,
		description = "Represent!",
		client = {
			image = "np_cerberus_chain.png",
		}
	},

	["meat"] = {
		label = "Meat",
		weight = 100,
		stack = true,
		close = false,
		description = "Some big taco brother",
		client = {
			image = "meat.png",
		}
	},

	["police_stormram"] = {
		label = "Stormram",
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["burger-meat"] = {
		label = "Cooked Patty",
		weight = 125,
		stack = true,
		close = true,
		description = "An Ingredient",
		client = {
			image = "bs_patty.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["chocolate"] = {
		label = "Chocolate",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate - cooking ingredient",
		client = {
			image = "chocolate.png",
		}
	},

	["cooked_ham"] = {
		label = "Cooked Ham",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_ham.png",
		}
	},

	["customlicense"] = {
		label = "Business License",
		weight = 0,
		stack = false,
		close = true,
		description = "Custom License",
		client = {
			image = "receipt.png",
		}
	},

	["soybeans"] = {
		label = "Soy Beans",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "soybeans.png",
		}
	},

	["heistlaptopprac"] = {
		label = "Laptop",
		weight = 20000,
		stack = false,
		close = true,
		description = "Browse online like a true gangsta",
		client = {
			image = "laptop_prac.png",
		}
	},

	["id_card"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself",
		client = {
			image = "id_card.png",
		}
	},

	["katana_02"] = {
		label = "Katana 2",
		weight = 11000,
		stack = false,
		close = true,
		description = "When you were partying, I studied the blade.",
		client = {
			image = "np_cursed-katana.png",
		}
	},

	["marijuana_3.5_mid"] = {
		label = "3.5g marijuana",
		weight = 2800,
		stack = false,
		close = true,
		description = "3.5g mid grade marijuana",
		client = {
			image = "marijuana_3.5_mid.png",
		}
	},

	["fishtaco"] = {
		label = "Fishtaco",
		weight = 1000,
		stack = true,
		close = true,
		description = "Make like the fishes.",
		client = {
			image = "fishtaco.png",
		}
	},

	["purple"] = {
		label = "Xenons - Purple",
		weight = 500,
		stack = true,
		close = true,
		description = "Coloured Headlights",
		client = {
			image = "purple.png",
		}
	},

	["cow_leather"] = {
		label = "Cow Skin",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cow_leather.png",
		}
	},

	["chair42"] = {
		label = "Brown Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair42.png",
		}
	},

	["marijuana_rollingpapers"] = {
		label = "Rolling Papers",
		weight = 0,
		stack = true,
		close = true,
		description = "These aint Raw Rolling Papers!!?",
		client = {
			image = "marijuana_rollingpapers.png",
		}
	},

	["marijuana_3.5_low"] = {
		label = "3.5g marijuana",
		weight = 2800,
		stack = false,
		close = true,
		description = "3.5g low grade marijuana",
		client = {
			image = "marijuana_3.5_low.png",
		}
	},

	["fob_racing_master"] = {
		label = "Master Racing Fob",
		weight = 500,
		stack = false,
		close = true,
		description = "This master fob allows someone to create custom races.",
		client = {
			image = "fob_racing_master.png",
		}
	},

	["gallary_maltese_falcon"] = {
		label = "Maltese Falcon",
		weight = 0,
		stack = true,
		close = false,
		description = "Highly prized movie prop",
		client = {
			image = "gallary_maltese_falcon.png",
		}
	},

	["pumpkinpiebox"] = {
		label = "Box of Pie",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pumpkinpiebox.png",
		}
	},

	["gallary_trophy2"] = {
		label = "Food Trophy",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "gallary_trophy2.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["chair98"] = {
		label = "Red/Green Gamer Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair98.png",
		}
	},

	["chair26"] = {
		label = "Blue Plastic Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair26.png",
		}
	},

	["transmission3"] = {
		label = "Transmission Upgrade S",
		weight = 125,
		stack = true,
		close = true,
		description = "Transmission Upgrade 3",
		client = {
			image = "transmission_parts_s.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["pig_leather"] = {
		label = "Pig Skin",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_leather.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed-baggie.png",
		}
	},

	["chair100"] = {
		label = "Blue Metal Chair",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chair100.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["bobcatsecuritycard"] = {
		label = "Bobcat Security Keycard",
		weight = 1000,
		stack = false,
		close = true,
		description = "For Gruppe6 contractors.",
		client = {
			image = "gruppe62.png",
		}
	},

	["payticket"] = {
		label = "Receipt",
		weight = 150,
		stack = true,
		close = false,
		description = "Cash these in at the bank!",
		client = {
			image = "ticket.png",
		}
	},
}