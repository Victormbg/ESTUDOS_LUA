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

# Atualiza o cache dos pacotes e instala o pacote lua-cjson
RUN apt-get update && apt-get install -y lua-cjson

# Instala o OpenSSL
RUN apt-get update && apt-get install -y libssl-dev

# Instala o pacote luacrypto utilizando a versão do OpenSSL instalada acima
# RUN luarocks install luacrypto 0.3.2-1 OPENSSL_DIR=/usr

# Instala o pacote lua-cjson
RUN luarocks install lua-cjson

# Instala o pacote lua-async
# RUN luarocks install lua-async

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

# Instala o pacote lapis-console, uma interface web para execução de código Lapis
RUN luarocks install lapis-console

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
