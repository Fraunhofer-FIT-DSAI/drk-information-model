# Use widely compatible base image
FROM alpine:3.18

# Install OpenJDK 17 and required packages, create user
RUN apk add --no-cache openjdk17-jre wget curl bash && \
    addgroup -g 1000 blazegraph && \
    adduser -D -s /bin/sh -u 1000 -G blazegraph blazegraph

# Set working directory and create it
WORKDIR /opt/blazegraph

# Download Blazegraph as root, then change ownership
RUN wget -O blazegraph.jar https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_2_1_6_RC/blazegraph.jar && \
    mkdir -p data conf && \
    chown -R blazegraph:blazegraph /opt/blazegraph

# Copy files with proper ownership
COPY --chown=blazegraph:blazegraph ./drk-ontology.ttl data/
COPY --chown=blazegraph:blazegraph sparql-endpoint/RWStore.properties conf/
COPY --chown=blazegraph:blazegraph sparql-endpoint/startup.sh .
RUN chmod +x startup.sh

# Switch to non-root user
USER blazegraph

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/blazegraph/ || exit 1

# Use startup script for auto-loading ontology
CMD ["./startup.sh"]