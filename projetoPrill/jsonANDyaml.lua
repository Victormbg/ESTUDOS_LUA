local json = require("dkjson")
local yaml = require("lyaml")

function jsonToYaml(jsonString)
  -- convert json to lua table
  local luaTable = json.decode(jsonString, 1, nil)

  -- convert lua table to yaml string
  local yamlString = yaml.dump(luaTable)

  return yamlString
end

function yamlToJson(yamlString)
  local luaTable = yaml.load(yamlString)
  if not luaTable then
    error("Invalid YAML input")
  end
  local jsonString = json.encode(luaTable)
  return jsonString
end

return {
    jsonToYaml = jsonToYaml,
    yamlToJson = yamlToJson
}
