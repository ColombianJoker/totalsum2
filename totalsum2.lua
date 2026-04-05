#!/usr/bin/env lua

-- Returns the sum of integer (truncated) square roots of numbers up to n
local function suma(n)
    local t = 0
    for i = 1, n do
        -- math.floor(math.sqrt(i)) provides the integer part
        local s = math.floor(math.sqrt(i))
        t = t + s
    end
    return t
end

-- Main
local block = 1000000000
local times = 3
local total = 0
local expected = 63244053298881

print("Lua:")

for i = 1, times do
    total = total + suma(block)
end

-- Using string.format for clean output
print(string.format("%d×suma(%d) = %d", times, block, total))

if total ~= expected then
    -- Writing to stderr in Lua
    io.stderr:write(string.format("ERROR: wrong result! (%d)\n", total))
end
