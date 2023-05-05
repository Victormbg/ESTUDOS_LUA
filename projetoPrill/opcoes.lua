-- importando os módulos base64 e hexTOtext
local base64 = require "base64"
local hexTotext = require "hexTotext"
local jsonANDyaml = require "jsonANDyaml"

function clearConsole()
    if package.config:sub(1, 1) == '\\' then -- Windows
        local winapi = require("winapi")
        winapi.shell_exec("cls")
    else -- Linux/Unix
        os.execute("clear")
    end
end

function opcao1()
    -- Limpar Terminal
    clearConsole()
    -- pedindo para o usuário digitar o texto base64
    io.write("Digite o texto Base64: ")
    local textoBase64 = io.read()
    -- verificando se o usuário digitou algo
    if #textoBase64 > 0 then
        -- decodificando o texto base64 e exibindo o resultado
        local textoDecodificado = base64.dec(textoBase64)
        io.write("Texto decodificado: ", textoDecodificado, "\n")
    else
        io.write("Você precisa digitar algo!\n")
    end
end

function opcao2()
    -- Limpar Terminal
    clearConsole()
    -- decodificando o texto hex e exibindo o resultado
    io.write("Digite o texto hex: ")
    local textoHex = io.read()
    if #textoHex > 0 then
        local ok, textoDecodificado = pcall(hexTotext.dec, textoHex)
        if ok then
            -- Limpar Terminal
            clearConsole()
            io.write("Texto decodificado: ", textoDecodificado, "\n")
            -- perguntar ao usuário se ele deseja salvar o resultado em um arquivo
            io.write("Deseja salvar o resultado em um arquivo de texto? (S/N) ")
            local opcao = io.read()
            if opcao == 's' or opcao == 'S' then
                io.write("Digite o nome do arquivo: ")
                local nomeArquivo = io.read()
                local arquivo = io.open(nomeArquivo, "w")
                if arquivo then
                    arquivo:write(textoDecodificado)
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
            io.write("Erro ao decodificar texto hex: ", textoDecodificado, "\n")
        end
    else
        io.write("Você precisa digitar algo!\n")
    end
end

function opcao3()
    -- Limpar Terminal
    clearConsole()
    -- decodificando o texto hex e exibindo o resultado
    io.write("Digite o JSON: ")
    local jsonString = io.read()
    if #jsonString > 0 then
        local ok, textoDecodificado = pcall(jsonANDyaml.jsonToYaml, jsonString)
        if ok then
            -- Limpar Terminal
            clearConsole()
            io.write("YAML: ", textoDecodificado, "\n")
            -- perguntar ao usuário se ele deseja salvar o resultado em um arquivo
            io.write("Deseja salvar o resultado em um arquivo de texto? (S/N) ")
            local opcao = io.read()
            if opcao == 's' or opcao == 'S' then
                io.write("Digite o nome do arquivo: ")
                local nomeArquivo = io.read()
                local arquivo = io.open(nomeArquivo, "w")
                if arquivo then
                    arquivo:write(textoDecodificado)
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
            io.write("Erro ao decodificar texto hex: ", textoDecodificado, "\n")
        end
    else
        io.write("Você precisa digitar algo!\n")
    end
end

function opcao4()
    -- Limpar Terminal
    clearConsole()
    -- decodificando o texto hex e exibindo o resultado
    io.write("Digite o YAML: ")
    local yamlString = io.read()
    if #yamlString > 0 then
        local ok, textoDecodificado = pcall(jsonANDyaml.yamlToJson, yamlString)
        if ok then
            -- Limpar Terminal
            clearConsole()
            io.write("JSON: ", textoDecodificado, "\n")
            -- perguntar ao usuário se ele deseja salvar o resultado em um arquivo
            io.write("Deseja salvar o resultado em um arquivo de texto? (S/N) ")
            local opcao = io.read()
            if opcao == 's' or opcao == 'S' then
                io.write("Digite o nome do arquivo: ")
                local nomeArquivo = io.read()
                local arquivo = io.open(nomeArquivo, "w")
                if arquivo then
                    arquivo:write(textoDecodificado)
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
            io.write("Erro ao decodificar texto hex: ", textoDecodificado, "\n")
        end
    else
        io.write("Você precisa digitar algo!\n")
    end
end

return {
    opcao1 = opcao1,
    opcao2 = opcao2,
    opcao3 = opcao3,
    opcao4 = opcao4
}
