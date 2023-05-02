-- Importa a biblioteca cjson
local cjson = require("cjson")

-- Cria uma tabela com alguns dados
local my_data = {
    name = "João",
    age = 30,
    interests = {"Lua", "JavaScript", "Python"}
}

-- Serializa a tabela para JSON
local json_data = cjson.encode(my_data)
print(json_data)

-- Desserializa o JSON de volta para uma tabela
local decoded_data = cjson.decode(json_data)

-- Imprime a tabela desserializada
for key, value in pairs(decoded_data) do
    if type(value) == "table" then
        io.write(key .. ": ")
        for _, item in ipairs(value) do
            io.write(item .. " ")
        end
        io.write("\n")
    else
        print(key .. ": " .. tostring(value))
    end
end
