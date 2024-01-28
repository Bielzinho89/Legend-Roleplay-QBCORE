fx_version 'cerulean'
game 'gta5'

shared_scripts { 
	'config.lua'
}

client_scripts {
    "client/cl_*.lua"
}

server_scripts {
    "server/sv_*.lua"
}

server_exports {
    'GetDealers'
}

lua54 'yes'