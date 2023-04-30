local lapis = require("lapis")
local app = lapis.Application()

-- GET method
app:get("/", function()
    return { render = "index", title = "Servidor Ligado" }
end)

-- Views
app:match("index", "/", function(self)
    self.page_title = self.title
end)

-- Layout
app:before_filter(function(self)
    self.title = "Default Title"
    self.stylesheets = { "/public/css/style.css" }
    self.scripts = { "/public/js/script.js" }
end)

--[[
-- POST method
app:post("/", function(self)
    local body = self.params
    -- manipular os dados recebidos no corpo da solicitação
    return { json = { status = "success", message = "POST request received" } }
end)

-- PUT method
app:put("/", function(self)
    local body = self.params
    -- manipular os dados recebidos no corpo da solicitação
    return { json = { status = "success", message = "PUT request received" } }
end)

-- DELETE method
app:delete("/", function(self)
    -- manipular os dados recebidos no corpo da solicitação
    return { json = { status = "success", message = "DELETE request received" } }
end)
--]]
-- Serve
app:run()
