# Define a imagem base como Ubuntu 20.04
FROM ubuntu:20.04

# Define o timezone padrão
ENV TZ=America/Sao_Paulo

# Define a variável de ambiente DEBIAN_FRONTEND como noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Instala as ferramentas necessárias para compilar o Lua
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential curl && \
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

# Instala o luarocks, git e nano
RUN apt-get update && apt-get -y install luarocks git nano libssl-dev && \
    rm -rf /var/lib/apt/lists/*
    
# Instala as dependências do http
RUN luarocks install http

RUN apt-get update && apt-get install -y lua-cjson

# Instala as dependências do Lapis
RUN luarocks install lua-cjson lapis && \
    luarocks install lua-async && \
    luarocks install cjson-safe && \
    rm -rf /var/lib/apt/lists/*

# Define o diretório que será usado como volume
VOLUME ["/workspace"]

# Define o comando padrão que será executado quando o container for iniciado
CMD ["lapis", "server"]
