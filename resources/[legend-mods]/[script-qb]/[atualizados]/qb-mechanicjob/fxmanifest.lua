fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'qb-mechanicjob'
version '3.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/pt.lua',
    'locales/*.lua',
    'config/*.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/*',
    'carcols_gen9.meta',
    'carmodcols_gen9.meta'
}

data_file 'CARCOLS_GEN9_FILE' 'carcols_gen9.meta'
data_file 'CARMODCOLS_GEN9_FILE' 'carmodcols_gen9.meta'
