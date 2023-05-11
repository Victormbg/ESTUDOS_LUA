-- Função que será executada em paralelo
local function minha_corrotina()
    print("Iniciando corrotina")

    -- Aguarda 1 segundo usando o comando "os.execute" do sistema operacional
    local time_to_wait = 1
    os.execute("sleep " .. time_to_wait)

    -- Exibe mensagem de finalização da corrotina após aguardar 1 segundo
    print("Corrotina finalizada após " .. time_to_wait .. " segundo(s)")
end

-- Cria duas corrotinas
local corrotina_1 = coroutine.create(minha_corrotina)
local corrotina_2 = coroutine.create(minha_corrotina)

-- Executa as corrotinas em paralelo
while (coroutine.status(corrotina_1) ~= "dead") or
    (coroutine.status(corrotina_2) ~= "dead") do
    -- Chama "coroutine.resume" para executar a próxima instrução na corrotina
    coroutine.resume(corrotina_1)
    coroutine.resume(corrotina_2)
end

-- Exibe mensagem de que todas as corrotinas foram finalizadas
print("Todas as corrotinas finalizadas")
