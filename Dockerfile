# DNS Bind9 con Base Alpine
FROM alpine:latest

# Instalando Bind9
RUN apk add --update bash bind busybox-extras bind-tools && rm -rf /var/cache/apk/*

# Copiando los ficheros de configuracion
COPY ./config/* /etc/bind/
COPY ./db/db.* /var/bind/pri/

VOLUME ["/etc/bind", "/var/bind/pri"]

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

