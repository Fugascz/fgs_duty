function duty()
    if Config.Animation.Enable then
        playAnim(PlayerPedId(), Config.Animation.Dict, Config.Animation.DictAnim, Config.Animation.Time, function(isDone)
            if isDone then
                TriggerServerEvent('fgs-duty:setDuty')
            end
        end)
    else
        TriggerServerEvent('fgs-duty:setDuty')
    end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function playAnim(ped, dict, dictAnim, time, cb)
    loadAnimDict(dict)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim(ped, dict, dictAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    Wait(time)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    RemoveAnimDict(dict)
    cb(true)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = #(p - vector3(x, y, z))
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 150)
    end
end