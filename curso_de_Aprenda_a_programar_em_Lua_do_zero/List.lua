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

list = {"A", "B", "C"}

print(table.concat(list, " - "))

local list3 = {3, 1, 2, -1, 8, 6}

table.sort(list3)

print("\n")

print(table.concat(list3, "\n"))

print("\n")

table.remove(list3, 1)

for _, value in pairs(list3) do print(value) end

