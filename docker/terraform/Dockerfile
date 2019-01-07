FROM alpine:3.8

ENV VERSION=0.11.11

# Defaults with certs
RUN set -x && \
apk add --no-cache curl ca-certificates

# Install dependencies
RUN apk add wget
RUN apk add unzip
RUN apk add make

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip \
unzip terraform_${VERSION}_linux_amd64.zip \
mv terraform /usr/local/bin/ \
rm terraform_${VERSION}_linux_amd64.zip \
terraform --version

# Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl && \
kubectl version --client

# Set workdir to infrastructure directory
WORKDIR /var/infrastructure
