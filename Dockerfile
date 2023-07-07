# DNS Bind9 con Base Alpine
FROM alpine:latest as bind

# Instalando Bind9
RUN apk add bash bind && rm -rf /var/cache/apk/*

# Copiando los ficheros de configuracion
# COPY ./config/* /etc/bind/
COPY ./db/db.* /var/bind/pri/
RUN mkdir -p /var/dns
# COPY --from=bind /var/bind/pri/* /var/tmp/

VOLUME ["/var/dns"]

RUN chmod 755 /var/tmp/entrypoint.sh

ENTRYPOINT ["sh","-c","/var/tmp/entrypoint.sh"]

