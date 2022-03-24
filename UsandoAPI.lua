local http_request = require("http.request");
local headers, stream = assert((http_request.new_from_uri("https://brasilapi.com.br/api/cep/v1/21073460")):go());
local body = assert(stream:get_body_as_string());
if headers:get(":status") ~= "200" then
	error(body);
end;
print(body);