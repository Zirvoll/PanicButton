if not IsResourceActive('ox_core') then return end

local function oxPlayerGet(src, field)
    return exports.ox_core:CallPlayer(source, "get", field)
end

function GetPlayerInfo(src)
    local firstName, lastName = oxPlayerGet(src, 'firstName'), oxPlayerGet(src, 'lastName')
    local job = exports.ox_core:CallPlayer(source, "getGroupByType", "job")
    
    return {
        name = string.format('%s %s', firstName, lastName),
        job = job[1] or 'unemployed',
    }
end

FrameworkFound = true
