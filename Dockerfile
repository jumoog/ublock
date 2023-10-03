# 1.52.2
FROM debian:stable-slim AS builder

WORKDIR /build

RUN apt-get update && \
	apt-get install --no-install-recommends -y curl ca-certificates wget unzip && \
	curl -s https://api.github.com/repos/gorhill/uBlock/releases/latest \
	| grep "browser_download_url.*zip" \
	| cut -d : -f 2,3 \
	| tr -d \" \
	| wget -qi - && unzip *.zip && rm -rf *.zip


FROM scratch AS final
COPY --from=builder /build/uBlock0.chromium /uBlock0.chromium
