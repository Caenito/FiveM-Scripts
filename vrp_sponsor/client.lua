vRPCsponsor = {}
Tunnel.bindInterface("vRP_sponsor",vRPCsponsor)
Proxy.addInterface("vRP_sponsor",vRPCsponsor)
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP_sponsor","vRP_sponsor")

local lastVehicle

function vRPCsponsor.setSponsorSkin(skinID)
	if(skinsID == 1)then
		model = "child"
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
	elseif(skinsID == 2)then
		model = "minibabygroot"
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
	elseif(skinID == 3)then
		model = "yoda"
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
	elseif(skinID == 4)then
		model = "sithyoda"
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
	end
end

function vRPCsponsor.setCustomSkin(skinID)
	if(skinID == 1)then
		model = "PinkPanther"
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
	end
end

function vRPCsponsor.teleportOutOfCar(theVehicle)
	thePed = GetPlayerPed(-1)
	local pos = GetEntityCoords(theVehicle, true)
	SetEntityCoords(thePed, pos.x, pos.y, pos.z+1.0)
end

function vRPCsponsor.spawnSponsorCar()
	model = GetHashKey("442")
	ped = GetPlayerPed(-1)
	
	if not lastVehicle and GetVehiclePedIsIn(ped, false) then
		lastVehicle = GetVehiclePedIsIn(ped, false)
	end
	
	x, y, z = table.unpack(GetEntityCoords(ped, true))
	
	local i = 0
	while not HasModelLoaded(model) and i < 1000 do
		RequestModel(model)
		Citizen.Wait(10)
		i = i+1
	end
	if HasModelLoaded(model) then
		local veh = CreateVehicle( model, x, y, z + 1, heading, true, true )
		
		SetPedIntoVehicle(ped, veh, -1)
	
		if (lastVehicle) then
			SetEntityAsMissionEntity(lastVehicle, true, true)
			DeleteVehicle(lastVehicle)
		end
		
		lastVehicle = veh
		UpdateVehicleFeatureVariables( veh )
		toggleRadio(ped)

		SetModelAsNoLongerNeeded( veh )
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and antiShuffleEnabled then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					vRPserver.denySponsorCarDriving({})
				end
			end
		end
	end
end)

function vRPCsponsor.denySponsorCarDriving()
	SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
end