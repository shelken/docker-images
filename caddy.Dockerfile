# Build stage
ARG CADDY_VERSION
FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
#    --with github.com/WeidiDeng/caddy-cloudflare-ip

# Final stage
FROM caddy:2.10.2

# Copy the custom-built Caddy binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
