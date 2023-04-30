-- Importar as dependências
local Promise = require("promise")
local cjson = require("cjson")
local async = require("lua-async-await")
local functions = require("functions")

-- Função assíncrona para obter os dados de um estado
local function get_state_data_async(state)
    local url = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/" .. state

    -- Retornar uma promessa para a chamada de rede
    return Promise.new(function(resolve, reject)
        functions.make_network_request_async(url)
            :and_then(function(response)
                if response ~= nil then
                    local data = cjson.decode(response)
                    resolve(data)
                else
                    reject("Resposta nula da chamada de rede para " .. state)
                end
            end)
            :catch(function(error_msg)
                reject("Erro na chamada de rede para " .. state .. ": " .. error_msg)
            end)
    end)
end

-- Função assíncrona principal
local async_main = async(function()
    local rj_promise = get_state_data_async("RJ")
    local sp_promise = get_state_data_async("SP")

    local states_data = await(Promise.all({rj_promise, sp_promise}))

    -- Imprimir informações sobre os estados
    print("Estado RJ:")
    print("  Estado: " .. states_data[1].nome)
    print("  Sigla: " .. states_data[1].sigla)
    print("  Região: " .. states_data[1].regiao.nome)

    print("Estado SP:")
    print("  Estado: " .. states_data[2].nome)
    print("  Sigla: " .. states_data[2].sigla)
    print("  Região: " .. states_data[2].regiao.nome)
end)

-- Executar a função assíncrona principal
async_main():catch(function(error_msg)
    print(error_msg)
end)
