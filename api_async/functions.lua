local socket = require "socket"
local Promise = require("promise")

local M = {}

function M.make_network_request(url)
    return Promise.new(function(resolve, reject)
        local client = socket.tcp()
        client:settimeout(0)

        client:connect(url, 80, function()
            client:send("GET / HTTP/1.1\r\nHost: " .. url .. "\r\n\r\n")
        end)

        local response = ""
        local function receive_data()
            local chunk, status, partial = client:receive("*a")
            response = response .. (chunk or partial)
            if status == "closed" then
                client:close()
                if #response == 0 then
                    reject("Resposta vazia da chamada de rede")
                else
                    resolve(response)
                end
            else
                socket.sleep(0.1)
                receive_data()
            end
        end
        receive_data()
    end)
end

function M.make_network_request_async(url)
    local promise = {}
    promise.and_then = function(self, callback)
        M.make_network_request(url)
            :and_then(function(response)
                callback(response)
            end)
            :catch(function(error_msg)
                callback(nil, error_msg)
            end)
    end

    return promise
end

return M
