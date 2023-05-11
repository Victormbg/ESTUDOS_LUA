-- importando os módulos base64 e hexTOtext
local model = require "init".model

local function clearConsole()
    if os.getenv("OS") == "Windows_NT" then -- Windows
        os.execute("cls")
    else                                    -- Linux/Unix/macOS
        os.execute("clear")
    end
end

local function opcao2()
    -- Limpar Terminal
    clearConsole()
    -- decodificando o texto hex e exibindo o resultado
    io.write("Digite o texto hex: ")
    local textoHex = io.read()
    if #textoHex > 0 then
        local ok, textoDecodificado = pcall(model.hexTotext.dec, textoHex)
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

return opcao2
