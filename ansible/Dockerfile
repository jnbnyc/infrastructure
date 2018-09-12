FROM python:3.6-stretch
# update
# 1.9.6 minikube version
ARG KUBECTL_VERSION=v1.11.0
ARG HELM_VERSION=v2.9.1
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  cmake \
  gcc \
  git \
  libssl-dev \
  libssh2-1-dev \
  python-setuptools

RUN pip install --upgrade pip
# install ansible
RUN pip install ansible
# install dependencies
RUN pip install six boto3

RUN wget https://github.com/libgit2/libgit2/archive/v0.27.2.tar.gz && \
  tar xzf v0.27.2.tar.gz && \
  cd libgit2-0.27.2/ && \
  cmake . && \
  make && \
  make install

RUN ldconfig
RUN pip install pygit2


COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT entrypoint

# install tools
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# /usr/local/bin/helm
# RUN chmod +x /usr/local/bin/helm
# https://storage.googleapis.com/kubernetes-helm/helm-$HELM_VERSION-linux-amd64.tar.gz.sha256
RUN curl -L https://storage.googleapis.com/kubernetes-helm/helm-$HELM_VERSION-linux-amd64.tar.gz -o /tmp/helm-$HELM_VERSION-linux-amd64.tar.gz \
  && tar xf /tmp/helm-$HELM_VERSION-linux-amd64.tar.gz -C /tmp \
  && mv /tmp/linux-amd64/helm /usr/local/bin/helm && chmod +x /usr/local/bin/helm \
  && rm -r /tmp/*

ARG AWS_IAM_AUTH_VERSION=0.3.0
RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_IAM_AUTH_VERSION}/heptio-authenticator-aws_${AWS_IAM_AUTH_VERSION}_linux_amd64 -o /tmp/heptio-authenticator-aws_${AWS_IAM_AUTH_VERSION}_linux_amd64 \
  && mv /tmp/heptio-authenticator-aws_${AWS_IAM_AUTH_VERSION}_linux_amd64 /usr/local/bin/heptio-authenticator-aws && chmod +x /usr/local/bin/heptio-authenticator-aws

RUN kubectl; helm; heptio-authenticator-aws
WORKDIR /app
COPY ./ /app
