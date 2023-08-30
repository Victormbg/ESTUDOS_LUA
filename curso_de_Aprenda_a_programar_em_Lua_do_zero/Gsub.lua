local email = "teste@gmail.com"

local result = string.gsub(email, "gmail", "yahoo")

print(result)

email = "Eu tenho dois: teste@gmail.com e victor@gmail.com"

result = string.gsub(email, "gmail", "yahoo", 1)

print(result)

email = "Eu tenho dois: teste@gmail.com e victor@gmail.com"

result = string.gsub(email, " ", "_")

print(result)
