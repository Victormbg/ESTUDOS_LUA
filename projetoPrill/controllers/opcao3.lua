-- importando os módulos base64 e hexTOtext
local jsonANDyaml = require "model.jsonANDyaml"

local function clearConsole()
    if os.getenv("OS") == "Windows_NT" then -- Windows
        os.execute("cls")
    else                                    -- Linux/Unix/macOS
        os.execute("clear")
    end
end

local function opcao3()
    -- Limpar Terminal
    clearConsole()
    -- pedindo para o usuário digitar o JSON
    io.write("Digite o JSON: ")
    local jsonString = io.read()
    -- verificando se o usuário digitou algo
    if #jsonString > 0 then
        -- convertendo o JSON para YAML e exibindo o resultado
        local ok, yamlString = pcall(jsonANDyaml.jsonToYaml, jsonString)
        if ok then
            -- Limpar Terminal
            clearConsole()
            io.write("YAML: ", yamlString, "\n")
            -- perguntar ao usuário se ele deseja salvar o resultado em um arquivo
            io.write("Deseja salvar o resultado em um arquivo do tipo YAML? (S/N) ")
            local opcao = io.read()
            if opcao == 's' or opcao == 'S' then
                io.write("Digite o nome do arquivo: ")
                local nomeArquivo = tostring(io.read()) .. ".yaml"
                local arquivo = io.open(nomeArquivo, "w")
                if arquivo then
                    arquivo:write(yamlString)
                    arquivo:close()
                    -- Limpar Terminal
                    clearConsole()
                    io.write("O resultado foi salvo em " .. nomeArquivo .. "\n")
                else
                    -- Limpar Terminal
                    clearConsole()
                    io.write("Não foi possível salvar o arquivo.\n")
                end
            end
        else
            -- Limpar Terminal
            clearConsole()
            io.write("Erro ao converter JSON para YAML: ", yamlString, "\n")
        end
    else
        io.write("Você precisa digitar algo!\n")
    end
end

return opcao3
