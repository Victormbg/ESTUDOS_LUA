local matrix = {{"a", "b", "c"}, {"d", "e", "f"}, {"g", "h", "i"}}

print(matrix[1])

print(matrix[1][2])

for _, line in pairs(matrix) do for _, column in pairs(line) do print(column) end end

for index, line in pairs(matrix) do
    print("Line: " .. index .. ":")
    for _, column in pairs(line) do print(column) end
end

local matrix2 = {
    {"a", {"b.1", {"b.2.1", "b.2.2"}}, "c"}, {"d", "e", "f"}, {"g", "h", "i"}
}

print(matrix2[1][2][2][2])