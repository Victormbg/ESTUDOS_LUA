# Define a imagem base como Ubuntu 20.04
FROM ubuntu:20.04

# Define o timezone padrão
ENV TZ=America/Sao_Paulo

# Define a variável de ambiente DEBIAN_FRONTEND como noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Instala as ferramentas necessárias para compilar o Lua
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Baixa o arquivo do Lua e descompacta-o
RUN curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz && \
    tar zxf lua-5.4.4.tar.gz && \
    rm lua-5.4.4.tar.gz && \
    cd lua-5.4.4 && \
    # Compila o Lua com as opções padrão
    make linux test && \
    make install && \
    cd .. && \
    rm -rf lua-5.4.4

# Baixa o arquivo do luarocks e descompacta-o
RUN curl -R -O https://luarocks.github.io/luarocks/releases/luarocks-3.9.2.tar.gz && \
    tar zxvf luarocks-3.9.2.tar.gz && \
    rm luarocks-3.9.2.tar.gz && \
    cd luarocks-3.9.2 && \
    # Configura a compilação com as opções padrão
    ./configure && \
    make build && \
    make install && \
    cd .. && \
    rm -rf luarocks-3.9.2

# Instala o OpenSSL e o M4 (necessário para o pacote cqueues)
RUN apt-get update && apt-get install -y libssl-dev m4

# Define as variáveis de ambiente necessárias para a instalação das dependências
ENV CRYPTO_DIR=/usr/lib/
ENV CRYPTO_INCDIR=/usr/include/

# Instala as dependências do http
RUN luarocks install http

# Atualiza o cache dos pacotes e instala o pacote lua-cjson
RUN apt-get update && apt-get install -y lua-cjson

# Instala o pacote luacrypto utilizando a versão do OpenSSL instalada acima
# RUN luarocks install luacrypto 0.3.2-1 OPENSSL_DIR=/usr

# Instala o pacote lua-cjson
RUN luarocks install lua-cjson

# Instala o pacote lua-async para permitir programação assíncrona no Lua. Se a instalação falhar, tente adicionar --lua-version=5.4 no final do comando.
RUN luarocks search lua-async --lua-version=5.4 && \
    luarocks install lua-async --lua-version=5.4

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

# Instala o pacote lapis-migrate para gerenciamento de migrações de banco de dados no Lapis, se disponível para a versão 5.4 do Lua
RUN luarocks search lapis-migrate --lua-version=5.4 && \
    luarocks install lapis-migrate --lua-version=5.4

# Instala o pacote inspect, para inspecionar e manipular objetos em Lua
RUN luarocks install inspect

# Instala o pacote penlight, uma biblioteca utilitária para Lua
RUN luarocks install penlight

# Remove arquivos desnecessários do sistema
RUN rm -rf /var/lib/apt/lists/*
    
# Define o diretório que será usado como volume
VOLUME ["/workspace"]

# Define o comando padrão que será executado quando o container for iniciado
CMD ["lapis", "server"]
