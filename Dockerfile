# DNS Bind9 con Base Alpine
FROM alpine:latest

# Instalando Bind9
RUN apk add --update bash bind busybox-extras bind-tools rsyslog tzdata supervisor dnstop && rm -rf /var/cache/apk/*

# Copiando los ficheros de configuracion
COPY ./config/* /etc/bind/
RUN mkdir -p /var/tmp
COPY ./db/db.* /var/tmp/

# incorporando la zona horaria de Cuba
RUN  cp /usr/share/zoneinfo/Cuba /etc/localtime

# Exponiendo el puerto 53
EXPOSE 53/tcp 53/udp

VOLUME ["/etc/bind", "/var/bind/pri"]

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["sh","-c","/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf"]

        image: borisruiz87/alpine-dns:1.23-904efc3295efb0fff6725dda565c11fb42adc002
