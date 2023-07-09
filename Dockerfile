# DNS Bind9 con Base Alpine
FROM alpine:latest as bind

# Instalando Bind9
RUN apk add --update bash bind && rm -rf /var/cache/apk/*

# Copiando las bases de datos
COPY ./db/db.* /var/bind/pri/

# new build
FROM alpine:latest

RUN mkdir -p /var/dns
RUN mkdir -p /var/tmp
COPY --from=bind /var/bind/pri/* /var/tmp/

VOLUME ["/var/dns"]

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

#ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/sh","-c","ls -lah /"]

