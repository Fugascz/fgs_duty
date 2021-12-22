ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESX.TriggerClient, function(obj) ESX = obj end)
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

CreateThread(function()
    while true do
        Wait(0)
			
	local sleep = true

        for _, v in pairs(Config.Zones) do
            if v.Jobs[ESX.PlayerData.job.name] then
                local coords = GetEntityCoords(PlayerPedId())
                local dist = #(coords - v.Pos)
                if v.Enable and dist <= Config.DrawDistance then
                    sleep = false
                    DrawMarker(v.Marker.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.Size.x, v.Marker.Size.y, v.Marker.Size.z, v.Marker.Color.r, v.Marker.Color.g, v.Marker.Color.b, v.Marker.Color.a, false, false, 2, true, false, false, false)
                    if dist < 1 then
                        DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z + 0.75, '[E] ON/OFF DUTY')
                        if IsControlJustPressed(0, 38) then
                            duty()
                        end
                    end
                end
            end
        end
			
	if sleep then
		Wait(500)
	end
    end
end)
