fx_version 'bodacious'
games { 'gta5' }


client_scripts {
    'client/*.lua',
}

ui_page {
    'html/index.html',
}
files {
    'html/index.html',
    'html/*.css',
    'html/*.js',
}

exports {
    "StartLockPickCircle"
}

lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}