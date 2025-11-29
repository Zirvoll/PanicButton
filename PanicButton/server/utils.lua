function IsResourceActive(resource)
    local state = GetResourceState(resource)
    return state == 'started' or state == 'starting'
end
