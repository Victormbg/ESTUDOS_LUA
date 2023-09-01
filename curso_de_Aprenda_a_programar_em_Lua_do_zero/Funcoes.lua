function Capitalize(word)
    local first = string.sub(word, 1, 1)
    local remaining = string.sub(word, 2, #word)

    return (string.upper(first) .. string.lower(remaining))
end

print(Capitalize("BLUE"))
print(Capitalize("ViCToR"))

function Reduce(list, initial, fn)
    local result = initial
    for _, value in pairs(list) do result = fn(result, value) end
    return result
end

Sum = function(a, b) return a + b end
Concat = function(a, b) return a .. b end

local list = {1, 2, 3}
print(Reduce(list, 0, Sum))
print(Reduce(list, "", Concat))
