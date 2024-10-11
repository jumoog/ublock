FROM debian:stable-slim AS builder

WORKDIR /build

RUN apt-get update && \
	apt-get install --no-install-recommends -y ca-certificates wget unzip && \
	wget -q https://github.com/uBlockOrigin/uBOL-home/releases/download/uBOLite_2024.10.6.1334/uBOLite_2024.10.6.1334.chromium.mv3.zip && \
        unzip *.zip && rm -rf *.zip

FROM scratch AS final
COPY --from=builder /build/ /uBlock0.chromium
