local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")
vRPsp = Proxy.getInterface("vRP_sponsor")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:muitzaqmessageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

RegisterServerEvent('chat:kickSpammer')
AddEventHandler('chat:kickSpammer', function()
	TriggerClientEvent('chatMessage', -1, "^1[SPAM] ^2"..GetPlayerName(source).."^8 a primit kick pentru spam!")
	DropPlayer(source, 'Ai luat kick pentru spam!')
end)

AddEventHandler('_chat:muitzaqmessageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
		local user_id = vRP.getUserId({source})
		local player = vRP.getUserSource({user_id})
		local pName = GetPlayerName(player)
		local author = "["..user_id.."] "..author
		
		if vRP.hasGroup({user_id,"Fondator"}) then
			tag = "👑Fondator👑"
			rgb = {0,255,255}
		elseif vRP.hasGroup({user_id,"cofondator"}) then	
			tag = "[💣]Co-Fondator"
			rgb = {139,0,0}
		elseif vRP.hasGroup({user_id,"trusted"}) then
			tag = "[✔️]Xenon Trusted"
			rgb = {0,255,0}
		elseif vRP.hasGroup({user_id,"superadmin"}) then
			tag = "[⚙️]Super Administrator"
			rgb = {245, 0, 0}
		elseif vRP.hasGroup({user_id,"admin"}) then
			tag = "[🧨]Administrator"
			rgb = {209, 11, 16}
		elseif vRP.hasGroup({user_id,"supermod"}) then
			tag = "[⚡]Super Moderator"
			rgb = {255, 102, 15}
		elseif vRP.hasGroup({user_id,"moderator"}) then
			tag = "[🛠️]Moderator"
			rgb = {0, 51, 160}
		elseif vRP.hasGroup({user_id,"helper"}) then
			tag = "[🔨]Helper"
			rgb = {206, 92, 23}
		elseif vRP.hasGroup({user_id,"helperinteste"}) then
			tag = "[🔧]Helper In Teste"
			rgb = {254, 215, 0}
                elseif vRP.hasGroup({user_id,"youtuber"}) then
			tag = "[🎄]Youtuber"
			rgb = {7, 106, 33}
		elseif vRP.hasGroup({user_id,"vip4"}) then
			tag = "[💎]V.I.P Diamond"
			rgb = {51, 204, 255}
		elseif vRP.hasGroup({user_id,"vip3"}) then
			tag = "[💸]V.I.P Gold"
			rgb = {255, 166, 77}
		elseif vRP.hasGroup({user_id,"vip2"}) then
			tag = "[💳]V.I.P Silver"
			rgb = {177, 205, 205}
		elseif vRP.hasGroup({user_id,"vip1"}) then
			tag = "[💴]V.I.P Bronze"
			rgb = {153, 102, 51}

		elseif vRP.hasGroup({user_id,"sponsors"}) then
			local theTag = vRPsp.getSponsorTag({user_id})
			if(theTag ~= false)then
				tag = theTag
			else
				tag = "[🔥]Sponsor"
			end
			rgb = {255, 102, 15}
		elseif vRP.hasGroup({user_id,"Chestor General"}) then
			tag = "[👮]Chestor General"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Chestor Secundar"}) then
			tag = "[👮]Chestor Secundar"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Inspector"}) then
			tag = "[👮]Inspector Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Detectiv"}) then
			tag = "[👮]Detectiv Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Comisar"}) then
			tag = "[👮]Comisar Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Cadet"}) then
			tag = "[👮]Cadet Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Agent Principal"}) then
			tag = "[👮]Agent Principal Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Agent Sef"}) then
			tag = "[👮]Agent Sef Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Agent"}) then
			tag = "[👮]Agent Politia Romana"
			rgb = {0, 97, 255}
		elseif vRP.hasGroup({user_id,"Lider Smurd"}) then
			tag = "[🚑]Director Smurd"
			rgb = {171, 6, 53}
		elseif vRP.hasGroup({user_id,"Co-Lider Smurd"}) then
			tag = "[🚑]Sub-Director Smurd"
			rgb = {171, 6, 53}
		elseif vRP.hasGroup({user_id,"Tester Smurd"}) then
			tag = "[🚑]Tester Smurd"
			rgb = {171, 6, 53}
		elseif vRP.hasGroup({user_id,"Medic"}) then
			tag = "[🚑]Medic Smurd"
			rgb = {171, 6, 53}
		elseif vRP.hasGroup({user_id,"Lider Hitman"}) then
			tag = "[🎯]Director Hitman"
			rgb = {102, 54, 6}
		elseif vRP.hasGroup({user_id,"Co-Lider Hitman"}) then
			tag = "[🎯]Sub-Director Hitman"
			rgb = {102, 54, 6}
		elseif vRP.hasGroup({user_id,"Tester Hitman"}) then
			tag = "[🎯]Hitman Experimentat"
			rgb = {102, 54, 6}
		elseif vRP.hasGroup({user_id,"Agent Hitman"}) then
			tag = "[🎯]Agent Hitman"
			rgb = {102, 54, 6}
		elseif vRP.hasGroup({user_id,"Recrut Hitman"}) then
			tag = "[🎯]Recrut Hitman"
			rgb = {102, 54, 6}
		elseif vRP.hasGroup({user_id,"guvern"}) then
			tag = "[🕵️Guvernul Romaniei🕵️]"
			rgb = {29, 239, 29}
		elseif vRP.hasGroup({user_id,"Director SRI"}) then
			tag = "[‍🕴🏼]Director S.R.I."
			rgb = {50, 45, 192}
		elseif vRP.hasGroup({user_id,"Sub-Director SRI"}) then
			tag = "[‍🕴🏼]Sub-Director S.R.I."
			rgb = {50, 45, 192}
		elseif vRP.hasGroup({user_id,"Detectiv SRI"}) then
			tag = "[‍🕴🏼]Detectiv S.R.I."
			rgb = {50, 45, 192}
		elseif vRP.hasGroup({user_id,"Colonel"}) then
			tag = "[‍🕴🏼]Colonel S.R.I."
			rgb = {50, 45, 192}
		elseif vRP.hasGroup({user_id,"Maior"}) then
			tag = "[‍🕴🏼]Maior S.R.I."
			rgb = {50, 45, 192}
		elseif vRP.hasGroup({user_id,"Plutonier"}) then
			tag = "[‍🕴🏼]Plutonier S.R.I."
			rgb = {50, 45, 192}
		elseif vRP.hasGroup({user_id,"Sergent"}) then
			tag = "[‍🕴🏼]Sergent S.R.I."
			rgb = {50, 45, 192}
        elseif vRP.hasGroup({user_id,"Director Smurd"}) then
			tag = "[💉Director Smurd💉]"
			rgb = {142, 3, 255}
		elseif vRP.hasGroup({user_id,"Medic"}) then
			tag = "[💉Medic💉]"
			rgb = {204, 102, 0}
		elseif vRP.hasGroup({user_id,"Co-Lider Smurd"}) then
			tag = "[💉Co-Lider Smurd💉]"
			rgb = {204, 102, 0}
		elseif vRP.hasGroup({user_id,"Tester Smurd"}) then
			tag = "[💉Tester Smurd💉]"
			rgb = {204, 102, 0}
		elseif vRP.hasGroup({user_id,"Lider LaFamilia"}) then
			tag = "[🃏]Lider La Familia"
			rgb = {128, 56, 179}
		elseif vRP.hasGroup({user_id,"Co-Lider LaFamilia"}) then
			tag = "[🃏]Co-Lider La Familia"
			rgb = {128, 56, 179}
		elseif vRP.hasGroup({user_id,"Tester LaFamilia"}) then
			tag = "[🃏]Tester La Familia"
			rgb = {128, 56, 179}
		elseif vRP.hasGroup({user_id,"Membru LaFamilia"}) then
			tag = "[🃏]Membru La Familia"
			rgb = {128, 56, 179}
		elseif vRP.hasGroup({user_id,"Lider AlQaida"}) then
			tag = "[🩸]Mafia AlQaida"
			rgb = {190, 10, 47}
		elseif vRP.hasGroup({user_id,"Co-Lider AlQaida"}) then
			tag = "[🩸]Mafia AlQaida"
			rgb = {190, 10, 47}
		elseif vRP.hasGroup({user_id,"Tester AlQaida"}) then
			tag = "[🩸]Mafia AlQaida"
			rgb = {190, 10, 47}
		elseif vRP.hasGroup({user_id,"Membru AlQaida"}) then
			tag = "[🩸]Mafia AlQaida"
			rgb = {190, 10, 47}
		elseif vRP.hasGroup({user_id,"Lider CosaNostra"}) then
			tag = "[🔪]Mafia Cosa Nostra"
			rgb = {0, 133, 66}
		elseif vRP.hasGroup({user_id,"Co-Lider CosaNostra"}) then
			tag = "[🔪]Mafia Cosa Nostra"
			rgb = {0, 133, 66}
		elseif vRP.hasGroup({user_id,"Tester CosaNostra"}) then
			tag = "[🔪]Mafia Cosa Nostra"
			rgb = {0, 133, 66}
		elseif vRP.hasGroup({user_id,"Membru CosaNostra"}) then
			tag = "[🔪]Mafia Cosa Nostra"
			rgb = {0, 133, 66}
		elseif vRP.hasGroup({user_id,"Casa Blanka"}) then  
			tag = "[🚬Casa Blanka🚬]"
			rgb = {140, 100, 0}
		elseif vRP.hasGroup({user_id,"Mafia Curcubeu"}) then  
			tag = "[🌈Mafia Curcubeu🌈]"
			rgb = {120, 130, 140}
		elseif vRP.hasGroup({user_id,"user"}) then
			tag = "[👦]Civil"
			rgb = {255, 204, 0}
		else
			tag = "[👦]Civil"
			rgb = {255, 204, 0}
		end
		
		TriggerClientEvent('chatMessage', -1, tag..""..author, rgb, " " ..  message)
		
		print(author .. ': ' .. message)
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
		local user_id = vRP.getUserId({source})
		local player = vRP.getUserSource({user_id})
		local pName = GetPlayerName(player)
		local author = "["..user_id.."] "..name
		local theTag = vRPsp.getSponsorTag({user_id})
		message = "/"..command
    end

    CancelEvent()
