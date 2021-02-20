AddEventHandler("playerSpawned",function()
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1000)
      TriggerServerEvent("vRP_GUI:getHunger&Thirst")
      TriggerServerEvent("vRP_GUI:coins")
      TriggerServerEvent("vRP_GUI:giftbox")
    end
end)

end)
RegisterNetEvent("vRP_GUI:getHunger&Thirst")
AddEventHandler("vRP_GUI:getHunger&Thirst",function(hunger,thirst)
  SendNUIMessage({thirst = 100-thirst,hunger = 100-hunger,survival = true})
end)

RegisterNetEvent("vRP_GUI:SetPMoney")
AddEventHandler("vRP_GUI:SetPMoney",function(value)
  value = format(value)
  SendNUIMessage({pmoney = value})
end)

RegisterNetEvent("vRP_GUI:SetBMoney")
AddEventHandler("vRP_GUI:SetBMoney",function(value)
  value = format(value)
  SendNUIMessage({bmoney = value})
end)

RegisterNetEvent("vRP_GUI:coins")
AddEventHandler("vRP_GUI:coins",function(value)
  value = format(value)
  SendNUIMessage({aur = value})
end)

RegisterNetEvent("vRP_GUI:giftbox")
AddEventHandler("vRP_GUI:giftbox",function(value)
  value = format(value)
  SendNUIMessage({gifts = value})
end)

function format(value)
  if value >= 1000000000 then
    return tostring(math.floor(round(value%1000000000000)/1000000000*100)/100).." B"

  elseif value >= 1000000 then
    return tostring(math.floor(round(value%1000000000)/1000000*100)/100).." M"

  elseif value >= 1000 then
    return tostring(math.floor(round(value%1000000)/1000*100)/100).." K"
  elseif value == 0 or value == nil then
    return "0"
  else
    return value
  end
end

function round(n)
  return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end
