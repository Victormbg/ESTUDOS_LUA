local hexTOtext = {}

-- helper function to convert a hex digit to its decimal representation
local function hexDigitToDecimal(digit)
  if digit >= '0' and digit <= '9' then
    return digit:byte() - 48 -- ASCII code of '0'
  elseif digit >= 'A' and digit <= 'F' then
    return digit:byte() - 55 -- ASCII code of 'A'
  elseif digit >= 'a' and digit <= 'f' then
    return digit:byte() - 87 -- ASCII code of 'a'
  else
    error("Invalid hex digit: " .. digit)
  end
end

-- decoding
function hexTOtext.dec(data)
  data = data:gsub("%s+", "") -- remove whitespace
  if #data % 2 ~= 0 then
    error("Invalid hex string length")
  end

  local result = ""
  for i = 1, #data, 2 do
    local byte = hexDigitToDecimal(data:sub(i, i)) * 16 + hexDigitToDecimal(data:sub(i + 1, i + 1))
    result = result .. string.char(byte)
  end

  return result
end

return hexTOtext
