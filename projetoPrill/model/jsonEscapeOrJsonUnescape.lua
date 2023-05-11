local unicode_to_utf8 = require("model.urlEncodeAndDecode")

local function json_escape(str)
    local result = ""
    for i = 1, #str do
        local char = str:sub(i, i)
        if char == '"' then
            result = result .. '\\"'
        elseif char == '\\' then
            result = result .. '\\\\'
        elseif char == '/' then
            result = result .. '\\/'
        elseif char == '\b' then
            result = result .. '\\b'
        elseif char == '\f' then
            result = result .. '\\f'
        elseif char == '\n' then
            result = result .. '\\n'
        elseif char == '\r' then
            result = result .. '\\r'
        elseif char == '\t' then
            result = result .. '\\t'
        else
            local codepoint = string.byte(char)
            if codepoint < 32 or codepoint > 126 then
                result = result .. string.format("\\u%04x", codepoint)
            else
                result = result .. char
            end
        end
    end
    return result
end

local function json_unescape(str)
    local result = ""
    local i = 1
    while i <= #str do
        local char = str:sub(i, i)
        if char == '\\' then
            local next_char = str:sub(i + 1, i + 1)
            if next_char == '"' then
                result = result .. '"'
                i = i + 2
            elseif next_char == '\\' then
                result = result .. '\\'
                i = i + 2
            elseif next_char == '/' then
                result = result .. '/'
                i = i + 2
            elseif next_char == 'b' then
                result = result .. '\b'
                i = i + 2
            elseif next_char == 'f' then
                result = result .. '\f'
                i = i + 2
            elseif next_char == 'n' then
                result = result .. '\n'
                i = i + 2
            elseif next_char == 'r' then
                result = result .. '\r'
                i = i + 2
            elseif next_char == 't' then
                result = result .. '\t'
                i = i + 2
            elseif next_char == 'u' then
                local hex = str:sub(i + 2, i + 5)
                local codepoint = tonumber(hex, 16)
                result = result .. unicode_to_utf8(codepoint)
                i = i + 6
            else
                error("Invalid escape sequence in JSON string")
            end
        else
            result = result .. char
            i = i + 1
        end
    end
    return result
end

return {
    json_escape = json_escape,
    json_unescape = json_unescape
}
