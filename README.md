# nginx

nginx prepare for working with Nginx Proxy Manager (NPM) together.

## debug

```bash
docker build -t nginx-npm .

# test run
docker run -it --rm nginx-npm
```

## Stack config

```yml
version: "3.7"

volumes:

  data:

  letsencrypt:

networks:

  host:
    external:
      name: "host"

services:

  manager:
    image: jc21/nginx-proxy-manager:latest
    ports:
     - '81:81'
    environment:
      TZ: Asia/Hong_Kong
    volumes:
      - data:/data
      - letsencrypt:/etc/letsencrypt
    deploy:
      mode: replicated
      replicas: 1
      restart_policy:
        condition: on-failure
    logging:
      options:
        max-size: "10m"
        max-file: "3"

  worker:
    image: windoac/nginx-npm:latest
    networks:
      - host
    environment:
      TZ: Asia/Hong_Kong
    volumes:
      - data:/data
      - letsencrypt:/etc/letsencrypt
    deploy:
      #mode: global
      mode: replicated
      replicas: 1
      restart_policy:
        condition: on-failure
    logging:
      options:
        max-size: "10m"
        max-file: "3"

```
