local http_request = require "http.request"
local cjson = require "cjson.safe"

-- Define o CEP desejado
local cep = "21073460"

-- Define a URL da API dos Correios que retorna os dados do CEP
local url = "https://viacep.com.br/ws/" .. cep .. "/json/"

-- Faz a requisição à API
local headers, stream = assert(http_request.new_from_uri(url):go())

-- Obtém o corpo da resposta da API como string
local body = assert(stream:get_body_as_string())

-- Converte o corpo da resposta em uma tabela
local response = assert(cjson.decode(body))

-- Verifica se a requisição foi bem-sucedida
if headers:get(":status") ~= "200" then error(response["erro"]) end

-- Imprime os dados do CEP
print("CEP: " .. response["cep"])
print("Logradouro: " .. response["logradouro"])
print("Complemento: " .. response["complemento"])
print("Bairro: " .. response["bairro"])
print("Cidade: " .. response["localidade"])
print("Estado: " .. response["uf"])
