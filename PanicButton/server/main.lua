local policeJobs = { "police", "sast", "sheriff", "lspd" }
local ambulanceJobs = { "ambulance", "ems" }


RegisterNetEvent("HapticPanic:TriggerButton", function()
    local src = source

    if not FrameworkFound then
        error(string.format("Script has not found your framework, please make sure it exists within: '@%s/server/bridges/'", GetCurrentResourceName()))
    end

    local ped = GetPlayerPed(src)
    local Player = GetPlayerInfo(src)

    local jobs = {}
    if ArrayContains(policeJobs, Player.job) then
        table.insert(job, "police")
    end
    if ArrayContains(ambulanceJobs, Player.job) then
        table.insert(job, "ambulance")
    end

    -- Exit if no job was found
    if #jobs < 1 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Access Denied",
            description = "You are not authorized to use the panic button",
            type = 'error',
        })
        return
    end

    local x, y, z = table.unpack(GetEntityCoords(ped))
    TriggerClientEvent("InteractSound_CL:PlayWithinDistance", -1, src, 30.0, "panic", 0.2)

    local dept = tostring(Player.job or "")
    local label = ("X: %.2f, Y: %.2f"):format(x, y)

    local dispatch = {
        priority    = "high",
        code        = "Panic Alert",
        title       = "Panic Button Activated",
        description = (("%s has triggered their panic button!"):format(Player.name)),
        location    = { label = label, coords = { x = x, y = y } },
        time        = 180,
        sound       = "panic-button.mp3",
        fields      = { { icon = "fa-solid fa-shield-halved", label = "Department", value = dept:upper() } },
    }

    for i = 1, #jobs do
        dispatch.job = jobs[i]

        local ok, err = pcall(function()
            exports["lb-tablet"]:AddDispatch(dispatch)
        end)
        
        if not ok then
            print(("[PanicButton] lb-tablet AddDispatch failed for job: %s"):format(jobs[i]))
            print(("[PanicButton] Error: %s"):format(err or "unknown error"))
        end
    end
end)