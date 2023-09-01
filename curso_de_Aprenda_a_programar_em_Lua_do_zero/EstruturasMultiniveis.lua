local key = "color"

local map = {[key] = "blue", [10] = "red"}

print(map[10])
print(map.color)

local config = {
    screnn = {width = 800, height = 600, color = {number = 160000}},
    keyboard = {language = "pt-BR"}
}

print(config.screnn.width)
print(config.screnn.height)
print(config["screnn"]["color"]["number"])
print(config.keyboard.language)
