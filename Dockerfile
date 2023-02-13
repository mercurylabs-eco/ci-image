ARG GOLANG_TAG=1.18beta2

FROM golang:${GOLANG_TAG}

RUN apt-get update && apt install unzip xz-utils openjdk-11-jre-headless jq -y

WORKDIR /tmp

# Install SAM CLI
RUN wget -q "https://github.com/aws/aws-sam-cli/releases/download/v1.39.0/aws-sam-cli-linux-x86_64.zip" && unzip -q aws-sam-cli-linux-x86_64.zip -d sam-installation && ./sam-installation/install && sam --version

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip -q awscliv2.zip && ./aws/install && aws --version

# Install golangci-lint
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.44.2

# Install Zig
RUN curl -o zig.tar.xz https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.1606+3c2a43fdc.tar.xz \
    && mkdir /usr/local/zig && tar xf zig.tar.xz -C /usr/local/zig --strip-components=1 \
    && ln /usr/local/zig/zig /usr/bin/

ENV PATH=$PATH:/usr/local/zig/zig

RUN rm -rf /tmp/*