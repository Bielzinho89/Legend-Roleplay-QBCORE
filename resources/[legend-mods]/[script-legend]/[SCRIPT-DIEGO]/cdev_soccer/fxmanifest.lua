fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'CDev Development Team'
description ''
version '1.0.6'

client_scripts {
    -- Dependencies
    '@cdev_lib/shared/external.lua',
    '@cdev_lib/shared/keys.lua',
    --'@cdev_lib/shared/nui.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',

    -- Public scripts
    'public/config/config.lua',
    'public/config/fields.lua',
    'public/client/api.lua',

    -- Escrowed scripts
    'client/ui.lua',
    'client/field.lua',
    'client/main.lua',
    'data/languages/*.lua',
}

server_scripts {
    -- Dependencies
    '@cdev_lib/shared/external.lua',

    -- Public scripts
    'public/config/config.lua',
    'public/config/fields.lua',
    'public/server/api.lua',

    -- Escrowed scripts
    'server/field.lua',
    'server/main.lua',
    'data/languages/*.lua',
}

escrow_ignore {
    'public/config/config.lua',
    'public/config/fields.lua',
    'public/client/api.lua',
    'public/server/api.lua',
    'data/languages/*.lua',
}

files {
    "nui/dist/**"
}

ui_page "nui/dist/index.html"

dependencies {
    '/server:4752',
    'cdev_lib',
}
dependency '/assetpacks'