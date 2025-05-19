FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl unzip && \
    mkdir -p /usr/local/lib/pact_x86_64 && \
    curl -LO https://github.com/pact-foundation/pact-reference/releases/download/libpact_ffi-v0.4.27/libpact_ffi-linux-x86_64.so.gz && \
    gunzip libpact_ffi-linux-x86_64.so.gz && \
    mv libpact_ffi-linux-x86_64.so /usr/local/lib/pact_x86_64/libpact_ffi.so && \
    # Install AWS CLI v2
    curl -Lo "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    rm -rf /var/lib/apt/lists/* 