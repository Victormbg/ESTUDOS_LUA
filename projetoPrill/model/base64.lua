local base64 = {}

local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function base64.encode(data)
    local result = ""
    data = data:gsub('.', function(x)
        local r, b = '', x:byte()
        for i = 8, 1, -1 do
            r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
        end
        return r
    end)
    data = data .. string.rep('0', #data % 3)
    for i = 1, #data, 3 do
        local c1, c2, c3, c4 = data:sub(i, i + 2):byte()
        result = result .. b:sub(c1 >> 2 + 1, c1 >> 2 + 1)
        result = result .. b:sub(((c1 & 0x3) << 4) + (c2 or 0) >> 4 + 1, ((c1 & 0x3) << 4) + (c2 or 0) >> 4 + 1)
        result = result ..
        (#data - i > 1 and b:sub(((c2 & 0xF) << 2) + (c3 or 0) >> 6 + 1, ((c2 & 0xF) << 2) + (c3 or 0) >> 6 + 1) or '=')
        result = result .. (#data - i > 2 and b:sub((c3 & 0x3F) + 1, (c3 & 0x3F) + 1) or '=')
    end
    return result
end

function base64.decode(data)
    data = data:gsub('[^' .. b .. '=]', '')
    local result = ""
    for i = 1, #data, 4 do
        local c1, c2, c3, c4 = data:sub(i, i + 3):byte()
        local b1, b2, b3, b4 = b:find(string.char(c1)) - 1, b:find(string.char(c2)) - 1, b:find(string.char(c3)) - 1,
            b:find(string.char(c4)) - 1
        result = result .. string.char((b1 << 2) + (b2 >> 4))
        if c3 ~= 61 then result = result .. string.char(((b2 & 0xF) << 4) + (b3 >> 2)) end
        if c4 ~= 61 then result = result .. string.char(((b3 & 0x3) << 6) + b4) end
    end
    return result
end

return base64
