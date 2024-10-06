# ssl_generator/Dockerfile
FROM alpine:latest

# Install openssl
RUN apk add --no-cache openssl

# Set working directory to /ssl
WORKDIR /ssl

# Copy the SSL generation script into the container
COPY generate_ssl.sh /ssl/generate_ssl.sh

# Set proper permissions for the script
RUN chmod +x /ssl/generate_ssl.sh

# Run the script
ENTRYPOINT ["/bin/sh", "-c", "/ssl/generate_ssl.sh && sleep 10"]
