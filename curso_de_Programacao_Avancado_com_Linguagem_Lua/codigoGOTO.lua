-- Loop for com 5 iterações
for i = 1, 5 do
  print("Iteração " .. i)
  goto ponto_de_saida
end

::ponto_de_saida::
print("Este trecho será executado após o goto")

-- Bloco de código com goto
do
  print("Este trecho será executado antes do goto")
  goto ponto_de_saida2
  print("Este trecho não será executado")
end

::ponto_de_saida2::
print("Este trecho será executado após o segundo goto")
