-- Importa o módulo love
local love = require("love")

-- Tamanho do quadrado
local square_size = 100

-- Posição inicial do quadrado
local x, y = 100, 300

-- Velocidade inicial do quadrado
local velocity = 0

-- Aceleração da gravidade
local gravity = 500

-- Carrega a música de fundo
local music = love.audio.newSource("music.mp3", "stream")

-- Função que é chamada quando o jogo é iniciado
function love.load()
    -- Define o título da janela
    love.window.setTitle("Quadrado Pulando")

    -- Define o tamanho da janela
    love.window.setMode(800, 600)

    -- Inicia a música de fundo
    music:setLooping(true)
    love.audio.play(music)
end

-- Função que atualiza o estado do jogo
function love.update(dt)
    -- Atualiza a posição do quadrado de acordo com a velocidade
    y = y - velocity * dt

    -- Atualiza a velocidade do quadrado de acordo com a aceleração da gravidade
    velocity = velocity - gravity * dt

    -- Se o quadrado cair abaixo do chão, ele para de cair
    if y + square_size > love.graphics.getHeight() then
        y = love.graphics.getHeight() - square_size
        velocity = 0
    end

    -- Se a tecla de espaço for pressionada e o quadrado estiver no chão, ele pula
    if love.keyboard.isDown("space") and y + square_size == love.graphics.getHeight() then
        velocity = 200
    end

    -- Se a tecla da seta para esquerda for pressionada, o quadrado se move para a esquerda
    if love.keyboard.isDown("left") then
        x = x - 200 * dt
    end

    -- Se a tecla da seta para direita for pressionada, o quadrado se move para a direita
    if love.keyboard.isDown("right") then
        x = x + 200 * dt
    end
end

-- Função que desenha o jogo na tela
function love.draw()
    -- Desenha o quadrado na tela
    love.graphics.rectangle("fill", x, y, square_size, square_size)

    -- Desenha o chão na tela
    love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 10, love.graphics.getWidth(), 10)
end
