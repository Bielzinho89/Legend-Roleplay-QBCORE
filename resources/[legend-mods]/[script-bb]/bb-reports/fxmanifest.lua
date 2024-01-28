fx_version 'cerulean'
games { 'gta5' }

author 'society'
description 'Report System'
version '1.0.0'

ui_page 'html/index.html'
	files { 
        'html/index.html',
        'html/index.js',
        'html/index.css',
        'html/reset.css'
	}

client_script {'client.lua'}
server_script {'server.lua'}