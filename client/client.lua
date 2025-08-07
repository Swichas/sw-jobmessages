

if cfg.framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif cfg.framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
end


local notify = function(message, type)
    local notifys = cfg.notifys

    if notifys == "ox_lib" then
    exports.ox_lib:notify({
        title = _U('job_messages_title'),
        description = message,
        type = type or "info"
    })
    elseif notifys == "esx" then
    TriggerEvent('esx:showNotification', message)
    elseif notifys == "qbcore" then
    TriggerEvent('QBCore:Notify', message, type or "info") 
    elseif notifys == "lation_ui" then
    exports.lation_ui:notify({
        title = _U('job_messages_title'),
        message = message,
        type = type or "info"
    })
    else
        print(_U('invalid_notification'))
    end
end

function checkifboss(job)
    if QBCore then
        local Player = QBCore.Functions.GetPlayerData()
        local jobgrade = Player.job.grade.name
        
        local isBoss = false
        for _, grade in pairs(cfg.job[job].bossgrade) do
            if grade == jobgrade then
                isBoss = true
                break
            end
        end
        
        if isBoss then
            OpenDialog(job)
            return true
        else
            notify(_U('not_boss'), "error")
            return false
        end
    
    elseif ESX then
        local Player = ESX.GetPlayerData() 
        local jobData = Player.job
        local jobgrade = jobData.grade_name

        local isBoss = false
        for _, grade in pairs(cfg.job[job].bossgrade) do
            if grade == jobgrade then
                isBoss = true
                break
            end
        end
        
        if isBoss then
            OpenDialog(job)
            return true
        else
            notify(_U('not_boss'), "error")
            return false
        end
    
    else
        print(_U('invalid_framework'))
    
    end
end

function checkcanuseit(job)
if cfg.job[job] then
       if cfg.job[job].onlyboss then
            checkifboss(job)
       else
            OpenDialog(job)

            return true
       end
        else
        notify(_U('not_allowed'), "error")
        return false 
    end
end

function OpenDialog(job)
    if cfg.menu == "ox_lib" then

    local result = lib.inputDialog(_U('job_messages_title'), {
        {type = 'input', label = _U('job_message_label'), placeholder = _U('job_message_placeholder'), required = true}   
    })
    if result then
        TriggerServerEvent('sendjobnotify',result[1],cfg.job[job],job)
    else
        notify(_U('no_message_entered'), "error")
        return
    end

    elseif cfg.menu == "lation_ui" then

    local result = exports.lation_ui:input({

    title = _U('job_messages_title'),
    subtitle = "",
    submitText = _U('submit_text'),
    options = {
        {
            type = 'input',
            label = _U('job_message_label'),
            description = _U('job_message_description'),
            placeholder = _U('job_message_placeholder'),
            required = true
        },
    }

    })
    if result then
        TriggerServerEvent('sendjobnotify', -1,result[1],cfg.job[job],job)
    else
        notify(_U('no_message_entered'), "error")
        return
    end

    end
end

if cfg.usecommand then
    RegisterCommand(cfg.command, function()
        local job = ""
        if ESX then
        local Player = ESX.GetPlayerData() 
         job = Player.job.name
        elseif QBCore then
        local Player = QBCore.Functions.GetPlayerData()
        job = Player.job.name
        end
        checkcanuseit(job)
    end, false)
end     

if cfg.export then
    exports(cfg.export, function()
        local job = ""
        if ESX then
        local Player = ESX.GetPlayerData() 
         job = Player.job.name
        elseif QBCore then
        local Player = QBCore.Functions.GetPlayerData()
        job = Player.job.name
        end

    checkcanuseit(job)


    end)
end     


