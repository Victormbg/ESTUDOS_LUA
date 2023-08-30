-- REP
-- REPETE A PALAVRA 5 VEZES
print(string.rep("AB", 5))

local text = "Ola"

local text2 = "Mundo"

local space = 2

print(text .. string.rep(" ", space) .. text2)

space = 0

print(text .. string.rep(" ", space) .. text2)

-- REVERSE

print(string.reverse("ABC"))

print(string.reverse("A B C"))