end)

RegisterCommand('a', function(source, args, rawCommand)
    local name = GetPlayerName(source)
    local message = table.concat(args, ' ')
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasPermission({user_id,"admin.tickets"}) then
        TriggerClientEvent('chatMessage', -1, "[Staff Chat] "..GetPlayerName(source).." ["..vRP.getUserId({source}).."]", {213,255,0}, message)
        if not message or not author then
        return
    end
    end
        TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "Insufficient Permissions !")
end)

RegisterCommand("noclip", function(player)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.spawnveh"}) then
    vRPclient.toggleNoclip(player, {})
end
end)

RegisterCommand('say', function(source, args, rawCommand)
	if(source == 0)then
		TriggerClientEvent('chatMessage', -1, "[Caen]", { 255, 0, 0 }, rawCommand:sub(5))
	end
end)

RegisterCommand('clear', function(source)
    local user_id = vRP.getUserId({source});
    if user_id ~= nil then
        if vRP.hasPermission({user_id, "player.spectate"}) then
            TriggerClientEvent("chat:clear", -1);
            TriggerClientEvent("sonydamuielasclavi", -1, "^1XENON^0: Adminul ^1".. GetPlayerName(source) .."^0 a sters chat-ul.");
        else
            TriggerClientEvent("sonydamuielasclavi", source, "^1Eroare^0: Nu ai acces la aceasta comanda.");
        end
    end
end)
RegisterServerEvent('chat:clear')

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/me" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "me | " .. name, { 255, 0, 0 }, string.sub(msg,5))
	end
