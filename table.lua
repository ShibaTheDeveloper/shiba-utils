local Module = {}

-- Insert base functions into module
for key, value in pairs(table) do
    Module[key] = value
end

-- Deep clone with cyclic reference handling
local function deepClone(original, seen)
    if type(original) ~= "table" then
        return original
    end

    seen = seen or {}

    if seen[original] then
        return seen[original]
    end

    local clone = {}
    seen[original] = clone

    for key, value in pairs(original) do
        local clonedKey = deepClone(key, seen)
        local clonedValue = deepClone(value, seen)
        clone[clonedKey] = clonedValue
    end

    local metatable = getmetatable(original)
    if metatable then
        setmetatable(clone, deepClone(metatable, seen))
    end

    return clone
end

-- Shallow clone (copies references only)
function Module.shallowClone(original)
    local clone = {}

    for key, value in pairs(original) do
        clone[key] = value
    end

    return clone
end

-- Deep clone wrapper
function Module.clone(original)
    return deepClone(original)
end

-- Reverse an array-like table, handles sparse arrays
function Module.reverse(array)
    local reversedTable = {}
    local maxIndex = 0

    for index in pairs(array) do
        if type(index) == "number" and index > maxIndex then
            maxIndex = index
        end
    end

    for index = 1, maxIndex do
        reversedTable[index] = array[maxIndex - index + 1]
    end

    return reversedTable
end

return Module -- Returns Module :3