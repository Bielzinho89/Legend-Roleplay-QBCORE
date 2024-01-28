fx_version 'cerulean'
game 'gta5'

shared_scripts {
	'config.lua',
	'configs/*.lua',
}

server_script 'server/main.lua'

client_script 'client/main.lua'

ui_page 'html/door.html'

files {
	'html/*.html',
	'html/*.js',
	'html/*.css',

	'html/sounds/*.ogg',
	'html/sounds/*.wav',
}

lua54 'yes'
escrow_ignore {
   'html/*',
   'configs/*',
   'config.lua'	 
}