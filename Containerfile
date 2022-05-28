FROM docker.io/alpine:3.16.0 as downloader

ARG ZED_VERSION=1.1.0
ENV ZED_VERSION=${ZED_VERSION}

RUN wget -q https://github.com/brimdata/zed/releases/download/v${ZED_VERSION}/zed-v${ZED_VERSION}.linux-amd64.tar.gz -O zed.tar.gz \
    && tar -xf zed.tar.gz

# Getting a stable tag was difficult
FROM gcr.io/distroless/static:latest
COPY --from=downloader zq zed /usr/local/bin
CMD [ "zq" ]
