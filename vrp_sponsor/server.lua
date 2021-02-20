local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPsp = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_sponsor")
BMclient = Tunnel.getInterface("vRP_sponsor","vRP_sponsor")
Tunnel.bindInterface("vRP_sponsor",vRPsp)
Proxy.addInterface("vRP_sponsor",vRPsp)

spUtils = {}
spCars = {}
spTags = {}

local function refamasina(player, choice)
	local user_id = Alex.getUserId({player})
	TriggerClientEvent('murtaza:fix', player)
end

local function reviveom(player, choice)
	local user_id = Alex.getUserId({player})
	cAlex.varyHealth(player,{200})
	Alex.varyThirst({user_id, -100})
	Alex.varyHunger({user_id, -100})
	SetTimeout(500, function()
		cAlex.varyHealth(player,{200})
		Alex.varyThirst({user_id, -100})
		Alex.varyHunger({user_id, -100})
	end)
end


local function leveladmin(player,choice)
	Alex.buildMenu({"Admin level", {player = player}, function(menu)
			menu.name = "Admin level"
			menu.css={top="75px",header_color="rgba(0,200,0,0.75)"}
			menu.onclose = function(player) Alex.closeMenu({player}) end
			menu["Give XP"] = {menu_givexp, ""}
			menu["Confiscate xp"] = {menu_takexp, ""}
			menu["Set level"] = {menu_setlevel,""}
			Alex.openMenu({player,menu})
	end})
end


-- vRP.registerMenuBuilder({"main", function(add, data)
-- 	local user_id = vRP.getUserId({data.player})
-- 	if user_id ~= nil then
-- 		local choices = {}
-- 		-- if vRP.hasGroup({user_id, "vip4"}) then
-- 		-- 	choices["Vip4 Menu"] = {function(player,choice)
-- 		-- 		vRP.buildMenu({"๐’ธVip4 Menu๐’ธ", {player = player}, function(menu)
-- 		-- 			menu.name = "๐’ธVip4 Menu๐’ธ"
-- 		-- 			menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
-- 		-- 			menu.onclose = function(player) vRP.openMainMenu({player}) end -- nest menu

-- 		-- 			menu["Fix Masina"] = {sp_fixCar,"🔧 > Repara-ti vehiculul"}
-- 		-- 			menu["Refa Viata"] = {sp_revive,"🏥 > Refati viata"}
-- 		-- 			vRP.openMenu({player,menu})
-- 		-- 		end})
-- 		-- 	end, "๐’ธ Facilitati sponsor ๐’ธ"}
-- 		-- end
-- 		add(choices)
-- 	end
-- end})