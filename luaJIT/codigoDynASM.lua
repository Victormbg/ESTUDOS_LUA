local ffi = require("ffi")

-- Inclui a biblioteca DynASM
local dynasm = require("dynasm")

-- Define as constantes que serão usadas no código de máquina
local op_add = 0x01
local int_size = 4

-- Define a função que irá gerar o código de máquina
local function generate_add_code()
    local code = dynasm.new()
    dynasm.setup(code)
    
    -- Define as variáveis necessárias para o código de máquina
    local x = dynasm.r64()
    local y = dynasm.r64()
    
    -- Define as instruções de máquina para a operação de adição
    dynasm.mov64(x, 10)
    dynasm.mov64(y, 20)
    dynasm.add64(x, y)
    
    -- Finaliza a geração do código de máquina
    local func_ptr = dynasm.finish(code)
    
    -- Retorna um wrapper para a função de máquina gerada
    return function()
        return ffi.cast("int (*)(void)", func_ptr)()
    end, dynasm.get_code_ptr(code)
end

-- Executa a função que gera o código de máquina e chama a função gerada
local add_func, code_ptr = generate_add_code()
local result = add_func()

-- Imprime o resultado da operação de adição
print("10 + 20 =", result) -- Output: 10 + 20 = 30

-- Imprime o código de máquina gerado
print("Código de máquina gerado:")
for i = 1, code_ptr:size() do
    io.write(string.format("%02X ", code_ptr:get(i - 1)))
    if i % 16 == 0 then io.write("\n") end
end
if code_ptr:size() % 16 ~= 0 then io.write("\n") end
