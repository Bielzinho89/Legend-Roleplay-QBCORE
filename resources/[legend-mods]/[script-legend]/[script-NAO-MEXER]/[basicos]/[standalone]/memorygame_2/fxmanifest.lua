fx_version 'adamant'

game 'gta5'

server_scripts {
  --'server/server.lua',
}

client_scripts {
  'client/main.lua',
}

ui_page {
  'html/index.html'
}

files {
  'html/index.html',
  'html/style.css',
  'html/app.js'
}

lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}