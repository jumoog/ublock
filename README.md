# ublock
unzipped ublock docker layer for puppeteer

# example
## Dockerfile 
```Docker
FROM jumoog/ublock:latest as ublock
COPY --from=ublock / /
```

## Code
```TS
puppeteer.launch({
    args: [
        "--disable-extensions-except=/uBlock0.chromium",
        "--load-extension=/uBlock0.chromium"
]});
```
