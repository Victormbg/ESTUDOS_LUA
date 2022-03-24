function ValidarIdade(Idade)
	if Idade > 18 then
		return true;
	else
		return false;
	end;
end;
print("---SISTEMA DE CADASTRO---");
io.write("Digite o nome do aluno: ");
Nome = io.read();
io.write("Digite a idade do aluno: ");
Idade = io.read("n");
Res = ValidarIdade(Idade);
print(Res)
if Res == true then
	print("O aluno " .. Nome .. " e maior de idade.");
else
	print("O aluno " .. Nome .. " e menor de idade.");
end;
