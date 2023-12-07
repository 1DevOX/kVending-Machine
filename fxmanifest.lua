fx_version 'adamant'
game 'gta5'
description 'Kiwi'

lua54 'yes'


shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'config/*.lua',
    'client/*.lua'
    
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'config/*.lua',
    'server/*.lua'
}
