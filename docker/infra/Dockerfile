FROM alpine:3.8

ENV TERRAFORM_VERSION=0.11.11
ENV KUBERNETES_VERSION=v1.11.5
ENV AUTHENTICATOR_VERSION=1.11.5
ENV HELM_VERSION=v2.12.1
ENV ONE_PASSWORD_VERSION=v0.5.5

ENV KSONNET_VERSION=0.13.1

# Defaults with certs
RUN set -x && \
    apk add --no-cache curl ca-certificates

# Install dependencies
RUN apk add wget && \
    apk add unzip && \
    apk add make && \
    apk add openssh && \
    apk -Uuv add groff less python py-pip && \
    apk add --no-cache gnupg && \
    apk add --no-cach libc6-compat

# Install aws-cli
RUN pip install awscli && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/* && \
    aws --version

# Install aws-iam-authenticator
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/${AUTHENTICATOR_VERSION}/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator && \
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc && \
    rm ./aws-iam-authenticator && \
    aws-iam-authenticator help

# Install Terraform
RUN curl -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    terraform --version

# Install kubectl
RUN curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    cp ./kubectl /usr/local/bin/kubectl && \
    rm ./kubectl && \
    kubectl version --client

# Install helm
RUN curl -o helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -xvf helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64/ && \
    chmod +x /usr/local/bin/helm && \
    helm version --client

# Install Ksonnet
RUN curl  -LJ -o ksonnet.tar.gz https://github.com/ksonnet/ksonnet/releases/download/v${KSONNET_VERSION}/ks_${KSONNET_VERSION}_linux_amd64.tar.gz && \
    tar -xvf ksonnet.tar.gz && \
    mv ks_${KSONNET_VERSION}_linux_amd64/ks /usr/local/bin/ks && \
    rm -rf ks_${KSONNET_VERSION}_linux_amd64/ && \
    chmod +x /usr/local/bin/ks && \
    ks version

# Install ansible
RUN apk add ansible \
    py-pip \
    gcc \
    python2-dev \
    python3-dev \
    musl-dev \
    libffi-dev \
    openssl-dev \
    alpine-sdk

# Why? I don't know the stuff with pip3 or pip
RUN pip3 install --upgrade pip
RUN pip3 install openshift
RUN pip install ansible
RUN pip install --ignore-installed --upgrade ansible

# Set workdir to infrastructure directory
WORKDIR /var/infrastructure
