ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local webhook = "https://discord.com/api/webhooks/955473323033256067/D2YSxu4FKwvCTmCs_m6K8g7PnCfFykT-syTk832MhumxKQSxiW-ARXnFlidi1sAz_8oc"
local name = "Imago Rzadowy"
local logo = "https://media.discordapp.net/attachments/853588228094427157/910804424929210378/imago.png"

RegisterCommand("wezwij", function(source, args , rawCommad)
    local xPlayer = ESX.GetPlayerFromId(source)
    local idtegocwela = tonumber(args[1])
    local steamid, license, discord = "Nie wykryto", "Nie wykryto", "Nie wykryto"
    for k,v in pairs(GetPlayerIdentifiers(idtegocwela))do
        if string.match(v, "discord:") then
            discordziomka = string.sub(v, 9)
        end
    end
    local namewgrze = GetPlayerName(source)
    if idtegocwela == "" then
        print("bbb")
    end
    if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod') then
        if idtegocwela then
            local discord = "<@"..discordziomka..">"
            local logpodwysylanie = {
                {
                    ["color"] = "00000000",
                    ["title"] = "Poczekalnia",
                    ["description"] = "Zapraszam Poczekalnie Masz 5 Minut",
                    ["footer"] = {
                        ["text"] = "Nick Administratora W Grze: "..namewgrze,
                        ["icon_url"] = logo,
                    },
                }
            }
            TriggerClientEvent("Imago_rzadowy:zapraszamcie", idtegocwela, namewgrze)
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = namewgrze, avatar_url = logo, content = discord, embeds = logpodwysylanie}), { ['Content-Type'] = 'application/json' })
        else
            xPlayer.showNotification('~r~Nie Podałes Id Gracza')
        end
    else
        xPlayer.showNotification('~r~Nie posiadasz permisji')
    end
end)