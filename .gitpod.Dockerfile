FROM ubuntu:20.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y lua5.4 luarocks git nano

RUN luarocks install http lua-cjson lapis && rm -rf /var/lib/apt/lists/*

VOLUME ["/workspace"]

CMD ["lapis", "server"]
