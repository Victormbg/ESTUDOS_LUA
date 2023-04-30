# ESTUDOS_LUA
## Versão do Lua e LuaRocks
Este projeto tem um Dockerfile que instala o Lua 5.3.6 e o LuaRocks 3.4.0 no Ubuntu 20.04.

## Motivo para usar essas versões
A razão para usar essas versões específicas é que a versão mais recente do Lua 5.4 não funcionou bem com muitas bibliotecas que ainda não eram compatíveis com ele.

## Utilizando o Gitpod
Este projeto pode ser facilmente executado no Gitpod, um ambiente de desenvolvimento baseado em nuvem. Clique no botão abaixo para abrir este projeto no Gitpod:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/Victormbg/Projetos-com-LUA)

## Bibliotecas instaladas
As seguintes bibliotecas são instaladas:
- http
- lua-cjson
- luacrypto
- lua-async
- lapis
- moonscript
- bcrypt

Observe que algumas dessas bibliotecas dependem de outras bibliotecas, que são instaladas automaticamente pelo LuaRocks.

Adicionalmente, o OpenSSL e o M4 são instalados para suportar a instalação de algumas das bibliotecas, e o fuso horário é definido para America/Sao_Paulo.

# Erros na Build
Em caso de erro na build, consulte o arquivo de log correspondente com o comando:
- ls /var/log
- cat /var/log/nome_arquivo.log

# LuaRocks - The package manager for Lua
https://luarocks.org/

# WINLUA - Instalador de Lua para Windows
http://winlua.net/
