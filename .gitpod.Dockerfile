# Define a imagem base como Ubuntu 20.04
FROM ubuntu:20.04

# Executa os comandos em ordem
RUN \
  # Atualiza o cache do gerenciador de pacotes e atualiza pacotes já instalados
  apt-get update && apt-get -y upgrade && \
  # Instala o software-properties-common para adicionar repositórios externos
  apt-get -y install software-properties-common && \
  # Adiciona o repositório PPA do Lua 5.4
  add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
  # Atualiza o cache novamente com o novo repositório adicionado e instala o Lua 5.4, luarocks, git e nano
  apt-get update && apt-get -y install lua5.4 luarocks git nano && \
  # Instala as dependências do Lapis usando o luarocks
  luarocks install http lua-cjson lapis && \
  # Remove o cache dos pacotes instalados para reduzir o tamanho final da imagem
  rm -rf /var/lib/apt/lists/*

# Define o diretório que será usado como volume
VOLUME ["/workspace"]

# Define o comando padrão que será executado quando o container for iniciado
CMD ["lapis", "server"]
