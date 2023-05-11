-- importando os módulos base64 e hexTOtext
local base64 = require "model.base64"

local function clearConsole()
    if os.getenv("OS") == "Windows_NT" then -- Windows
        os.execute("cls")
    else                                    -- Linux/Unix/macOS
        os.execute("clear")
    end
end

local function opcao1()
    -- Limpar Terminal
    clearConsole()
    -- pedindo para o usuário digitar o texto base64
    io.write("Digite o texto Base64: ")
    local textoBase64 = io.read()
    -- verificando se o usuário digitou algo
    if #textoBase64 == 0 then
        io.write("Você precisa digitar algo!\n")
        return
    end
    -- decodificando o texto base64 e exibindo o resultado
    local ok, textoDecodificado = pcall(base64.decode, textoBase64)
    if not ok then
        io.write("Erro ao decodificar texto Base64: ", textoDecodificado, "\n")
        return
    end
    io.write("Texto decodificado: ", textoDecodificado, "\n")
end

return opcao1
