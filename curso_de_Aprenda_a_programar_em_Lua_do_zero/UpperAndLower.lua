local text = "TesTe"
-- Pega o total da string
local first = string.sub(text, 1, 1)
-- Cortando a string
local last = string.sub(text, 2, #text)

print(
    string.upper(first) ..
    string.lower(last)
)

print(string.upper(first))

print(string.lower(last))