end)
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

Citizen.CreateThread(function()
	local muie = true
	local pa = 1
	while true do
        Wait(300000)
		if pa == 1 then
			TriggerClientEvent('chatMessage', -1, "^1[Xenon] ^2Pentru a fii la curent cu tot ce se intampla pe server, v-as ruga sa intrati si pe discord-ul nostru : discord.io/xenonro")
			pa = 2
		end
		Wait(300000)
		if pa == 2 then 
			TriggerClientEvent('chatMessage', -1, "^1[Xenon] ^2Donatiile se fac DOAR la Maen.NU RASPUNDEM pentru bani pierduti!")
			pa = 3
		end
		Wait(300000)
		if pa == 3 then 
			TriggerClientEvent('chatMessage', -1, "^1[Xenon] ^2Pentru un roleplay cat mai decent ar trebui sa CITITI SI RESPECTATI regulament-ul!")
			pa = 4
		end
		Wait(300000)
		if pa == 4 then 
			TriggerClientEvent('chatMessage', -1, "^1[Xenon] ^2Vreau ca pe server sa se PASTREZE un limbaj decent atat RP cat si OOC!")
			pa = 1
		end
	end
	--while muie == true do 
		--SetTimeout(30000,function()
			--if pa == 1 then
				--pa = 2
			--end
			--SetTimeout(30000,function()
				--if pa == 2 then
					--pa = 3
				--end
				--SetTimeout(30000,function()
					--if pa == 3 then
						--pa = 4
					--end
					--SetTimeout(30000,function()
						--if pa == 4 then
		--					pa = 1
		--				end
		--			end)
		--		end)
		--	end)
		--end)
	--end

end)


