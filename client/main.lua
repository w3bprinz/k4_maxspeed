Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            SetVehicleMaxSpeed(vehicle, calcMaxSpeed(Config.MaxSpeed))
        end
       Citizen.Wait(500)
    end
end)

function calcMaxSpeed(maxSpeed)
    if Config.UseKmh then 
        speed = maxSpeed * 3.6 -- for kmh
    else 
        speed = maxSpeed * 2.236936 -- for mph
        return speed
    end
end
