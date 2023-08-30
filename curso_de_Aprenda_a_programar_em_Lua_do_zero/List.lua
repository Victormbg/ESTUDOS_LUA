local list = {1, 2, 3}

print(list[2])

list[2] = 10
list[3] = 20

print(list[2] .. " " .. list[3])

table.insert(list, 30)

print(list[2] .. " " .. list[3] .. " " .. list[4])

local number = 7

local list2 = {4, number, 9}

print(number)
print(list2[2])