local function giveAllBankMoney(amount)
	local users = vRP.getUsers({})
	for user_id, source in pairs(users) do
		vRP.giveBankMoney({user_id, tonumber(amount)})
	end
end

RegisterCommand("giveallmoney", function(player, args)
	if player == 0 then
		local theMoney = parseInt(args[1]) or 0
		if theMoney >= 1 then
			giveAllBankMoney(theMoney)
			TriggerClientEvent("chatMessage", -1, "^1Xenon^7: Server-ul a oferit tuturor jucatorilor ^2$"..theMoney.."^7 !")
		else
			print("/giveallmoney <amount>")
		end
	else
		local user_id = vRP.getUserId({player})
		  if vRP.hasPermission({user_id, "bonus"}) then
			local theMoney = parseInt(args[1]) or 0
			if theMoney then
				giveAllBankMoney(theMoney)
				TriggerClientEvent("chatMessage", -1, "^1Xenon^7: Fondatorul ^2"..vRP.getPlayerName({player}).."^7 a oferit tuturor jucatorilor ^2$"..theMoney.."^7 !")
			else
				TriggerClientEvent("chatMessage", player, "^1Xenon^7: /giveallmoney <amount>")
			end
		else
			TriggerClientEvent("chatMessage", player, "^1Eroare^7: Nu ai acces la aceasta comanda")
		end
	end
end, false)
RegisterCommand('clear', function(source)
    local user_id = vRP.getUserId({source});
    if user_id ~= nil then
         if vRP.hasPermission({user_id, "player.spectate"}) then
            TriggerClientEvent("chat:clear", -1);
            TriggerClientEvent("chatMessage", -1, "^1Xenon^7: Adminul ^1".. GetPlayerName(source) .."^7 a sters chat-ul.");
        else
            TriggerClientEvent("chatMessage", source, "^1Eroare^7: nu ai acces la aceasta comanda.");
        end
    end
end)

RegisterCommand("noid", function(player)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.spawnveh"})  then
        vRPclient.disableID(player, {})
    else
        TriggerClientEvent("chatMessage", source, "^1Eroare^0: Nu ai acces la aceasta comanda")
    end
end)

RegisterCommand("respawn", function(player, args)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "player.spectate"}) then
        local target_id = parseInt(args[1])
        local target_src = vRP.getUserSource({target_id})
        if target_src then
            vRPclient.varyHealth(target_src,{100})
            vRP.varyHunger({target_src,-100})
            vRP.varyThirst({target_src,-100})
            vRPclient.teleport(target_src, {-541.23718261718,-210.66639709472,37.649810791016})
            local stuff = "[^4Xenon^0] ^8Un admin ti-a dat respawn!^0"
            TriggerClientEvent('chat:addMessage', target_src,stuff )
        end
    end
