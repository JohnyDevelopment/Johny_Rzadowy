ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)
RegisterNetEvent("Imago_rzadowy:zapraszamcie")
AddEventHandler("Imago_rzadowy:zapraszamcie", function(name)
    ESX.Scaleform.ShowFreemodeMessage('~r~Zapraszam na poczekalnie', 'Zostałeś/aś zawołany/a przez: ~y~'..name, 10)
end)