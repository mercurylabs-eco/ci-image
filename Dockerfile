ARG GOLANG_TAG=1.18beta2

FROM golang:${GOLANG_TAG}

RUN apt-get update && apt install unzip openjdk-11-jre-headless jq -y

WORKDIR /tmp

RUN wget -q "https://github.com/aws/aws-sam-cli/releases/download/v1.39.0/aws-sam-cli-linux-x86_64.zip" && unzip -q aws-sam-cli-linux-x86_64.zip -d sam-installation && ./sam-installation/install && sam --version

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip -q awscliv2.zip && ./aws/install && aws --version

RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.44.2

RUN rm -rf /tmp/*