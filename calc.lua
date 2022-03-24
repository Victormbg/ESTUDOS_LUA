function Somar(Num1, Num2)
	return Num1 + Num2;
end;
function Subtrair(Num1, Num2)
	return Num1 - Num2;
end;
print("---CALCULADORA EM LUA---");
io.write("Digite o primeiro valor: ");
Num1 = io.read("n");
io.write("Digite o segundo valor: ");
Num2 = io.read("n");
print("Resultado da soma: " .. Somar(Num1, Num2) .. "\nResultado da subtracao: " .. Subtrair(Num1, Num2));
