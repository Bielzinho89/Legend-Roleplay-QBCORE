resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


dependency 'meta_libs'

client_scripts {
  'colors-rgb.lua',
  
  'langs/main.lua',
  'langs/en.lua',

  'config.lua',
  'utils.lua',
  'client/main.lua',
}

server_scripts {

  'langs/main.lua',
  'langs/en.lua',

  'config.lua',
  'credentials.lua',
  'utils.lua',
  'server/main.lua',
}

