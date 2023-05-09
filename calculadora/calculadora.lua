-- Função para somar dois números
function Somar(Num1, Num2) return Num1 + Num2 end

-- Função para subtrair dois números
function Subtrair(Num1, Num2) return Num1 - Num2 end

-- Função para multiplicar dois números
function Multiplicacao(Num1, Num2) return Num1 * Num2 end

-- Função para dividir dois números
function Divisao(Num1, Num2)
    if Num2 == 0 then error("Divisão por zero não é permitida!") end
    return Num1 / Num2
end

-- Função para exibir a tela inicial da calculadora
function TelaInicial()
    print("---CALCULADORA EM LUA---")
    local Num1, Num2
    while true do
        io.write("Digite o primeiro valor: ")
        local input = io.read()
        Num1 = tonumber(input)
        if Num1 then break end
        print("Valor inválido, tente novamente.")
    end
    while true do
        io.write("Digite o segundo valor: ")
        local input = io.read()
        Num2 = tonumber(input)
        if Num2 then break end
        print("Valor inválido, tente novamente.")
    end
    Resultado(Num1, Num2)
end

-- Função para exibir o resultado das operações
function Resultado(Num1, Num2)
    os.execute("cls || clear") -- Limpa a tela do terminal
    print("Resultado:")
    print("Soma: " .. Somar(Num1, Num2))
    print("Subtração: " .. Subtrair(Num1, Num2))
    print("Multiplicação: " .. Multiplicacao(Num1, Num2))
    print("Divisão: " .. Divisao(Num1, Num2))
end

-- Chama a função para exibir a tela inicial da calculadora
TelaInicial()
