-- Definição da classe Pessoa
Pessoa = {nome = "", idade = 0}

-- Método construtor da classe Pessoa
function Pessoa:new(nome, idade)
  local pessoa = {}
  setmetatable(pessoa, self)
  self.__index = self
  self.nome = nome
  self.idade = idade
  return pessoa
end

-- Método da classe Pessoa para imprimir os dados da pessoa
function Pessoa:imprimirDados()
  print("Nome: " .. self.nome)
  print("Idade: " .. self.idade)
end

-- Criando um objeto do tipo Pessoa
local pessoa1 = Pessoa:new("João", 25)

-- Chamando o método imprimirDados() do objeto pessoa1
pessoa1:imprimirDados()