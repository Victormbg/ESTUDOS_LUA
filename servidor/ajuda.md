# PARA PORTA 1024
sudo fuser -k 1024/tcp
sudo nginx -s stop


# LIGA O SERVIDOR
lapis serve
