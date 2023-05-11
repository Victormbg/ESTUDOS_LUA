-- Implementação de DFS para o jogo da velha

-- Função que verifica se um jogador venceu a partida
local function verifica_vencedor(tabuleiro, jogador)
    -- Verifica linhas e colunas
    for i = 1, 3 do
        if tabuleiro[i][1] == jogador and tabuleiro[i][2] == jogador and tabuleiro[i][3] == jogador then
            return true
        elseif tabuleiro[1][i] == jogador and tabuleiro[2][i] == jogador and tabuleiro[3][i] == jogador then
            return true
        end
    end

    -- Verifica diagonais
    if tabuleiro[1][1] == jogador and tabuleiro[2][2] == jogador and tabuleiro[3][3] == jogador then
        return true
    elseif tabuleiro[3][1] == jogador and tabuleiro[2][2] == jogador and tabuleiro[1][3] == jogador then
        return true
    end

    return false
end

-- Função principal de DFS
local function dfs(tabuleiro, jogador)
    -- Verifica se alguém já ganhou a partida
    if verifica_vencedor(tabuleiro, "x") then
        return -1 -- Computador ganha
    elseif verifica_vencedor(tabuleiro, "o") then
        return 1 -- Jogador ganha
    end

    -- Verifica se não há mais jogadas possíveis
    local empate = true
    for i = 1, 3 do
        for j = 1, 3 do
            if tabuleiro[i][j] == " " then
                empate = false
                break
            end
        end
    end

    if empate then
        return 0 -- Empate
    end

    -- Inicializa o valor máximo para o jogador "x"
    local max_valor = -math.huge

    -- Percorre todo o tabuleiro procurando a melhor jogada
    for i = 1, 3 do
        for j = 1, 3 do
            if tabuleiro[i][j] == " " then
                -- Faz uma jogada
                tabuleiro[i][j] = jogador

                -- Calcula o valor para a jogada
                local valor_jogada = dfs(tabuleiro, jogador == "x" and "o" or "x")

                -- Desfaz a jogada
                tabuleiro[i][j] = " "

                -- Se o jogador "x" está jogando, escolhe o maior valor
                if jogador == "x" then
                    max_valor = math.max(max_valor, valor_jogada)
                else
                    -- Senão, escolhe o menor valor
                    max_valor = math.min(max_valor, valor_jogada)
                end
            end
        end
    end

    return max_valor
end

-- Função que escolhe a melhor jogada para o computador
local function escolhe_jogada(tabuleiro)
    local melhor_jogada
    local max_valor = -math.huge

    -- Percorre todo o tabuleiro procurando a melhor jogada
    for i = 1, 3 do
        for j = 1, 3 do
            if tabuleiro[i][j] ==

                ChatGPT
                " " then
                -- Faz uma jogada
                tabuleiro[i][j] = "x"

                -- Calcula o valor para a jogada usando DFS
                local valor_jogada = dfs(tabuleiro, "o")

                -- Desfaz a jogada
                tabuleiro[i][j] = " "

                -- Verifica se o valor é maior que o máximo atual
                if valor_jogada > max_valor then
                    max_valor = valor_jogada
                    melhor_jogada = { i, j }
                end
            end
        end
    end

    -- Retorna a melhor jogada encontrada
    return melhor_jogada[1], melhor_jogada[2]
end

-- Exemplo de uso:
local tabuleiro = { { " ", " ", " " }, { " ", " ", " " }, { " ", " ", " " } }
local jogadas = 0
local fim_de_jogo = false

-- Loop principal do jogo
while not fim_de_jogo do
    -- Verifica quem joga
    local jogador
    if jogadas % 2 == 0 then
        jogador = "o"
    else
        jogador = "x"
    end

    -- Se o jogador é o computador, escolhe a melhor jogada
    if jogador == "x" then
        local i, j = escolhe_jogada(tabuleiro)
        tabuleiro[i][j] = jogador
        print("O computador jogou na posição (" .. i .. ", " .. j .. ")")
    else
        -- Senão, pede a jogada do usuário
        print("Digite a posição desejada (linha, coluna):")
        local entrada = io.read()
        local linha, coluna = entrada:match("(%d), (%d)")
        linha, coluna = tonumber(linha), tonumber(coluna)
        tabuleiro[linha][coluna] = jogador
    end

    -- Imprime o tabuleiro
    print(tabuleiro[1][1] .. "|" .. tabuleiro[1][2] .. "|" .. tabuleiro[1][3])
    print("-+-+-")
    print(tabuleiro[2][1] .. "|" .. tabuleiro[2][2] .. "|" .. tabuleiro[2][3])
    print("-+-+-")
    print(tabuleiro[3][1] .. "|" .. tabuleiro[3][2] .. "|" .. tabuleiro[3][3])

    -- Verifica se o jogo terminou
    jogadas = jogadas + 1
    if verifica_vencedor(tabuleiro, jogador) or jogadas == 9 then
        fim_de_jogo = true
        if verifica_vencedor(tabuleiro, jogador) then
            print("O jogador " .. jogador .. " venceu!")
        else
            print("Empate!")
        end
    end
end
