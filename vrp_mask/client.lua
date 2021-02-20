RegisterNetEvent( 'maskon' )
AddEventHandler( 'maskon', function()
        mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 14, 1, 1)
        else
            SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 1) --remove
        end
end)