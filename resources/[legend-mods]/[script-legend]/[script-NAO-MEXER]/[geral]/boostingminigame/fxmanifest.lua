fx_version 'cerulean'
games { 'rdr3', 'gta5' }

version '1.0.0'

-- What to run
client_scripts {
    'cl_main.lua',
}

files {
    'ui/*',
    'ui/assets/*'
}

ui_page 'ui/index.html'

export 'Open'

lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}