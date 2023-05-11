local function unicode_to_utf8(codepoint)
  if codepoint < 128 then
    return string.char(codepoint)
  elseif codepoint < 2048 then
    return string.char(192 + math.floor(codepoint / 64), 128 + codepoint % 64)
  elseif codepoint < 65536 then
    return string.char(224 + math.floor(codepoint / 4096), 128 + math.floor(codepoint / 64) % 64, 128 + codepoint % 64)
  else
    return string.char(240 + math.floor(codepoint / 262144), 128 + math.floor(codepoint / 4096) % 64,
      128 + math.floor(codepoint / 64) % 64, 128 + codepoint % 64)
  end
end

local function url_encode(str)
  str = str:gsub("\n", "\r\n")
  str = str:gsub("([^%w %-%_%.%~])",
    function(c) return string.format("%%%02X", string.byte(c)) end)
  str = str:gsub(" ", "+")
  return str
end

local function url_decode(str)
  str = str:gsub("+", " ")
  str = str:gsub("%%(%x%x)",
    function(h) return string.char(tonumber(h, 16)) end)
  str = str:gsub("\r\n", "\n")
  return str
end

local function unicode_encode(str)
  local result = ""
  for i = 1, #str do
    result = result .. unicode_to_utf8(str:byte(i))
  end
  return result
end

local function unicode_decode(str)
  local result = ""
  local i = 1
  while i <= #str do
    local c = str:sub(i, i)
    if c == "\\" and str:sub(i + 1, i + 1) == "u" then
      local hex = str:sub(i + 2, i + 5)
      local codepoint = tonumber(hex, 16)
      result = result .. utf8.char(codepoint)
      i = i + 6
    else
      result = result .. c
      i = i + 1
    end
  end
  return result
end

return {
  url_encode = url_encode,
  url_decode = url_decode,
  unicode_encode = unicode_encode,
  unicode_decode = unicode_decode,
  unicode_to_utf8 = unicode_to_utf8
}
