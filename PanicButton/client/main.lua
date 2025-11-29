local QBCore = exports['qb-core']:GetCoreObject()

local function TriggerPanic()
    TriggerServerEvent("HapticPanic:TriggerButton")
end

RegisterCommand("panic", function()
    local playerData = QBCore.Functions.GetPlayerData()
    local job = playerData.job.name

    if job == "police" or job == "sast" or job == "ambulance" then
        TriggerPanic()
    else
        lib.notify({
            title = 'Access Denied',
            description = 'You are not authorized to use the panic button.',
            type = 'error'
        })
    end
end, false)

RegisterKeyMapping("panic", "Trigger Panic Button", "keyboard", "F11")
