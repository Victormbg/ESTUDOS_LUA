-- Floor: arredonda o número para baixo.
io.write("O arredondamento de 10.5055 para baixo é ", math.floor(10.5055),"\n")

-- Ceil: arredonda o número para cima.
io.write("O arredondamento de 10.5055 para cima é ", math.ceil(10.5055),"\n")

-- Square root: calcula a raiz quadrada do número.
io.write("A raiz quadrada de 16 é ",math.sqrt(16),"\n")

-- Power: calcula a potência de um número.
io.write("10 elevado a 2 é ",math.pow(10,2),"\n")
io.write("100 elevado a 0.5 é ",math.pow(100,0.5),"\n")

-- Absolute: retorna o valor absoluto de um número.
io.write("O valor absoluto de -10 é ",math.abs(-10),"\n")

--Random: gera um número aleatório.
math.randomseed(os.time())
io.write("Um número aleatório é gerado: ",math.random(),"\n")

--Random between 1 to 100: gera um número aleatório entre 1 e 100.
io.write("Um número aleatório entre 1 e 100 é gerado: ",math.random(1,100),"\n")

--Max: retorna o maior valor entre os números passados como argumento.
io.write("O valor máximo no conjunto de entrada é ",math.max(1,100,101,99,999),"\n")

--Min: retorna o menor valor entre os números passados como argumento.
io.write("O valor mínimo no conjunto de entrada é ",math.min(1,100,101,99,999),"\n")