FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl && \
    mkdir -p /usr/local/lib/pact_x86_64 && \
    curl -LO https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.27/libpact_ffi-linux-x86_64.so.gz && \
    gunzip libpact_ffi-linux-x86_64.so.gz && \
    mv libpact_ffi-linux-x86_64.so /usr/local/lib/pact_x86_64/libpact_ffi.so && \
    rm -rf /var/lib/apt/lists/* 