end)


RegisterCommand("tpto", function(player, args)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        if args[1] and args[1] ~= "" then
            local target_id = parseInt(args[1])
            local target_src = vRP.getUserSource({target_id})
            if target_src then
                vRPclient.getPosition(target_src, {}, function(x, y, z)
                    vRPclient.teleport(player, {x, y, z})
                    vRPclient.notify(player, {"Te-ai teleportat la "..vRP.getPlayerName({target_src}).." ["..target_id.."]"})
                    vRPclient.notify(target_src, {"Adminul "..vRP.getPlayerName({player}).." ["..user_id.."] s-a teleportat la tine"})
                end)
            else
                TriggerClientEvent("chatMessage", player, "^1Eroare^7: Jucatorul nu este conectat !")
            end
        else
            TriggerClientEvent("chatMessage", player, "^1Server^7: /tpto <user_id>")
        end
    else
        TriggerClientEvent("chatMessage", player, "^1Eroare^7: Nu ai acces la aceasta comanda !")
    end
end, false)

RegisterCommand('arevive', function(source, args, msg)
  local user_id = vRP.getUserId({source})
  msg = msg:sub(9)
  if msg:len() >= 1 then
    msg = tonumber(msg)
    local target = vRP.getUserSource({msg})
    if target ~= nil then
      if vRP.hasPermission({user_id, "admin.tickets"}) then -- moderator sau mai mare.
        vRPclient.varyHealth(target,{100})

        TriggerClientEvent('chatMessage', source, "^1ARevive^7: I-ai dat revive lui "..GetPlayerName(target)..".")
        TriggerClientEvent('chatMessage', target, "^1ARevive^7: Adminul "..GetPlayerName(source).." ti-a dat revive.")
      else
        TriggerClientEvent('chatMessage', source, "^1Eroare^7: Nu ai acces la aceasta comanda.")
      end
    else
      TriggerClientEvent('chatMessage', source, "^1Eroare^7: Player-ul nu este conectat.")
    end
  else
    TriggerClientEvent('chatMessage', source, "^1Xenon^7: /arevive <user-id>")
  end
end)

RegisterCommand("tptome", function(player, args)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        if args[1] and args[1] ~= "" then
            local target_id = parseInt(args[1])
            local target_src = vRP.getUserSource({target_id})
            if target_src then
                vRPclient.getPosition(player, {}, function(x, y, z)
                    vRPclient.teleport(target_src, {x, y, z})
                    vRPclient.notify(player, {"L-ai teleportat la tine pe "..vRP.getPlayerName({target_src}).." ["..target_id.."]"})
                    vRPclient.notify(target_src, {"Adminul "..vRP.getPlayerName({player}).." ["..user_id.."] te-a teleportat la el"})
                end)
            else
                TriggerClientEvent("chatMessage", player, "^1Eroare^7: Jucatorul nu este conectat !")
            end
        else
            TriggerClientEvent("chatMessage", player, "^1Xenon^7: /tptome <user_id>")
        end
    else
        TriggerClientEvent("chatMessage", player, "^1Eroare^7: Nu ai acces la aceasta comanda !")
    end
end, false)


RegisterCommand("tptow", function(player)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        TriggerClientEvent("TpToWaypoint", player)
    else
        TriggerClientEvent("chatMessage", player, "^1Eroare^0: Nu ai acces la aceasta comanda !")
    end
end, false)



RegisterCommand("restartsv", function(player, args)
    if player == 0 then
        local users = vRP.getUsers({})
        for user_id,player in pairs(users) do
            DropPlayer(player,"Server-ul se restarteaza , reveniti intr-un minut.Pentru lista cu update , puteti vizita discord-ul")
        end
    end
end, false)

RegisterCommand("q", function(source, args, rawCommand)
  DropPlayer(source , "Ti-ai dat /q de la viata") 
end)



