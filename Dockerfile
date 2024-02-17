FROM debian:stable-slim AS builder

WORKDIR /build

RUN apt-get update && \
	apt-get install --no-install-recommends -y ca-certificates wget unzip && \
	wget -q https://github.com/gorhill/uBlock/releases/download/1.56.0/uBlock0_1.56.0.chromium.zip && \
        unzip *.zip && rm -rf *.zip

FROM scratch AS final
COPY --from=builder /build/uBlock0.chromium /uBlock0.chromium
