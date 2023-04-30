# Define a imagem base como Ubuntu 20.04
FROM ubuntu:20.04

# Define o timezone padrão
ENV TZ=America/Sao_Paulo

# Define a variável de ambiente DEBIAN_FRONTEND como noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Instala as ferramentas necessárias para compilar o Lua
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Instala o git
RUN apt-get update && apt-get install -y git

# Define a variável PATH incluindo o caminho para o git
ENV PATH="${PATH}:$(which git)"

RUN apt-get update && \
    apt-get install -y lua5.3 lua5.3-dev && \
    wget https://luarocks.github.io/luarocks/releases/luarocks-3.4.0.tar.gz && \
    tar zxpf luarocks-3.4.0.tar.gz && \
    cd luarocks-3.4.0 && \
    ./configure --with-lua-include=/usr/include/lua5.3 && \
    make && \
    make install && \
    cd .. && \
    rm -rf luarocks-3.4.0.tar.gz luarocks-3.4.0

# Instala o OpenSSL e o M4 (necessário para o pacote cqueues)
RUN apt-get update && apt-get install -y libssl-dev m4

# Define as variáveis de ambiente necessárias para a instalação das dependências
ENV CRYPTO_DIR=/usr/lib/
ENV CRYPTO_INCDIR=/usr/include/

# Instala as dependências do http
RUN luarocks install http

# Atualiza o cache dos pacotes e instala o pacote lua-cjson
RUN apt-get update && apt-get install -y lua-cjson

# Instala o pacote luacrypto utilizando a versão do OpenSSL instalada acima. Registra erros em /var/log/luacrypto-errors.log.
RUN luarocks search luacrypto OPENSSL_DIR=$CRYPTO_DIR OPENSSL_INCDIR=$CRYPTO_INCDIR 2> /var/log/luacrypto-search-errors.log || true && \
    luarocks install luacrypto OPENSSL_DIR=$CRYPTO_DIR OPENSSL_INCDIR=$CRYPTO_INCDIR 2> /var/log/luacrypto-install-errors.log || true

# Instala o pacote lua-cjson
RUN luarocks install lua-cjson

# Instala o pacote lua-async para permitir programação assíncrona no Lua.
# Se a instalação falhar, o comando "true" garante que a build continue
# e os erros serão redirecionados para um arquivo de log.
RUN luarocks search lua-async 2> /var/log/lua-async-errors.log || true && \
    luarocks install lua-async 2>> /var/log/lua-async-errors.log || true

# Instala o framework web Lapis
RUN luarocks install lapis

# Instala a linguagem de programação MoonScript, utilizada pelo Lapis
RUN luarocks install moonscript

# Instala o pacote bcrypt, para a criptografia de senhas
RUN luarocks install bcrypt

# Instala o pacote luasec, para conexões HTTPS
RUN luarocks install luasec

# Instala o pacote lua-term, para trabalhar com terminais
RUN luarocks install lua-term

# Instala o pacote dkjson, para a manipulação de arquivos JSON
RUN luarocks install dkjson

# Instala o pacote lapis-migrate para gerenciamento de migrações de banco de dados no Lapis, se disponível para a versão 5.4 do Lua. Registra erros em /var/log/lapis-migrate-errors.log
RUN luarocks search lapis-migrate 2> /var/log/lapis-migrate-errors.log || true && \
    luarocks install lapis-migrate 2> /var/log/lapis-migrate-errors.log || true

# Instala o pacote inspect, para inspecionar e manipular objetos em Lua
RUN luarocks install inspect

# Instala o pacote penlight, uma biblioteca utilitária para Lua
RUN luarocks install penlight

RUN luarocks install luasocket 2> /var/log/luasocket-errors.log || true && \
    luarocks install lua-async-await 2> /var/log/lua-async-await-errors.log || true && \
    luarocks install luapromise 2> /var/log/luapromise-errors.log || true

# Remove arquivos desnecessários do sistema
RUN rm -rf /var/lib/apt/lists/*

# Define o diretório que será usado como volume
VOLUME ["/workspace"]

# Define o comando padrão que será executado quando o container for iniciado
CMD ["lapis", "server"]
