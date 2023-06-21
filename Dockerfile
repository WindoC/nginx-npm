# FROM nginx:latest
FROM ubuntu:22.04

COPY rootfs/ /

# RUN mkdir -p /tmp/nginx/body /var/lib/nginx/cache /data/logs \
#  && mkdir -p /etc/letsencrypt/live/placeholder /data/nginx/placeholder /data/custom_ssl/placeholder \
#  && find /etc/nginx -type d -exec chmod 755 {} \; \
#  && find /etc/nginx -type f -exec chmod 644 {} \; \
#  && chmod 755 /docker-entrypoint.d/99-dynamic_resolvers.sh /bin/nginx_auto_reload.sh
