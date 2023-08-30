local email = "teste@gmail.com"

local teste = string.find(email, "yahoo.com")

if teste == nil then
    print("ERRO")
elseif teste ~= nil then
    print("ACERTOU!!!")
end

teste = string.find(email, "gmail.com")

if teste == nil then
    print("ERRO")
elseif teste ~= nil then
    print("ACERTOU!!!")
end

print(string.find(email, "gmail.com"))