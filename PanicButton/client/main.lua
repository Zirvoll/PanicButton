local function TriggerPanic()
    TriggerServerEvent("HapticPanic:TriggerButton")
end
RegisterCommand("panic", function()
    TriggerPanic()
end, false)

RegisterKeyMapping("panic", "Trigger Panic Button", "keyboard", "F11")