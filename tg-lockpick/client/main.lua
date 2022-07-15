ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end
end)

RegisterNetEvent('tgds:lockpickle', function(gelismiskardes)
    arackapisi(gelismiskardes)
end)


function arackapisi(gelismiskardes)
    local oyuncu = PlayerPedId()
    local pos = GetEntityCoords(oyuncu)
    local arac = ESX.Game.GetClosestVehicle(pos)
    if arac ~= nil and arac ~= 0 then
        local aracpos = GetEntityCoords(arac)
        if #(pos - aracpos) < 2.5 then
            local aracdurum = GetVehicleDoorLockStatus(arac)
            if (aracdurum > 0) then
                kullanbakalim = gelismiskardes
                TriggerEvent('tg-lockpick:client:openLockpick', lockpickbitir)
                ExecuteCommand("e mekanik4")
            end
        end
    end
end


function lockpickbitir(success)
    local oyuncu = PlayerPedId()
    local pos = GetEntityCoords(oyuncu)
    local arac = ESX.Game.GetClosestVehicle(pos)
    if success then
        exports['mythic_notify']:SendAlert('success', 'Kapı Açıldı')
        ExecuteCommand("e c")
        SetVehicleDoorsLocked(arac, 1)
        lockpick = true
    else
        IsVehicleAlarmActivated(arac ,false)
        exports['mythic_notify']:SendAlert('error', 'Başarısız Oldun Aracın Alarımı Devreye Girdi Polise Haber Vericekler Kaç!')
        TriggerServerEvent("tgds-lockipck:itemsilserver")
        ExecuteCommand("e c")
        SetVehicleAlarm(arac, true)
        TriggerEvent("police:hotwire")
        SetVehicleAlarmTimeLeft(arac, 30000)
    end
end

AddEventHandler('tg-lockpick:client:openLockpick', function(callback)
    lockpickCallback = callback
    openLockpick(true)
end)

RegisterNUICallback('callback', function(data, cb)
    openLockpick(false)
	lockpickCallback(data.success)
    cb('ok')
end)

RegisterNUICallback('exit', function()
    openLockpick(false)
end)

openLockpick = function(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
    lockpicking = bool
end