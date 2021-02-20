local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPclient = Tunnel.getInterface("vRP", "vrp_permisiunetinta")

vRP = Proxy.getInterface("vRP")

vRPStinta = {}
Tunnel.bindInterface("vrp_permisiunetinta",vRPStinta)
Proxy.addInterface("vrp_permisiunetinta",vRPStinta)
vRPCtinta = Tunnel.getInterface("vrp_permisiunetinta","vrp_permisiunetinta")

function vRPStinta.verificapermisiunea()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    
    if vRP.hasPermission({user_id, "banuti_bitcoin"}) then
        vRPCtinta.activare(player,{})
        vRPclient.notify(vRP.getUserSource({user_id}), {"~w~[~r~TINTA~w~] ~w~Ai activat tinta cu ~g~succes ~w~!"})
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~w~[~r~TINTA~w~] ~w~Nu ai ~r~acces ~w~la '~g~Activare tinta~w~' !"})
    end

end