local Module = {}

-- Insert base functions into module
for key, value in pairs(string) do
    Module[key] = value
end

-- Formats the output of splitTime into a string
-- Example: 100000 -> "0y 1d 3:46:40.000"

function Module.formatTime(years, days, hours, minutes, seconds, milliseconds)
    local timeStr = string.format("%dy %dd %02d:%02d:%02d.%03d",
        years, days, hours, minutes, seconds, milliseconds)

    return timeStr
end

return Module