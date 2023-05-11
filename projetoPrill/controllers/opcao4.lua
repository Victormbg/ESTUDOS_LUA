-- importando os módulos base64 e hexTOtext
local model = require "init".model

local function clearConsole()
    if os.getenv("OS") == "Windows_NT" then -- Windows
        os.execute("cls")
    else                                    -- Linux/Unix/macOS
        os.execute("clear")
    end
end

local function opcao4()
    -- Limpar Terminal
    clearConsole()

    -- Lendo YAML
    io.write("Digite o YAML: ")
    local yamlString = io.read("*l")
    if #yamlString == 0 then
        io.write("Você precisa digitar algo!\n")
        return
    end

    -- Convertendo YAML em JSON
    local ok, jsonString = pcall(model.jsonANDyaml.yamlToJson, yamlString)
    if not ok then
        io.write("Erro ao converter YAML em JSON\n")
        return
    end

    -- Exibindo resultado
    io.write("JSON: ", jsonString, "\n")

    -- Perguntando se usuário quer salvar resultado em arquivo
    io.write("Deseja salvar o resultado em um arquivo? (S/N) ")
    local opcao = io.read()
    if opcao ~= 's' and opcao ~= 'S' then
        return
    end

    -- Lendo nome do arquivo
    io.write("Digite o nome do arquivo: ")
    local nomeArquivo = io.read()
    if #nomeArquivo == 0 then
        io.write("Nome do arquivo inválido!\n")
        return
    end
    nomeArquivo = nomeArquivo .. ".json"

    -- Salvando em arquivo
    local arquivo = io.open(nomeArquivo, "w")
    if not arquivo then
        io.write("Não foi possível salvar o arquivo.\n")
        return
    end
    arquivo:write(jsonString)
    arquivo:close()

    -- Exibindo mensagem de sucesso
    io.write("O resultado foi salvo em " .. nomeArquivo .. "\n")
end

return opcao4
