--[[BASE]]--
MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_dmvschool")

--[[LANG]]--
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp", "cfg/base")
local lang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})

--[[SQL]]--
MySQL.createCommand("vRP/dmv_column", "ALTER TABLE vrp_users ADD IF NOT EXISTS DmvTest varchar(50) NOT NULL default 'Required'")
MySQL.createCommand("vRP/dmv_success", "UPDATE vrp_users SET DmvTest='Passed' WHERE id = @id")
MySQL.createCommand("vRP/dmv_search", "SELECT * FROM vrp_users WHERE id = @id AND DmvTest = 'Passed'")
MySQL.createCommand("vRP/dmv_confiscate", "UPDATE vrp_users SET DmvTest='Required' WHERE id = @id")

RegisterServerEvent("dmv:success")
AddEventHandler("dmv:success", function()
	local user_id = vRP.getUserId({source})
	MySQL.query("vRP/dmv_success", {id = user_id})
end)

RegisterServerEvent("dmv:ttcharge")
AddEventHandler("dmv:ttcharge", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.tryPayment({user_id,200}) then
        TriggerClientEvent('dmv:startttest',player)
	else
		vRPclient.notify(player,{"~r~Nu ai destui bani."})
	end
end)

RegisterServerEvent("dmv:ptcharge")
AddEventHandler("dmv:ptcharge", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.tryPayment({user_id,500}) then
        TriggerClientEvent('dmv:startptest',player)
	else
		vRPclient.notify(player,{"~r~Nu ai destui bani."})
	end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	if user_id then
		MySQL.query("vRP/dmv_search", {id = user_id}, function(rows, affected)
			if #rows > 0 then
				TriggerClientEvent('dmv:CheckLicStatus',source)
			end
		end)
	end
end)

--[[POLICE MENU]]--
local choice_asklc = {function(player,choice)
	vRPclient.getNearestPlayer(player,{10},function(nplayer)
		local nuser_id = vRP.getUserId({nplayer})
		if nuser_id ~= nil then
			vRPclient.notify(player,{"Asking license..."})
			vRP.request({nplayer,"Do you want to show your license ?",15,function(nplayer,ok)
				if ok then
					MySQL.query("vRP/dmv_search", {id = nuser_id}, function(rows, affected)
						if #rows > 0 then
							vRPclient.notify(player,{"User license: ~g~OK"})
						else
							vRPclient.notify(player,{"User license: ~r~REQUIRED"})
						end
					end)
				else
					vRPclient.notify(player,{lang.common.request_refused()})
				end
			end})
		else
			vRPclient.notify(player,{lang.common.no_player_near()})
		end
	end)
end, "Check license from the nearest player."}

local choice_confiscateLicense = {function(player, choice)
	vRPclient.getNearestPlayers(player,{15},function(nplayers)
		usrList = ""
		for k,v in pairs(nplayers) do
			usrList = usrList .. "[" .. vRP.getUserId({k}) .. "]" .. GetPlayerName(k) .. " | "
		end
		if usrList ~= "" then
			vRP.prompt({player,"Jucatori Apropiati: " .. usrList .. "","",function(player,user_id) 
				user_id = parseInt(user_id)
				if user_id ~= nil and user_id ~= "" then 
					local target = vRP.getUserSource({user_id})
					if target ~= nil then
						MySQL.query("vRP/dmv_search", {id = user_id}, function(rows, affected)
							if #rows > 0 then
								vRPclient.notify(player, {"~g~I-ai confiscat lui ~y~"..GetPlayerName(target).." ~b~Licenta de Condus"})
								vRPclient.notify(target, {"~b~Ofiter "..GetPlayerName(player).." ~r~ti-a confiscat ~y~Licenta de Condus"})
								MySQL.query("vRP/dmv_confiscate", {id = user_id})
							else
								vRPclient.notify(player, {"~r~Acest jucator nu are Licenta de Condus!"})
							end
						end)
					else
						vRPclient.notify(player, {"~r~Nu a fost gasit nici un jucator cu acest ID!"})
					end
				end
			end})
		end
	end)
end, "Confisca permisul de conducere unui jucator"}

vRP.registerMenuBuilder({"police", function(add, data)
	local player = data.player

	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		local choices = {}

		-- build police menu
		if vRP.hasPermission({user_id,"police.askid"}) then
			choices["Check license"] = choice_asklc
		end
	
		if vRP.hasPermission({user_id, "police.confiscateLicense"}) then
			choices["Confisca Licenta"] = choice_confiscateLicense
		end
	
		add(choices)
	end
end})