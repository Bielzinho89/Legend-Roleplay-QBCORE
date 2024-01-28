fx_version 'cerulean'
game 'gta5'

client_scripts {
	"client/cl_*.lua"
}

server_script {
    'server/sv_*.lua',
    '@oxmysql/lib/MySQL.lua'
   }

shared_scripts { 
	"config.lua"
}
lua54 'yes'
escrow_ignore {
   'config.lua'	 
}