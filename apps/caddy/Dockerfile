# Build stage
ARG VERSION

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare
#    --with github.com/WeidiDeng/caddy-cloudflare-ip

# Final stage
FROM caddy:${VERSION}

# Copy the custom-built Caddy binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
