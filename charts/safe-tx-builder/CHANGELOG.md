# ChangeLog

## 0.1.0

### Features

- Deploy the Transaction Builder app from the wallet image, pinned to commit `e7c554c` and digest `sha256:4ce371031be7…`. The container builds `apps/tx-builder` with `VITE_GATEWAY_URL` on start, checks the build for Safe branding, and serves it on port `4000`.
