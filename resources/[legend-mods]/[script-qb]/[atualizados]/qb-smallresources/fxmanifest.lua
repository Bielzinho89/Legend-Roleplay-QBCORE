fx_version 'cerulean'
game 'gta5'


shared_script 'config.lua'

client_script 'client/*.lua'



server_script {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua'
   }


data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat'
}

exports {
	'HasHarness'
}

lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}