-- Data com formato
io.write("A data é ", os.date("%d/%m/%Y"), "\n")

-- Data e hora
io.write("A data e hora são ", os.date("%c"), "\n")

-- Hora
io.write("A hora do sistema é ", os.time(), "\n")

-- Aguardar um tempo
for i = 1, 1000000 do
end

-- Tempo desde o início da execução do Lua
io.write("O Lua foi iniciado há ", os.clock(), " segundos\n")
