local function TriggerPanic()
    TriggerServerEvent("HapticPanic:TriggerButton")
end

RegisterCommand("panic", TriggerPanic, false)

RegisterKeyMapping("panic", "Trigger Panic Button", "keyboard", "F11")
