FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    tar \
    curl && \
    curl -L https://github.com/portainer/portainer/releases/download/2.27.5/portainer-2.27.5-linux-amd64.tar.gz -o portainer.tar.gz && \
    tar -xzf portainer.tar.gz --strip-components=1 && \
    rm portainer.tar.gz

EXPOSE 9443

CMD /portainer --data /data
