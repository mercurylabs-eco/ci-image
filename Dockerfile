ARG GOLANG_TAG=1.18beta2

FROM golang:${GOLANG_TAG}

RUN apt-get update && apt install unzip openjdk-11-jre-headless -y

WORKDIR /tmp

RUN wget -q "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" && unzip -q aws-sam-cli-linux-x86_64.zip -d sam-installation && ./sam-installation/install && sam --version

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip -q awscliv2.zip && ./aws/install && aws --version

RUN rm -rf /tmp/*