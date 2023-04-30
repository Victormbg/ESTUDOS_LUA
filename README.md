# Introdução
Este é um projeto em Lua que utiliza o gerenciador de pacotes LuaRocks para instalar suas dependências. Antes de prosseguir com a instalação, é importante entender um pouco sobre o que é Lua e LuaRocks.

## O que é Lua?
Lua é uma linguagem de programação leve, poderosa e eficiente, projetada para estender aplicativos. Lua é frequentemente usada em jogos, aplicações de desktop, dispositivos móveis, entre outras aplicações.

Criada em 1993 por uma equipe de programadores da PUC-Rio, Lua é uma linguagem de programação livre, de código aberto e distribuída sob a licença MIT.

- https://www.lua.org/

## O que é LuaRocks?
LuaRocks é um gerenciador de pacotes para a linguagem Lua, que facilita a instalação e gerenciamento de módulos e bibliotecas escritas em Lua.

O LuaRocks permite que você instale, remova e gerencie facilmente pacotes Lua em seu sistema. Ele também possui um sistema de dependências que permite que você instale automaticamente todas as bibliotecas necessárias para um determinado pacote.

Ao usar o LuaRocks em seu projeto, você pode economizar tempo e esforço ao instalar e gerenciar as dependências de seu projeto, o que torna o processo de desenvolvimento mais fácil e eficiente

- https://luarocks.org/

## Versão do Lua e LuaRocks
Este projeto tem um Dockerfile que instala o Lua 5.3.6 e o LuaRocks 3.4.0 no Ubuntu 20.04.

## Motivo para usar essas versões
A razão para usar essas versões específicas é que a versão mais recente do Lua 5.4 não funcionou bem com muitas bibliotecas que ainda não eram compatíveis com ele.

## Utilizando o Gitpod
Este projeto pode ser facilmente executado no Gitpod, um ambiente de desenvolvimento baseado em nuvem. Clique no botão abaixo para abrir este projeto no Gitpod:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/Victormbg/Projetos-com-LUA)

## Bibliotecas instaladas
As seguintes bibliotecas são instaladas:

- alt-getopt: Uma biblioteca para análise de linha de comando que oferece uma alternativa para a biblioteca padrão do Lua getopt.

- ansicolors: Uma biblioteca que adiciona suporte a cores ANSI a impressão de texto no terminal.

- argparse: Uma biblioteca para análise de linha de comando, com suporte a opções e argumentos com valores opcionais e padrões.

- basexx: Uma biblioteca que fornece funções para codificar e decodificar dados em formatos comuns, como base64 e hexadecimal.

- bcrypt: Uma biblioteca para criptografia de senhas com o algoritmo bcrypt.

- binaryheap: Uma biblioteca que implementa uma heap binária.

- bit32: Uma biblioteca que fornece operações de bit a bit compatíveis com o Lua 5.2 em versões posteriores do Lua.

- compat53: Uma biblioteca que oferece suporte às funcionalidades do Lua 5.3 em versões anteriores do Lua.

- cqueues: Uma biblioteca que fornece suporte para I/O assíncrono, baseado em corrotinas.

- date: Uma biblioteca para manipulação de datas e horários.

- dkjson: Uma biblioteca para codificar e decodificar dados em formato JSON.

- etlua: Uma biblioteca que oferece suporte a templates em Lua.

- fifo: Uma biblioteca que implementa uma fila.

- http: Uma biblioteca para realizar requisições HTTP.

- inspect: Uma biblioteca para inspecionar tabelas em Lua.

- lapis: Um framework web para Lua baseado em OpenResty.

- loadkit: Uma biblioteca que fornece funcionalidades para carregamento de módulos em Lua.

- lpeg: Uma biblioteca para análise de padrões baseada em gramáticas.

- lpeg_patterns: Uma biblioteca que fornece padrões adicionais para serem usados com a biblioteca LPEG.

- lua-cjson: Uma biblioteca para codificar e decodificar dados em formato JSON.

- lua-term: Uma biblioteca para manipulação de terminais.

- luafilesystem: Uma biblioteca para manipulação de arquivos e diretórios.

- luaossl: Uma biblioteca para criptografia em SSL/TLS.

- luasec: Uma biblioteca para comunicação segura em rede.

- luasocket: Uma biblioteca para comunicação de rede.

- moonscript: Uma linguagem de programação que compila para Lua.

- penlight: Uma biblioteca que fornece diversas funcionalidades úteis, como manipulação de tabelas e strings.

- pgmoon: Uma biblioteca para interagir com bancos de dados PostgreSQL.

- promise-lua: Uma biblioteca que fornece suporte para programação assíncrona baseada em promessas.

Observe que algumas dessas bibliotecas dependem de outras bibliotecas, que são instaladas automaticamente pelo LuaRocks.

Adicionalmente, o OpenSSL e o M4 são instalados para suportar a instalação de algumas das bibliotecas, e o fuso horário é definido para America/Sao_Paulo.

# Erros na Build
Em caso de erro na build, consulte o arquivo de log correspondente com o comando:
- ls /var/log
- cat /var/log/nome_arquivo.log

# WINLUA - Instalador de Lua para Windows
http://winlua.net/
