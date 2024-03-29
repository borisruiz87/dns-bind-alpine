# DNS Bind9 con Base Alpine
FROM alpine:3.19.1

# Instalando Bind9
RUN apk add --update bash bind busybox-extras bind-tools rsyslog tzdata supervisor dnstop && rm -rf /var/cache/apk/*

# Copiando los ficheros de configuracion
COPY ./config/* /etc/bind/
COPY ./db/db.* /var/bind/pri/

# incorporando la zona horaria de Cuba
RUN  cp /usr/share/zoneinfo/Cuba /etc/localtime

# Exponiendo el puerto 53
EXPOSE 53/tcp 53/udp

VOLUME ["/etc/bind", "/var/bind/"]

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["sh","-c","/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf"]
