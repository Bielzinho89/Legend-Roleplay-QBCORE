fx_version "bodacious"
game "gta5"

ui_page "html/index.html"

files {
	"html/index.html",
	"html/style.css",
	"html/script.js",
	"html/img.png"
}

client_scripts {
	"client/cl_*.lua"
}

server_script {
	'server/sv_*.lua',
	'@oxmysql/lib/MySQL.lua'
   }