if not IsResourceActive('es_extended') then return end

local ESX = exports.es_extended:getSharedObject()

function GetPlayerInfo(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    
    return {
        name = xPlayer.getName(),
        job = xPlayer.getJob()?.name,
    }
end

FrameworkFound = true
