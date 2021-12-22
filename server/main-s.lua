ESX = nil
TriggerEvent(Config.ESX.TriggerServer, function(obj) ESX = obj end)

RegisterNetEvent('fgs-duty:setDuty')
AddEventHandler('fgs-duty:setDuty', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer then
        local playerJob = xPlayer.job.name
        local playerGrade = xPlayer.job.grade

        local offDuty = string.format('off%s', playerJob)
        local onDuty = string.gsub(playerJob, 'off', '')

        if playerJob == 'off' .. offDuty then
            xPlayer.setJob(onDuty, playerGrade)
            TriggerClientEvent('mythic_notify:client:SendAlert', _src, { type = 'inform', text = Config.Text['youAreInDuty']})
            DiscordWebhook('**ON DUTY**', string.format('%s: **%s (%s)** \n %s: **%s** - **%s**', Config.Text['player'], GetPlayerName(_src), xPlayer.getIdentifier(), Config.Text['cameToDuty'], xPlayer.job.label, xPlayer.job.grade_label))
        elseif v.Jobs[onDuty] and playerJob == onDuty then
            xPlayer.setJob(offDuty, playerGrade)
            TriggerClientEvent('mythic_notify:client:SendAlert', _src, { type = 'inform', text = Config.Text['youAreOffDuty']})
            DiscordWebhook('**OFF DUTY**', string.format('%s: **%s (%s)** \n Odešel ze služby: **%s** - **%s**', Config.Text['player'], GetPlayerName(_src), xPlayer.getIdentifier(), Config.Text['leftTheService'], xPlayer.job.label, xPlayer.job.grade_label))
        end
    end
end)

function DiscordWebhook(title, msg)
    local connect = {
        {
            ["color"] = Config.Webhook.Color,
            ["title"] = title,
            ["description"] = msg,
            ["footer"] = {
                ["text"] = 'fgs-duty | ' .. os.date('%H:%M - %d. %m. %Y', os.time()),
                ["icon_url"] = Config.Webhook.Icon,
            },
        }
    }
    PerformHttpRequest(Config.Webhook.Link, function(err, text, headers) end, 'POST', json.encode({username = "ON/OFF DUTY", embeds = connect}), { ['Content-Type'] = 'application/json' })
end
