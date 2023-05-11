# Define a imagem base como Ubuntu 23.04
FROM ubuntu:23.04

# Define o timezone padrão
ENV TZ=America/Sao_Paulo

# Define a variável de ambiente DEBIAN_FRONTEND como noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*

# Instala as ferramentas necessárias para compilar o Lua
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install unzip libreadline-dev libreadline8 wget tree lua5.4 liblua5.4-0 liblua5.4-dev liblua5.4-0-dbg libtool-bin pkg-config libc6 libc6-dev && \
    rm -rf /var/lib/apt/lists/*

# Instala bibliotecas gráficas necessárias para a execução do Love2D - AINDA NÃO FUNCIONANDO
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install libdevil-dev libxcursor-dev libxi-dev libxinerama-dev libxrandr-dev libxxf86vm-dev libopenal-dev libalut-dev libvorbis-dev libphysfs-dev && \
    rm -rf /var/lib/apt/lists/*

# Instala o git
RUN apt-get update && apt-get install -y git

# Define a variável PATH incluindo o caminho para o git
ENV PATH="${PATH}:$(which git)"

# Instalação do Lua 5.4.4
RUN apt-get update && \
    apt-get install -y build-essential && \
    # baixa o arquivo tar.gz do Lua 5.4.4
    wget https://www.lua.org/ftp/lua-5.4.4.tar.gz && \
    # extrai o conteúdo do arquivo tar.gz
    tar -xzf lua-5.4.4.tar.gz && \
    # remove o arquivo tar.gz
    rm lua-5.4.4.tar.gz && \
    # entra no diretório lua-5.4.4
    cd lua-5.4.4 && \
    # compila o Lua 5.4.4
    make linux && \
    # instala o Lua 5.4.4
    make install && \
    # sai do diretório lua-5.4.4
    cd .. && \
    # remove o diretório lua-5.4.4
    rm -rf lua-5.4.4 && \
    apt-get autoremove -y && \
    apt-get clean

# Adiciona as variáveis de ambiente LUA_PATH e LUA_CPATH
ENV LUA_PATH="/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;;"
ENV LUA_CPATH="/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;;"

# Instalação do LuaRocks 3.9.2
RUN apt-get update && \
    wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz && \
    # extrai o conteúdo do arquivo tar.gz
    tar zxpf luarocks-3.9.2.tar.gz && \
    # entra no diretório luarocks-3.9.2
    cd luarocks-3.9.2 && \
    # configura a compilação com a detecção automática do Lua
    ./configure --with-lua-include=/usr/local/include && \
    # compila e instala o LuaRocks 3.9.2
    make && \
    make install && \
    # sai do diretório luarocks-3.9.2
    cd .. && \
    # remove o arquivo tar.gz e o diretório luarocks-3.9.2
    rm -rf luarocks-3.9.2.tar.gz luarocks-3.9.2

# Instala o LuaJIT
RUN apt-get update && apt-get install -y luajit libpcre3-dev

# Instala o OpenSSL e o M4 (necessário para o pacote cqueues)
RUN apt-get update && apt-get install -y libssl-dev m4

# Define as variáveis de ambiente necessárias para a instalação das dependências
ENV CRYPTO_DIR=/usr/lib/
ENV CRYPTO_INCDIR=/usr/include/

# Instala o pacote luacrypto utilizando a versão do OpenSSL instalada acima. Registra erros em /var/log/luacrypto-errors.log.
RUN luarocks search luacrypto OPENSSL_DIR=$CRYPTO_DIR OPENSSL_INCDIR=$CRYPTO_INCDIR > /dev/null 2> /var/log/luacrypto-search-errors.log || true && \
    luarocks install luacrypto OPENSSL_DIR=$CRYPTO_DIR OPENSSL_INCDIR=$CRYPTO_INCDIR > /dev/null 2> /var/log/luacrypto-install-errors.log || true

RUN apt-get update && \
    apt-get install -y --no-install-recommends libpcre3-dev libssl-dev perl make build-essential curl && \
    rm -rf /var/lib/apt/lists/*

# Instala dependências necessárias para compilar o LuaGL
RUN sudo apt-get update && \
    sudo apt-get install -y build-essential libgl1-mesa-dev freeglut3-dev libgirepository1.0-dev software-properties-common gobject-introspection

# Baixando e instalando o CD
# RUN curl -L https://sourceforge.net/projects/canvasdraw/files/5.14/Linux%20Libraries/cd-5.14_Linux50_64_lib.tar.gz -o cd-5.14_Linux50_64_lib.tar.gz \
#     && tar -xzvf cd-5.14_Linux50_64_lib.tar.gz --no-same-owner \
#     && ls \
#     && cd cd-5.14_Linux50_64_lib \
#     && sudo cp -r include/* /usr/local/include/ \
#     && sudo cp -r ftgl/lib/Linux50_64/* /usr/local/lib/ \
#     && cd ..

# Baixando e instalando o IUP
# RUN curl -L https://sourceforge.net/projects/iup/files/3.30/Linux%20Libraries/iup-3.30_Linux54_64_lib.tar.gz -o iup-3.30.tar.gz \
#     && tar -xzvf iup-3.30.tar.gz \
#     && cd iup-3.30_Linux54_64_lib \
#     && sudo cp -r include/* /usr/local/include/ \
#     && sudo cp -r lib/* /usr/local/lib/ \
#     && cd ..

# Instala a biblioteca LuaGL
RUN luarocks install opengl

# Instala a biblioteca LuaGL
RUN luarocks install lua-gl

# Instala a biblioteca lgi
RUN luarocks install lgi

# Instala o Love2D
RUN add-apt-repository -y ppa:bartbes/love-stable && \
    apt-get update && \
    apt-get install -y love

# Instala o openresty e o nginx sem recomendações adicionais
RUN apt-get update && \
    apt-get install -y lsb-release && \
    curl -L https://openresty.org/package/pubkey.gpg | apt-key add - && \
    echo "deb http://openresty.org/package/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/openresty.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends openresty nginx lsof && \
    rm -rf /var/lib/apt/lists/*

# Define a variável de ambiente LAPIS_OPENRESTY como o caminho do openresty
ENV LAPIS_OPENRESTY /usr/local/openresty/bin/openresty

# Instala o libyaml-dev usado pelo lyaml
RUN apt-get update && apt-get install -y libyaml-dev

# Instala o lyaml do LuaRocks
RUN luarocks install lyaml

# Instala o pacote http do LuaRocks que será utilizado posteriormente
RUN luarocks install http > /dev/null 2> /var/log/http-errors.log || true

# Instala o pacote lua-cjson para trabalhar com JSON
RUN luarocks install lua-cjson > /dev/null 2> /var/log/lua-cjson-errors.log || true

# Instala o framework web Lapis
RUN luarocks install lapis > /dev/null 2> /var/log/lapis-errors.log || true

# Instala a linguagem de programação MoonScript, utilizada pelo Lapis
RUN luarocks install moonscript > /dev/null 2> /var/log/moonscript-errors.log || true

# Instala o pacote bcrypt, para a criptografia de senhas
RUN luarocks install bcrypt > /dev/null 2> /var/log/bcrypt-errors.log || true

# Instala o pacote luasec, para conexões HTTPS
RUN luarocks install luasec > /dev/null 2> /var/log/luasec-errors.log || true

# Instala o pacote lua-term, para trabalhar com terminais
RUN luarocks install lua-term > /dev/null 2> /var/log/lua-term-errors.log || true

# Instala o pacote dkjson, para a manipulação de arquivos JSON
RUN luarocks install dkjson > /dev/null 2> /var/log/dkjson-errors.log || true

# Instala o pacote lapis-console, para adicionar console interativo ao Lapis
RUN luarocks install lapis-console > /dev/null 2> /var/log/lapis-console-errors.log || true

# Instala o pacote inspect, para inspecionar e manipular objetos em Lua
RUN luarocks install inspect > /dev/null 2> /var/log/inspect-errors.log || true

# Instala o pacote penlight, uma biblioteca utilitária para Lua
RUN luarocks install penlight > /dev/null 2> /var/log/penlight-errors.log || true

# Instala o pacote luasocket, para conexões de rede
RUN luarocks install luasocket > /dev/null 2> /var/log/luasocket-errors.log || true

# Instala o pacote Love para desenvolvimento de jogos em Lua, utilizado pelo async
RUN luarocks install love > /dev/null 2> /var/log/async-errors.log || true

# Instala o pacote async, para suporte a programação assíncrona
RUN luarocks install async > /dev/null 2> /var/log/async-errors.log || true

# Instala o pacote promise-lua, para programação com Promises
RUN luarocks install promise-lua > /dev/null 2> /var/log/promise-lua-errors.log || true

# Instala o pacotelpeg, para programação com Promises
RUN luarocks install lpeg > /dev/null 2> /var/log/lpeg-errors.log || true

# Instala dependencias para IA
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install cmake && \
    rm -rf /var/lib/apt/lists/*

# Instala o cwrap do torch
RUN git clone https://github.com/torch/cwrap.git \
    && cd cwrap \
    && luarocks make rocks/cwrap-scm-1.rockspec

# Instala o path do torch
RUN luarocks install --server=https://luarocks.org/dev paths > /dev/null 2> /var/log/paths-errors.log || true

# Instala o torch do torch
RUN luarocks install --server=https://luarocks.org/dev torch > /dev/null 2> /var/log/torch-errors.log || true

# Remove arquivos desnecessários do sistema
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y

# Define o diretório que será usado como volume
VOLUME ["/workspace"]
