if not IsResourceActive('qbx_core') then return end

function GetPlayerInfo(src)
    local Player = exports.qbx_core:GetPlayer(src)
    
    return {
        name = string.format('%s %s', Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname),
        job = Player.PlayerData.job.name,
    }
end

FrameworkFound = true
