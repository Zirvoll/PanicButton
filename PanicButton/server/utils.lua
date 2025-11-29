function IsResourceActive(resource)
    local state = GetResourceState(resource)
    return state == 'started' or state == 'starting'
end

---Check if an item is in an array
---@param array table
---@param item number | string
---@return boolean
function ArrayContains(array, item)
    for i = 1, #array do
        if array[i] == item then return true end
    end

    return false
end
