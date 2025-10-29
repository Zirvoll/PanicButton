if not IsResourceActive('qb-core') then return end

local QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerInfo(src)
    local Player = QBCore.Functions.GetPlayer(src)
    
    return {
        name = string.format('%s %s', Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname),
        job = Player.PlayerData.job.name,
    }
end

FrameworkFound = true
