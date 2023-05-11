local cjson = require("cjson.safe") -- Importa a biblioteca cjson para trabalhar com JSON de forma segura
local yaml = require("lyaml")       -- Importa a biblioteca lyaml para trabalhar com YAML

local function jsonToYaml(jsonString)
  local luaTable, err = cjson.decode(jsonString) -- Converte a string JSON em uma tabela Lua
  if not luaTable then                         -- Verifica se ocorreu um erro na conversão
    error("Entrada JSON inválida: " .. err)   -- Lança um erro informando o motivo do erro
  end

  local yamlString = yaml.dump(luaTable) -- Converte a tabela Lua em uma string YAML

  return yamlString                    -- Retorna a string YAML gerada
end

local function yamlToJson(yamlString)
  local luaTable = yaml.load(yamlString) -- Converte a string YAML em uma tabela Lua
  if not luaTable then                 -- Verifica se ocorreu um erro na conversão
    error("Entrada YAML inválida")    -- Lança um erro informando que a entrada YAML é inválida
  end

  local jsonString = cjson.encode(luaTable) -- Converte a tabela Lua em uma string JSON

  return jsonString                       -- Retorna a string JSON gerada
end

return {
  jsonToYaml = jsonToYaml, -- Exporta a função jsonToYaml
  yamlToJson = yamlToJson -- Exporta a função yamlToJson
}                        -- Retorna uma tabela com as funções para serem utilizadas em outros módulos
