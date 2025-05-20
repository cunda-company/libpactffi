FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl unzip gcc make && \
    # Install AWS CLI v2
    curl -Lo "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    rm -rf /var/lib/apt/lists/*

# Install Go (Golang) - latest stable version
ENV GO_VERSION=1.24.3
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "amd64" ]; then GOARCH=amd64; elif [ "$ARCH" = "arm64" ]; then GOARCH=arm64; else echo "Unsupported arch: $ARCH"; exit 1; fi && \
    curl -LO https://go.dev/dl/go${GO_VERSION}.linux-${GOARCH}.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-${GOARCH}.tar.gz && \
    rm go${GO_VERSION}.linux-${GOARCH}.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"
ENV PATH="/root/go/bin:${PATH}"
ENV CGO_LDFLAGS="-L/usr/local/lib"
ENV CGO_ENABLED=1
ENV GOCACHE=/root/.cache/go-build
ENV GOMODCACHE=/go/pkg/mod

RUN go install github.com/pact-foundation/pact-go/v2@latest

RUN pact-go -l DEBUG install

RUN pact-go check