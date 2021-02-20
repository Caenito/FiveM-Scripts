local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_rainbowMenu")
vRPrainbowMenuClient = Tunnel.getInterface("vRP_rainbowMenu", "vRP_rainbowMenu")

local thePermission = "rgb.menu"

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		if vRP.hasPermission({user_id, thePermission}) then
			choices["Rainbow Menu"] = {function(player,choice)
				local menu = {}
				menu.name = "Rainbow Menu"
				menu.css = {top = "75px", header_color = "rgba(0,0,255,0.75)"}
				menu.onclose = function(player) vRP.openMainMenu({player}) end
				
				menu["Rainbow Vehicle"] = {function(player, choice)
					vRPrainbowMenuClient.rainbowVehicleEffect(player, {})
				end, "Toggle the rainbow effect on your vehicle"}
				
				menu["Rainbow Neons"] = {function(player, choice)
					vRPrainbowMenuClient.rainbowNeonsEffect(player, {})
				end, "Toggle the rainbow effect on the neons of your vehicles"}
			
				vRP.openMenu({player, menu})
			end, "Rainbow Menu (RGB)"}
		end
		add(choices)
	end
end})