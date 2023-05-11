local opcao1 = require "controllers.opcao1"
local opcao2 = require "controllers.opcao2"
local opcao3 = require "controllers.opcao3"
local opcao4 = require "controllers.opcao4"

local function main()
  print("PROGRAMA PRILL - ICATU")
  print("Desenvolvido por Victor Manuel de Barros Garcia")
  print("Linguagem de programação: Lua 5.3")

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
      opcao1()
    elseif opcao == "2" then
      opcao2()
    elseif opcao == "3" then
      opcao3()
    elseif opcao == "4" then
      opcao4()
    elseif opcao == "5" then
      -- encerrando o programa
      break
    else
      io.write("Opção inválida! Tente novamente.\n")
    end
  end
end

main()
