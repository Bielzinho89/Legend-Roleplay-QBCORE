CONFIG = {}

CONFIG['BaseTime'] = math.random(01, 01) -- time in minutes the washing machine always takes
CONFIG['TimePerItem'] = math.random(1, 5) -- time in minutes each additional item of dirty money adds
CONFIG['PoliceIncrease'] = 0.01 -- percentage to increase per officer around

CONFIG['Machines'] = {
	{name="Washing Machine", cost="5", perc=0.6, vec=vector3(1136.28, -992.11, 46.11), available=true, finished=false, player=0, worth=0, lastsound=0},
	{name="Washing Machine", cost="5", perc=0.6, vec=vector3(1136.09, -990.77, 46.11), available=true, finished=false, player=0, worth=0, lastsound=0},
	{name="Washing Machine", cost="5", perc=0.6, vec=vector3(1135.98, -989.56, 46.11), available=true, finished=false, player=0, worth=0, lastsound=0},
	{name="Washing Machine", cost="5", perc=0.6, vec=vector3(1135.74, -988.05, 46.11), available=true, finished=false, player=0, worth=0, lastsound=0},
}