# Pull base image.
FROM alpine:latest

RUN apk --update --no-cache add libc6-compat wget unzip git make py3-pip python3 bash aws-cli
# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_linux_amd64.zip

# Unzip
RUN unzip terraform_1.2.6_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 

WORKDIR /usr/local/bin/data
