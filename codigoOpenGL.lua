local gl = require("luagl")
local lgi = require("lgi")

-- define constantes para as cores
local RED = {1.0, 0.0, 0.0}
local GREEN = {0.0, 1.0, 0.0}
local BLUE = {0.0, 0.0, 1.0}

-- função para inicializar o ambiente de renderização
local function init()
gl.ClearColor(0.0, 0.0, 0.0, 0.0)
gl.MatrixMode(gl.PROJECTION)
gl.LoadIdentity()
gl.Ortho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
end

-- função para desenhar um triângulo colorido
local function drawTriangle()
gl.Begin(gl.TRIANGLES)
gl.Color(RED)
gl.Vertex(-0.5, -0.5, 0.0)
gl.Color(GREEN)
gl.Vertex(0.5, -0.5, 0.0)
gl.Color(BLUE)
gl.Vertex(0.0, 0.5, 0.0)
gl.End()
end

-- função de exibição (chamada sempre que a janela é redesenhada)
local function display()
gl.Clear(gl.COLOR_BUFFER_BIT)
drawTriangle()
gl.Flush()
end

-- função chamada sempre que a janela é redimensionada
local function reshape(width, height)
gl.Viewport(0, 0, width, height)
end

-- inicializa o ambiente gráfico
lgi.init()
lgi.initWindowSize(500, 500)
lgi.createWindow("Exemplo LuaGL")
init()

-- registra as funções de exibição e redimensionamento
lgi.displayFunc(display)
lgi.reshapeFunc(reshape)

-- inicia o loop de eventos do OpenGL
lgi.mainLoop()