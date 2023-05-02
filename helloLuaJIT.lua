-- Exemplo de código em LuaJIT - Para Roda precisa usar o comando luajit ao inves de lua

-- Utiliza a biblioteca FFI para acessar funções C diretamente
local ffi = require("ffi")

-- Define um tipo de dados em C
ffi.cdef[[
    typedef struct {
        int x;
        int y;
    } Point;
]]

-- Cria uma instância do tipo Point em Lua
local p = ffi.new("Point", { 10, 20 })

-- Realiza operações matemáticas com as propriedades do objeto
p.x = p.x + 5
p.y = p.y * 2

-- Imprime as propriedades do objeto
print("p.x =", p.x) -- Output: p.x = 15
print("p.y =", p.y) -- Output: p.y = 40
