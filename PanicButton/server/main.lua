local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("HapticPanic:TriggerButton", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local job      = Player.PlayerData.job or {}
    local charinfo = Player.PlayerData.charinfo or {}

    local ped = GetPlayerPed(src)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    TriggerClientEvent("InteractSound_CL:PlayWithinDistance", -1, src, 30.0, "panic", 0.2)

    local dept = tostring(job.name or "")
    local label = ("X: %.2f, Y: %.2f"):format(x, y)

    local dispatch = {
        priority    = "high",
        code        = "Panic Alert",
        title       = "Panic Button Activated",
        description = (("%s %s has triggered their panic button!"):format(
            tostring(charinfo.firstname or ""), tostring(charinfo.lastname or "")
        )),
        location    = { label = label, coords = { x = x + 0.0, y = y + 0.0 } },
        time        = 180,
        sound       = "panic-button.mp3",
        fields      = { { icon = "fa-solid fa-shield-halved", label = "Department", value = dept:upper() } },
    }
    if dept == "police" or dept == "sast" or dept == "sheriff" or dept == "lspd" then
        dispatch.job = "police"
    elseif dept == "ambulance" or dept == "ems" then
        dispatch.job = "ambulance"
    end

    local ok, err = pcall(function()
        exports["lb-tablet"]:AddDispatch(dispatch)
    end)
    if not ok then
        print(("[PanicButton] lb-tablet AddDispatch failed: %s"):format(err or "unknown error"))
    end
end)