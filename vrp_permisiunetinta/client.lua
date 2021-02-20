vRPCtinta = {}
Tunnel.bindInterface("vrp_permisiunetinta",vRPCtinta)
Proxy.addInterface("vrp_permisiunetinta",vRPCtinta)
vRPStinta = Tunnel.getInterfata("vrp_permisiunetinta","vrp_permisiunetinta")
vRP = Proxy.getInterface("vRP")

local activat = true

Citizen.CreateThread( function()
    while true do 
        Wait(0)
        if (activat == true) then
		    HideHudComponentThisFrame(14)	
        end
    end 
end)

RegisterCommand("tinta", function(source)
    if vRPStinta.verificapermisiunea() then 
        vRPCtinta.activare()
    end
end)

function vRPCtinta.activare()
    activat = false
end
