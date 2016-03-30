FROM alpine

# Install bash, curl
RUN apk add --update bash curl && rm -rf /var/cache/apk/*

WORKDIR /
RUN curl -L  https://github.com/coreos/etcd/releases/download/v2.3.0/etcd-v2.3.0-linux-amd64.tar.gz -o etcd-v2.3.0-linux-amd64.tar.gz && \
    tar xzvf etcd-v2.3.0-linux-amd64.tar.gz

WORKDIR /etcd-v2.3.0-linux-amd64

EXPOSE 2379
CMD ["./etcd", "-listen-client-urls", "http://0.0.0.0:2379", "-advertise-client-urls", "http://127.0.0.1:2379"]
