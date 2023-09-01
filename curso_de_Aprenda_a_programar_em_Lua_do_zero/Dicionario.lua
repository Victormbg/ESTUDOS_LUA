local list = {a = 10, b = 20, blue = "color"}

print(list["blue"])

list = {["color"] = "red", [14] = "b", [true] = "C", age = 28}

print(list["color"])
print(list[14])
print(list[true])

for key, value in pairs(list) do
    print("Chave: " .. tostring(key) .. " Valor: " .. value)
end
