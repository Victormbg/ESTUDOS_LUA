local list = {10, 20, 30, 50}

for position = 1, 4 do 
    print(position .. ": " .. list[position]) 
end

for i = 4, 1, -1 do 
    print(i .. ": " .. list[i]) 
end

for position in pairs(list) do 
    print(list[position]) 
end

for position, value in pairs(list) do 
    print(position .. ": " .. value) 
end

for _, value in pairs(list) do 
    print(value) 
end

for index, _ in pairs(list) do 
    print(index) 
end
