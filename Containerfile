FROM docker.io/alpine:3.16.0 as downloader

ARG ZED_VERSION=1.1.0
ENV ZED_VERSION=${ZED_VERSION}

RUN wget -q https://github.com/brimdata/zed/releases/download/v${ZED_VERSION}/zed-v${ZED_VERSION}.linux-amd64.tar.gz -O zed.tar.gz \
    && tar -xf zed.tar.gz

# Throws Error: OCI runtime error: open executable: Not a directory
# But Buildah bud works fine locally
# An inspect command on the final product says /usr/local/bin
# is included in PATH config
# FROM gcr.io/distroless/static:latest

# Fall back to ol' faithful
FROM docker.io/alpine:3.16.0

COPY --from=downloader zq zed /usr/local/bin

CMD [ "zq" ]
