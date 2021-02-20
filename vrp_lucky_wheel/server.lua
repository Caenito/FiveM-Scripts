local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("casino","casino")
vRPct = Tunnel.getInterface("vRP","casino")


isRoll = false
amount = 1


RegisterServerEvent('casino:getLucky')
AddEventHandler('casino:getLucky', function()
    local _source = source
    local user_id = vRP.getUserId({_source})
    local vehHash = foxmvk
    local player = vRP.getUserSource({user_id})
  local nickname = GetPlayerName(_source)
  if vRP.getMoney({user_id}) > 25000 then
    vRP.tryPayment({user_id, 25000})
    TriggerClientEvent("invarte", player)
      if not isRoll then
          if user_id ~= nil then
                  isRoll = true
                  local _priceIndex = math.random(1,50)
                  print("Price " .. _priceIndex)
                  SetTimeout(12000, function()
                      isRoll = false
                      -- Give Price
                      if _priceIndex == 32 or _priceIndex == 9 or _priceIndex == 20 or _priceIndex == 43 then --2500
                        vRP.giveMoney({user_id, 2500})
                      elseif _priceIndex == 34 then
                        vRP.giveMoney({user_id, 5000})
                      elseif _priceIndex == 48 or _priceIndex == 25 or _priceIndex == 2 then
                        vRP.giveMoney({user_id, 7500})
                      elseif _priceIndex == 27 or _priceIndex == 10 or _priceIndex == 33 or _priceIndex == 50 or _priceIndex == 4 or _priceIndex == 44 then
                        vRP.giveMoney({user_id, 10000})
                    elseif _priceIndex == 35 or _priceIndex == 1 or _priceIndex == 18 or _priceIndex == 15 or _priceIndex == 41 or _priceIndex == 16 then
                      vRP.giveMoney({user_id, 15000})
                    elseif _priceIndex == 21 or _priceIndex == 37 or _priceIndex == 14 then
                      vRP.giveMoney({user_id, 20000})
                    elseif _priceIndex == 17 or _priceIndex == 40 then
                      vRP.giveMoney({user_id, 25000})
                    elseif _priceIndex == 23 or _priceIndex == 46 or _priceIndex == 12 then
                      vRP.giveMoney({user_id, 30000})
                      local stuff = "^0[ ^9XENON CASINO ^0] ID ".. user_id.. " A CASTIGAT 30.000$!^0 !"
                      TriggerClientEvent('chat:addMessage', -1, {template = '<div style="float:left;text-align:left;width: 88.7%;height:auto;word-wrap: break-word;background-image:"><i class="fas fa-globe"><img style="width: 40px" src="https://media4.giphy.com/media/bh5UZVQjB9ouQ/200.gif"></i>{0}</div>',args = { stuff}})

                    elseif _priceIndex == 5 or _priceIndex == 28 or _priceIndex == 39 then
                      vRP.giveMoney({user_id, 40000})
                      local stuff = "^0[ ^9XENON CASINO ^0] ID".. user_id.. " A CASTIGAT 40.000$!^0 !"
                      TriggerClientEvent('chat:addMessage', -1, {template = '<div style="float:left;text-align:left;width: 88.7%;height:auto;word-wrap: break-word;background-image:"><i class="fas fa-globe"><img style="width: 40px" src="https://media4.giphy.com/media/bh5UZVQjB9ouQ/200.gif"></i>{0}</div>',args = { stuff}})

                    elseif _priceIndex == 42 or _priceIndex == 19 then
                      vRP.giveMoney({user_id, 50000})
                      local stuff = "^0[ ^9XENON CASINO ^0] ID".. user_id.. " A CASTIGAT 50.000$!^0 !"
                          TriggerClientEvent('chat:addMessage', -1, {template = '<div style="float:left;text-align:left;width: 88.7%;word-wrap: break-word;background-image:"><i class="fas fa-globe"><img style="width: 40px" src="https://media4.giphy.com/media/bh5UZVQjB9ouQ/200.gif"></i>{0}</div>',args = { stuff}})
                    elseif _priceIndex == 29 or _priceIndex == 47 or _priceIndex == 6 or _priceIndex == 13 or _priceIndex == 31 or _priceIndex == 38 or _priceIndex == 8 or _priceIndex == 24 or _priceIndex == 36 then
                      --skin pe arma
                      vRP.giveInventoryItem({user_id,"water", 1,true})
                    elseif _priceIndex == 45 or _priceIndex == 22 or _priceIndex == 11 then
                      -- discount
                      vRP.giveMoney({user_id, 50})
                      -- ai primit un discount la orice gogoasa
                    elseif _priceIndex == 49 or _priceIndex == 3 or _priceIndex == 26 then
                      -- 1310s mystery
                      if  _priceIndex == 26 then
                      vRP.getUserIdentity({user_id, function(identity)
                        exports.ghmattimysql:execute("INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,'car')", {
                                ['@user_id'] = user_id,
                                ['@vehicle'] = "18performante",
                                ['@vehicle_plate'] = "CASINO "..identity.registration
                              })
                          end})
                          local stuff = "^0[ ^9XENON CASINO ^0] ID".. user_id.. " A CASTIGAT UN OBIECT MISTERIOS!^0 !"
                          TriggerClientEvent('chat:addMessage', -1, {template = '<div style="float:left;text-align:left;width: 88.7%;height:auto;word-wrap: break-word;background-image:"><i class="fas fa-globe"><img style="width: 40px" src="https://media4.giphy.com/media/bh5UZVQjB9ouQ/200.gif"></i>{0}</div>',args = { stuff}})
                        else
                          vRP.giveMoney({user_id, 7500})
                          priceIndex = 25
                        end

                    elseif _priceIndex == 30 or _priceIndex == 7 then
                      --vehicle
                      if _priceIndex == 30 then
                        vRP.getUserIdentity({user_id, function(identity)
                          exports.ghmattimysql:execute("INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,'car')", {
                                  ['@user_id'] = user_id,
                                  ['@vehicle'] = "foxmvk",
                                  ['@vehicle_plate'] = "CASINO "..identity.registration
                                })
                            end})
                            local stuff = "^0[ ^9XENON CASINO ^0] ID-UL".. user_id.. " A CASTIGAT MASINA SPECIALA!^0 !"
                            TriggerClientEvent('chat:addMessage', -1, {template = '<div style="float:left;text-align:left;width: 88.7%;height:-4px;word-wrap: break-word;background-image:"><i class="fas fa-globe"><img style="width: 40px" src="https://media4.giphy.com/media/bh5UZVQjB9ouQ/200.gif"></i>{0}</div>',args = { stuff}})
                          else
                            vRP.giveMoney({user_id, 7500})
                            priceIndex = 25
                          end
                    elseif _priceIndex == 19 then
                      vRP.giveInventoryItem({user_id, "water", 1, true})                    
                    end
                      TriggerClientEvent("casino:rollFinished", player)
                  end)
                  TriggerClientEvent("casino:doRoll", player, _priceIndex)

          end
      end
    end
end)

