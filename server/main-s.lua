ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('fgs-duty:set')
AddEventHandler('fgs-duty:set', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local playerJob = xPlayer.job.name
    local playerGrade = xPlayer.job.grade

    local offDuty = string.format('off%s', playerJob)
    local onDuty = string.gsub(playerJob, 'off', '')

    if playerJob == 'police' or playerJob == 'sheriff' or playerJob == 'ambulance' then
        xPlayer.setJob(offDuty, playerGrade)
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Jsi mimo službu.'})

        DiscordWebhook('**OFF DUTY**', string.format('Hráč: **%s (%s)** \n Odešel ze služby: **%s** - **%s**', GetPlayerName(_source), xPlayer.getIdentifier(), xPlayer.job.label, xPlayer.job.grade_label))
    elseif playerJob == 'offpolice' or playerJob == 'offsheriff' or playerJob == 'offambulance' then
        xPlayer.setJob(onDuty, playerGrade)
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Jsi ve službě.'})
       
        DiscordWebhook('**ON DUTY**', string.format('Hráč: **%s (%s)** \n Přišel do služby: **%s** - **%s**', GetPlayerName(_source), xPlayer.getIdentifier(), xPlayer.job.label, xPlayer.job.grade_label))
    end
end)

function DiscordWebhook(title, msg)
    local connect = {
        {
            ["color"] = 9699539,
            ["title"] = title,
            ["description"] = msg,
            ["footer"] = {
                ["text"] = 'fgs_duty | ' .. os.date('%H:%M - %d. %m. %Y', os.time()),
                ["icon_url"] = Config.Webhook.Icon,
            },
        }
    }
    PerformHttpRequest(Config.Webhook.Link, function(err, text, headers) end, 'POST', json.encode({username = "ON/OFF DUTY", embeds = connect}), { ['Content-Type'] = 'application/json' })
end
