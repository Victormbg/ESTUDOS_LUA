function ValidarIdade(Idade)
    if Idade > 18 then
        return true
    else
        return false
    end
end

print("---SISTEMA DE CADASTRO---")
io.write("Digite o nome do aluno: ")
Nome = io.read()
Idade = nil
while not Idade do
    io.write("Digite a idade do aluno: ")
    local input = io.read()
    Idade = tonumber(input)
    if not Idade then print("Por favor, digite um número válido.") end
end

local success, message = pcall(ValidarIdade, Idade)

if success then
    if message then
        print("O aluno " .. Nome .. " é maior de idade.")
    else
        print("O aluno " .. Nome .. " é menor de idade.")
    end
else
    print("Erro: " .. message)
end
