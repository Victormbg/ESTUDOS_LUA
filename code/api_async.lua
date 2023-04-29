-- Importar a biblioteca
local async = require "lua-async"
local cjson = require "cjson.safe"

-- Criar uma função assíncrona que faz uma chamada de rede
local function make_network_request(url)
    return async.spawn(function()
        local http = require "socket.http"
        local response = http.request(url)
        return response
    end)
end

-- Criar uma função principal que usa a função assíncrona
async.run(function()
    -- Fazer uma chamada de rede
    local response = await(make_network_request(
                               "https://servicodados.ibge.gov.br/api/v1/localidades/estados/RJ"))

    -- Converter a resposta para uma tabela
    local data = cjson.decode(response)

    -- Imprimir informações sobre o estado
    print("Estado: " .. data.nome)
    print("Sigla: " .. data.sigla)
    print("Região: " .. data.regiao.nome)
end)
