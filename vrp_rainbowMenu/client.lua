vRPrainbowMenuClient = {}
Tunnel.bindInterface("vRP_rainbowMenu",vRPrainbowMenuClient)
Proxy.addInterface("vRP_rainbowMenu",vRPrainbowMenuClient)
vRPrainbowMenuServer = Tunnel.getInterface("vRP_rainbowMenu","vRP_rainbowMenu")
vRP = Proxy.getInterface("vRP")

config = {
	["vehicleColor"] = {
		vRainbowStats = false,
		vRainbowSpeed = 5.00
	},
	["neonsColor"] = {
		nRainbowStats = false,
		nRainbowSpeed = 2.00
	}
}

function vRPrainbowMenuClient.rainbowVehicleEffect()
	config["vehicleColor"].vRainbowStats = not config["vehicleColor"].vRainbowStats
	if(config["vehicleColor"].vRainbowStats)then
		TriggerEvent("chatMessage", "", {255,255,255}, "Vehicle Rainbow: ^8^*Disabled")
	else
		TriggerEvent("chatMessage", "", {255,255,255}, "Vehicle Rainbow: ^2^*Enabled")
	end
end

function vRPrainbowMenuClient.rainbowNeonsEffect()
	config["neonsColor"].nRainbowStats = not config["neonsColor"].nRainbowStats
	if(config["neonsColor"].nRainbowStats)then
		TriggerEvent("chatMessage", "", {255,255,255}, "Neons Rainbow: ^8^*Disabled")
	else
		TriggerEvent("chatMessage", "", {255,255,255}, "Neons Rainbow: ^2^*Enabled")
	end
end

Citizen.CreateThread(function()
	local function RGBRainbow( frequency )
		local result = {}
		local curtime = GetGameTimer() / 1000

		result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
		result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
		result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )

		return result
	end
    while true do
    	Citizen.Wait(0)
    	if(config["vehicleColor"].vRainbowStats)then
    		if IsPedInAnyVehicle(PlayerPedId(), true) then
				local vRainbow = RGBRainbow(config["vehicleColor"].vRainbowSpeed)
    			local theVehicle = GetVehiclePedIsUsing(PlayerPedId())
    			SetVehicleCustomPrimaryColour(theVehicle, vRainbow.r, vRainbow.g, vRainbow.b)
    			SetVehicleCustomSecondaryColour(theVehicle, vRainbow.r, vRainbow.g, vRainbow.b)
    		else
    			config["vehicleColor"].vRainbowStats = false
    		end
    	end
		if(config["neonsColor"].nRainbowStats)then
    		if IsPedInAnyVehicle(PlayerPedId(), true) then
				local nRainbow = RGBRainbow(config["neonsColor"].nRainbowSpeed)
    			local theVehicle = GetVehiclePedIsUsing(PlayerPedId())
    			SetVehicleNeonLightsColour(theVehicle, nRainbow.r, nRainbow.g, nRainbow.b)
    		else
    			config["neonsColor"].nRainbowStats = false
    		end
    	end
    end
end)