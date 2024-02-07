fx_version 'cerulean'
games { 'gta5' }

client_scripts {
  'client/cl_*.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/sv_*.lua'
  
}

shared_script "config.lua"

ui_page 'ui/index.html'

files {
  'ui/*'
}