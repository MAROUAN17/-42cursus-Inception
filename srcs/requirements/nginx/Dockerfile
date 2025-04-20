FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]