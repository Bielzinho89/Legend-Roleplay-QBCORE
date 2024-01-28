fx_version 'cerulean'
games { 'gta5' }

shared_scripts {
    'lua/shared/sh_*.lua',
}

client_scripts {
    'lua/client/*.lua'
}


server_script {
    'lua/server/*.lua',
    '@oxmysql/lib/MySQL.lua'
   }

ui_page 'html/index.html'

files {
	'html/index.html',
    'html/app.js',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/css/*.css'
}


lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}