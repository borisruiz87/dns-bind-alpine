# DNS Bind9 con Base Alpine
FROM alpine:latest

# Instalando Bind9
RUN apk add --update bash bind tzdata && rm -rf /var/cache/apk/*

USER root

# Copiando los ficheros de configuracion
COPY ./config/* /etc/bind/
COPY ./db/db.* /var/bind/pri/

# incorporando la zona horaria de Cuba
RUN  cp /usr/share/zoneinfo/Cuba /etc/localtime

# Exponiendo el puerto 53
EXPOSE 53/tcp 53/udp

VOLUME ["/etc/bind", "/var/bind/"]

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

