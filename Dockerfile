# Build Elasticsearch K8s Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=elasticsearch
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

# Replace Config With K8s Config (Includes plugin)
COPY config /elasticsearch/config

# Set Discovery Environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Swap Is Off, Disable Lock
ENV MEMORY_LOCK false
