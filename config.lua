cfg = {}

cfg.locale = 'lt' -- Options: 'en', 'lt'
cfg.framework = 'qbcore' -- Options: 'esx', 'qbcore'
cfg.menu = "lation_ui" -- Options: 'ox_lib', "lation_ui"
cfg.notifys = "lation_ui" -- Options: 'ox_lib', "esx", "qbcore", "lation_ui"

-- Do you use command or export to open the menu?
cfg.usecommand = true -- Use command to open the menu
cfg.command = "darbozinute" -- Command to open the menu
cfg.useexport = false -- Use export to open the menu, if true, command will be ignored
cfg.export = "jobmessages:openMenu" -- Export to open the menu





cfg.job = {
    ['police'] = {
        label = 'Police',
        color = '#FF0055FF', -- collor for the police job
        bossgrade = {'boss'}, -- Boss grade for the police job
        onlyboss = true, -- Only bosses can use the menu
        icon = "fa-solid fa-shield-halved", -- Icon for the police job
    },
    ['ambulance'] = {
        label = 'Ambulance',
        color = '#FFFF0000', -- collor for the ambulance job
        bossgrade = {'boss'}, -- Boss grade for the police job
        onlyboss = true, -- Only bosses can use the menu
        icon = "fa-solid fa-shield-halved", -- Icon for the police job

    },
    ['mechanic'] = {
        label = 'Mechanikai',
        color = '#e35c5c', -- collor for the mechanic job
        bossgrade = {'boss'}, -- Boss grade for the police job
        onlyboss = true, -- Only bosses can use the menu
        icon = "fa-solid fa-shield-halved", -- Icon for the police job


    },
}
