RegisterNetEvent('sendjobnotify', function(cheatercheck, message,jobData)
   
  
    local label = jobData.label
    local color = jobData.color or "#FFFFFF" -- Default color if not specified
    local icon = jobData.icon or "fa-solid fa-bell" -- Default icon if not specified
    if cfg.notifys == "ox_lib" then

        TriggerClientEvent('ox_lib:notify', cheatercheck, {
                 title = label,
            description  = message,
            type = "info",
            icon = icon,
                style = {

            backgroundColor = color,},

                position = 'top',


        })

    elseif cfg.notifys == "lation_ui" then
    

              TriggerClientEvent('Lationnotyfy', -1, message,label,icon,color)

    else
        print(_U('invalid_notifys'))
    end


    
end)