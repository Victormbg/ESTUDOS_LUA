# Define a imagem base como Ubuntu 20.04
FROM ubuntu:20.04

# Define o timezone padrão
ENV TZ=America/Sao_Paulo

# Define a variável de ambiente DEBIAN_FRONTEND como noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Instala as ferramentas necessárias para compilar o Lua
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential wget unzip libreadline-dev libreadline8 && \
    rm -rf /var/lib/apt/lists/*

# Instala o git
RUN apt-get update && apt-get install -y git

# Define a variável PATH incluindo o caminho para o git
ENV PATH="${PATH}:$(which git)"

# Instalação do Lua 5.3.6
RUN apt-get update && \
    apt-get install -y liblua5.3-dev && \
    # baixa o arquivo tar.gz do Lua 5.3.6
    wget https://www.lua.org/ftp/lua-5.3.6.tar.gz && \
    # extrai o conteúdo do arquivo tar.gz
    tar -xzf lua-5.3.6.tar.gz && \
    # remove o arquivo tar.gz
    rm lua-5.3.6.tar.gz && \
    # entra no diretório lua-5.3.6
    cd lua-5.3.6 && \
    # compila o Lua 5.3.6 com o diretório /usr/include/lua5.3 incluído
    make linux MYCFLAGS=-I/usr/include/lua5.3 && \
    # instala o Lua 5.3.6
    make install && \
    # sai do diretório lua-5.3.6
    cd .. && \
    # remove o diretório lua-5.3.6
    rm -rf lua-5.3.6

# Baixa o arquivo tar.gz do LuaRocks 3.9.2
RUN apt-get update && \
    wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz && \
    # extrai o conteúdo do arquivo tar.gz
    tar zxpf luarocks-3.9.2.tar.gz && \
    # entra no diretório luarocks-3.9.2
    cd luarocks-3.9.2 && \
    # configura a compilação com o diretório /usr/include/lua5.3 incluído
    ./configure --with-lua-include=/usr/include/lua5.3 && \
    # compila e instala o LuaRocks 3.9.2
    make && \
    make install && \
    # sai do diretório luarocks-3.9.2
    cd .. && \
    # remove o arquivo tar.gz e o diretório luarocks-3.9.2
    rm -rf luarocks-3.9.2.tar.gz luarocks-3.9.2

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

# Instala o openresty e o nginx sem recomendações adicionais
RUN curl -L https://openresty.org/package/pubkey.gpg | apt-key add - && \
    echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/openresty.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends openresty nginx && \
    rm -rf /var/lib/apt/lists/*

ENV LAPIS_OPENRESTY /usr/local/openresty/bin/openresty

# Define a variável de ambiente LAPIS_OPENRESTY como o caminho do openresty
ENV LAPIS_OPENRESTY /usr/local/openresty/bin/openresty

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

# Instala o pacote async, para suporte a programação assíncrona
RUN luarocks install async > /dev/null 2> /var/log/async-errors.log || true

# Instala o pacote promise-lua, para programação com Promises
RUN luarocks install promise-lua > /dev/null 2> /var/log/promise-lua-errors.log || true

# Remove arquivos desnecessários do sistema
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y

# Define o diretório que será usado como volume
VOLUME ["/workspace"]

# Define o comando padrão que será executado quando o container for iniciado
CMD ["lapis", "server"]
