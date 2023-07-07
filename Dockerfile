# DNS Bind9 con Base Alpine
FROM alpine:latest as bind

# Instalando Bind9
RUN apk add --update bash bind && rm -rf /var/cache/apk/*

# Copiando los ficheros de configuracion
# COPY ./config/* /etc/bind/
COPY ./db/db.* /var/bind/pri/
RUN mkdir -p /var/dns
# COPY --from=bind /var/bind/pri/* /var/tmp/

VOLUME ["/var/dns"]

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

