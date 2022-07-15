ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('lockpick', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('tgds:lockpickle',source, false)
end)


RegisterNetEvent("tgds-lockipck:itemsilserver")
AddEventHandler("tgds-lockipck:itemsilserver", function()
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeInventoryItem('lockpick', 1)
    TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()["lockpick"],'remove',1)
end)
