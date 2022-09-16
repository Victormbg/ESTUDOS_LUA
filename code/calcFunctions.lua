function Somar(Num1, Num2) return Num1 + Num2; end
function Subtrair(Num1, Num2) return Num1 - Num2; end
function Multiplicacao(Num1, Num2) return Num1 * Num2; end
function Divisao(Num1, Num2) return Num1 / Num2; end

function TelaInicial()
    print("---CALCULADORA EM LUA---");
    io.write("Digite o primeiro valor: ");
    Num1 = io.read("n");
    io.write("Digite o segundo valor: ");
    Num2 = io.read("n");
    Resultado(Num1, Num2)
end

function Resultado(Num1, Num2)
    os.execute("cls || clear")
    print(
        "Resultado: " .. "\nSoma: " .. Somar(Num1, Num2) .. "\nSubtração: " ..
            Subtrair(Num1, Num2) .. "\nMultiplicacao: " ..
            Multiplicacao(Num1, Num2) .. "\nDivisao: " .. Divisao(Num1, Num2));
end
