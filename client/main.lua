Citizen.CreateThread(function()
    while true do
        
        Citizen.Wait(100)
        
        local playerPed = PlayerPedId()

        while not IsPedInAnyVehicle(playerPed, false) do
            print('Ped nicht in Fahrzeug')
            Citizen.Wait(2500)
        end

        print('ped in vehicle')
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        print(vehicle)
        local maxSpeed = calcMaxSpeed(Config.MaxSpeed)

        print(maxSpeed)
        SetVehicleMaxSpeed(vehicle, maxSpeed)
        Citizen.Wait(2500)
    end
end)

-- Speed * 3.6 = kmh
-- Speed * 2.236936 = mph

function calcMaxSpeed(maxSpeed)
    if Config.UseKmh then 
        speed = maxSpeed / 3.6 -- for kmh
        return speed
    else 
        speed = maxSpeed / 2.236936 -- for mph
        return speed
    end
end
