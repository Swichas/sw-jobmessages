fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Swichas | Ux desing'

description 'Simple job messages system'

client_scripts {
    'locales/init.lua',
    'locales/*.lua',
    'client/client.lua',
}
server_scripts {
    'locales/init.lua',
    'locales/*.lua',
    'server/server.lua',
}
shared_scripts {
    '@ox_lib/init.lua',
        'config.lua',

}