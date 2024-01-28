fx_version "cerulean"
games { "gta5" }

client_scripts {
    'client/cl_*.lua',
}

server_script {
    'server/sv_*.lua',
    '@oxmysql/lib/MySQL.lua'
   }