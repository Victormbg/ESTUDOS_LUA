local opcoes = require "opcoes"

print("PROGRAMA PRILL - ICATU")

while true do
  -- exibindo o menu de opções
  print("Escolha uma opção:")
  print("1 - Decodificar texto Base64")
  print("2 - Decodificar texto Hex")
  print("3 - Decodificar JSON para YAML")
  print("4 - Decodificar YAML para JSON")
  print("5 - Sair")
  -- lendo a opção escolhida pelo usuário
  io.write("Opção: ")
  local opcao = io.read()
  -- verificando a opção escolhida
  if opcao == "1" then
    opcoes.opcao1();
  elseif opcao == "2" then
    opcoes.opcao2();
  elseif opcao == "3" then
    opcoes.opcao2();
  elseif opcao == "4" then
    opcoes.opcao2();
  elseif opcao == "5" then
    -- encerrando o programa
    break
  else
    io.write("Opção inválida! Tente novamente.\n")
  end
end
