ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("distributeur")
AddEventHandler("distributeur",function(item,prix)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local getmoney = xPlayer.getMoney()
    if getmoney >= prix then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Achat',
            description = k.notification1,
            position = 'top',
            duration = 5000,
            type = 'success'
        })
    xPlayer.removeMoney(prix)
    xPlayer.addInventoryItem(item, 1)
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Achat',
            description = k.notification2,
            position = 'top',
            duration = 5000,
            type = 'error'
        })
    end
end)