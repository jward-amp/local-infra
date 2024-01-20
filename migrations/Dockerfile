FROM alpine:latest

ARG MIGRATE_VERSION
ENV MIGRATE_VERSION="v4.17.0"
ARG OS
ENV OS="linux"
ARG ARCH
ENV ARCH="arm64"

RUN apk --update add curl
RUN curl -L "https://github.com/golang-migrate/migrate/releases/download/$MIGRATE_VERSION/migrate.$OS-$ARCH.tar.gz" | tar xvz

COPY ./mysql /migrations/mysql
COPY ./clickhouse /migrations/clickhouse
