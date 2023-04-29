FROM ubuntu:20.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:marlam/lua && \
    apt-get update && apt-get -y install lua5.4 luarocks git nano && \
    luarocks install http lua-cjson lapis && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/workspace"]

CMD ["lapis", "server"]
