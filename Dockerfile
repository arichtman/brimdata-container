FROM docker.io/alpine:3.17.1 as downloader

ARG ZED_VERSION=1.1.0
ENV ZED_VERSION=${ZED_VERSION}

RUN wget -q https://github.com/brimdata/zed/releases/download/v${ZED_VERSION}/zed-v${ZED_VERSION}.linux-amd64.tar.gz -O zed.tar.gz \
    && tar -xf zed.tar.gz


FROM docker.io/alpine:3.17.1

COPY --from=downloader zq zed /usr/local/bin

ENTRYPOINT [ "zq" ]
CMD [ "-" ]
