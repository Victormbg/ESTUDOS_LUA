-- carregando os módulos
local model = {
    base64 = require "model.base64",
    hexTotext = require "model.hexTotext",
    jsonANDyaml = require "model.jsonANDyaml",
    jsonEscapeOrJsonUnescape = require "model.jsonEscapeOrJsonUnescape",
    url = require "model.urlEncodeAndDecode"
}
local view = require "view.app"
local controller = {
    opcao1 = require "controllers.opcao1",
    opcao2 = require "controllers.opcao2",
    opcao3 = require "controllers.opcao3",
    opcao4 = require "controllers.opcao4",
}

-- definindo configurações iniciais
-- ...

-- exportando o objeto do controller para ser utilizado no main.lua
return {
    controller = controller,
    view = view,
    model = model
}
