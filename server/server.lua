if cfg.framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif cfg.framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
end

RegisterNetEvent('sendjobnotify', function( message,jobData,jobsee)
    if ESX then
    local xPlayer = ESX.GetPlayerFromId(sorurce)
    local job = xPlayer.getJob().name
    elseif QBCore then
    local Player = QBCore.Functions.GetPlayer(source)
    job = Player.PlayerData.job.name
    end

    if jobsee == job then

    local label = jobData.label
    local color = jobData.color or "#FFFFFF" 
    local icon = jobData.icon or "fa-solid fa-bell"
    notify = cfg.notifys 
    if notify == "ox_lib" then
        TriggerClientEvent('ox_lib:notify', -1, {
            title = label,
            description = message,
            type = "info",
            icon = icon,
            style = {
                backgroundColor = color,
            },
            position = 'top',
        })
    elseif notify == "esx" then
        TriggerClientEvent('esx:showNotification', -1, message)
    elseif notify == "qbcore" then
        TriggerClientEvent('QBCore:Notify', -1, message, "info")
    elseif notify == "lation_ui" then
        TriggerClientEvent('lation_ui:notify', -1, {
            title = label,
            description = message,
            type = "info",
            icon = icon,
            style = {
                backgroundColor = color,
            },
            position = 'top',
        })
    end

    else
        return false
    end
end)

