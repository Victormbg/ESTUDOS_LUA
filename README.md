# Introdução
Este é um projeto em Lua que utiliza o gerenciador de pacotes LuaRocks para instalar suas dependências. Antes de prosseguir com a instalação, é importante entender um pouco sobre o que é Lua e LuaRocks.

## O que é Lua?
Lua é uma linguagem de programação leve, poderosa e eficiente, projetada para estender aplicativos. Lua é frequentemente usada em jogos, aplicações de desktop, dispositivos móveis, entre outras aplicações.

Criada em 1993 por uma equipe de programadores da PUC-Rio, Lua é uma linguagem de programação livre, de código aberto e distribuída sob a licença MIT.

- Comando para rodar programa: lua

- https://www.lua.org/

## O que é LuaRocks?
LuaRocks é um gerenciador de pacotes para a linguagem Lua, que facilita a instalação e gerenciamento de módulos e bibliotecas escritas em Lua.

O LuaRocks permite que você instale, remova e gerencie facilmente pacotes Lua em seu sistema. Ele também possui um sistema de dependências que permite que você instale automaticamente todas as bibliotecas necessárias para um determinado pacote.

Ao usar o LuaRocks em seu projeto, você pode economizar tempo e esforço ao instalar e gerenciar as dependências de seu projeto, o que torna o processo de desenvolvimento mais fácil e eficiente

- Comando para rodar programa: luarocks

- https://luarocks.org/

## O que é LuaJIT?
LuaJIT é uma implementação Just-In-Time (JIT) da linguagem de programação Lua. A implementação JIT permite que o LuaJIT execute código Lua em tempo de execução, compilando-o em código de máquina nativo para obter desempenho mais rápido do que a interpretação tradicional do código.

LuaJIT é especialmente conhecido por seu desempenho superior, em comparação com outras implementações de Lua e muitas outras linguagens de script. É comumente usado para aplicativos que exigem alto desempenho, como jogos, servidores web e outras aplicações de tempo real.

Além de ser mais rápido, o LuaJIT também oferece recursos adicionais em relação à implementação padrão da linguagem Lua, como manipulação direta de ponteiros e acesso a bibliotecas C. Isso torna o LuaJIT uma escolha popular para aplicativos que exigem baixa latência e alto desempenho, além de integração com outras bibliotecas e sistemas.

- Comando para rodar programa: luajit

- https://luajit.org/

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

# Instalar Lua e LuaRocks no Windows:

1. Primeiro instala o tdm64-gcc no site: https://jmeubank.github.io/tdm-gcc/. (TDM-GCC é um compilador C/C++ para Windows que inclui as bibliotecas padrão do GNU. É uma implementação do GCC (GNU Compiler Collection) para Windows 32 e 64 bits.)

2. Entra no site do https://www.lua.org/, baixa a versão que preferir (recomendo lua 5.3.6 por compatibilidade com varias bibliotecas do luarocks):

3. Ao baixar o lua-5.3.6.tar.gz, usa o 7ZIP e descompacta ele.

4. Depois vai criar um arquivo chamado build.cmd
`
        @echo off
        :: ========================
        :: file build.cmd
        :: ========================
        setlocal
        :: you may change the following variable's value
        :: to suit the downloaded version
        set lua_version=5.3.6
        
        set work_dir=%~dp0
        :: Removes trailing backslash
        :: to enhance readability in the following steps
        set work_dir=%work_dir:~0,-1%
        set lua_install_dir=%work_dir%\lua
        set compiler_bin_dir=%work_dir%\tdm-gcc\bin
        set lua_build_dir=%work_dir%\lua-%lua_version%
        set path=%compiler_bin_dir%;%path%
        
        cd /D %lua_build_dir%
        mingw32-make PLAT=mingw
        
        echo.
        echo **** COMPILATION TERMINATED ****
        echo.
        echo **** BUILDING BINARY DISTRIBUTION ****
        echo.
        
        :: create a clean "binary" installation
        mkdir %lua_install_dir%
        mkdir %lua_install_dir%\doc
        mkdir %lua_install_dir%\bin
        mkdir %lua_install_dir%\include
        
        copy %lua_build_dir%\doc\*.* %lua_install_dir%\doc\*.*
        copy %lua_build_dir%\src\*.exe %lua_install_dir%\bin\*.*
        copy %lua_build_dir%\src\*.dll %lua_install_dir%\bin\*.*
        copy %lua_build_dir%\src\luaconf.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lua.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lualib.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lauxlib.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lua.hpp %lua_install_dir%\include\*.*
        
        echo.
        echo **** BINARY DISTRIBUTION BUILT ****
        echo.
        
        %lua_install_dir%\bin\lua.exe -e"print [[Hello!]];print[[Simple Lua test successful!!!]]"
        
        echo.
        
        pause

5. Depois ele ira criar uma pasta chamada lua, ai renomeia para Lua e move para ficar assim "C:\Program Files (x86)\Lua".

6. Depois instala o https://github.com/luarocks/luarocks/wiki/Download, eu baixei a versão mais recente luarocks-3.9.2-windows-64.zip

7. Descompacta o ZIP, usando o 7ZIP. Depois renomei a pasta para LuaRocks

8. Move a pasta LuaRocks até ela ficar assim: "C:\Program Files (x86)\LuaRocks"

9. O comando luarocks config --local lua_dir "C:\Program Files (x86)\Lua" define a variável lua_dir no arquivo de configuração local do Luarocks, especificando o caminho para a instalação do Lua. O argumento --local indica que a configuração deve ser feita apenas para o usuário atual e para a aplicação atual. O valor C:\Program Files (x86)\Lua é o caminho para o diretório onde o Lua está instalado. Essa informação é importante para que o Lurorocks possa encontrar as bibliotecas Lua durante a instalação de pacotes e também para que possa instalar pacotes na instalação do Lua especificada.:
- luarocks config --local lua_dir "C:\Program Files (x86)\Lua"


10. Depois vamos configurar o LUA_CPATH e LUA_PATH que são variáveis de ambiente usadas pelo interpretador Lua para encontrar módulos e arquivos de bibliotecas compartilhadas.

    LUA_CPATH é uma variável que contém um conjunto de caminhos separados por ';' (no Windows) ou ':' (no Linux e Mac), que o interpretador Lua irá percorrer para encontrar bibliotecas compartilhadas (arquivos .dll, .so ou .dylib) que contêm funções C usadas pelos módulos Lua.

    LUA_PATH é uma variável que contém um conjunto de caminhos separados por ';' (no Windows) ou ':' (no Linux e Mac), que o interpretador Lua irá percorrer para encontrar módulos Lua. Os arquivos de módulo devem ter a extensão ".lua" e podem estar organizados em subdiretórios.

10.1. Abra o prompt de comando:

- No Windows 10, você pode pressionar a tecla Win + R, digitar cmd e pressionar Enter.
- Em versões anteriores do Windows, você pode abrir o menu Iniciar, selecionar Executar, digitar cmd e pressionar Enter.

10.2. Digite os seguintes comandos no prompt de comando e pressione Enter depois de cada linha:

`
setx LUA_CPATH "C:\Users\victo\AppData\Roaming\luarocks\lib\lua\5.3\?.dll"
`

`
setx LUA_PATH "C:\Users\victo\AppData\Roaming\luarocks\share\lua\5.3\?.lua"
`

- O comando setx é usado para definir variáveis de ambiente permanentes.
Certifique-se de substituir C:\Users\victo pelo caminho para o seu perfil de usuário, se necessário.

10.3. Feche e reabra o prompt de comando para que as alterações tenham efeito.