-- DFS é uma técnica de busca em profundidade que é usada em grafos ou árvores para percorrer todos os vértices visitáveis.
-- Ela começa em um nó raiz e explora tanto quanto possível cada ramificação antes de voltar e explorar outras ramificações.

-- A função dfs é a implementação da busca em profundidade em Lua. Ela recebe como argumentos um grafo representado como uma tabela,
-- um nó inicial e um conjunto de nós visitados (que é opcional e é usado para evitar a visita repetida de nós).

local function dfs(graph, start, visited)
    visited = visited or {} -- Inicializa o conjunto de nós visitados
    visited[start] = true   -- Marca o nó atual como visitado
    print(start)            -- Imprime o nó atual

    -- Percorre todos os vizinhos do nó atual que ainda não foram visitados
    for _, neighbor in ipairs(graph[start]) do
        if not visited[neighbor] then
            dfs(graph, neighbor, visited) -- Chama a função dfs recursivamente para visitar os vizinhos não visitados
        end
    end
end

-- Exemplo de uso:
-- Define um grafo como uma tabela de listas de adjacência
local graph = {
    A = { "B", "C" },
    B = { "A", "D", "E" },
    C = { "A", "F" },
    D = { "B" },
    E = { "B", "F" },
    F = { "C", "E" }
}

dfs(graph, "A") -- Chama a função dfs para o nó "A"
