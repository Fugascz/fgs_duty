ESX = nil
local nearestCoords
local timeToWait = 500

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(1)
    end
	if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	Wait(1)
  	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	Wait(1)
	ESX.PlayerData.job = job
end)

-- Thread to marker is from Squizer's documentation.
-- Thanks to Squizer for posting. ❤
-- https://docs.squizer.cz/snippets/optimalization
Citizen.CreateThread(function()
    while true do
        Wait(500)
        if nearestCoords then
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            if #(pedCoords - nearestCoords) > (Config.DrawDistance) then
                nearestCoords = nil
                timeToWait = 500
            else
                Wait(500)
            end
        else
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Wait(timeToWait)

        for k,v in pairs(Config.Duty) do
            if v.Jobs[ESX.PlayerData.job.name] then
                local coords = GetEntityCoords(PlayerPedId())
                local dist = #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z))
                if (v.Enable and dist < (Config.DrawDistance)) then
                    if not nearestCoords then
                        timeToWait = 0
                        nearestCoords = vector3(v.Pos.x, v.Pos.y, v.Pos.z)
                    end
                    DrawMarker(v.Marker.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.Size.x, v.Marker.Size.y, v.Marker.Size.z, v.Marker.Color.r, v.Marker.Color.g, v.Marker.Color.b, 100, false, false, 2, true, false, false, false)
                    if dist < 1 then
                        DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z + 0.75, '[E] ON/OFF DUTY')
                        if IsControlJustPressed(0, 38) then
                            TriggerServerEvent('fgs-duty:set')
                        end
                    end
                end
            end
        end
    end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.5, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 200
    DrawRect(_x,_y+0.0105, 0.025+ factor, 0.05, 41, 11, 41, 150)
end