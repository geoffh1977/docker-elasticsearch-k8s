# Build Elasticsearch Container
FROM geoffh1977/elasticsearch:latest
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

# Replace Config With K8s Config (Includes plugin)
COPY config /elasticsearch/config

# Set Discovery Environment / Swap Is Disabled, Disable Lock
ENV DISCOVERY_SERVICE=elasticsearch-discovery \
    MEMORY_LOCK=false
