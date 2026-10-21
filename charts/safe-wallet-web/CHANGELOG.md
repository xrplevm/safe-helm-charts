# ChangeLog

## 0.2.1

### Fixes

- Use image commit `320d733` (digest `sha256:001ee562646d…`). The footer no longer links to `releases/tag/v1.81.0`, a release that does not exist.

## 0.2.0

### Features

- Render `imagePullSecrets` in the pod spec.
- Set `NEXT_PUBLIC_APP_URL` from `extraEnvVars`, `config.appUrl`, or `https://<ingress.host>` when ingress is enabled. The render fails when none is set.
- Declare `extraEnvVars`. `NEXT_PUBLIC_DEFAULT_MAINNET_CHAIN_ID` and `NEXT_PUBLIC_APP_URL` render once, and an empty chain ID override falls back to `config.defaultChainId`.
- Add `basicAuth`: an nginx sidecar that asks for HTTP basic auth with any ingress class, and an open `/healthz` for load balancer health checks.

### Breaking changes

- Deploy the XRPL EVM Multisig image `ghcr.io/xrplevm/safe-wallet-web` (branch `1.82.0`, commit `be9d8cb`, digest `sha256:4c67803a42bf…`) in place of `safeglobal/safe-wallet-web`, which ships Safe trademarks.
- Default `NEXT_PUBLIC_DEFAULT_MAINNET_CHAIN_ID` to `1440000` (`config.defaultChainId`) and `NEXT_PUBLIC_SAFE_VERSION` from `1.3.0` to `1.4.1+L2`, the production values.
- Remove `favicon.enabled`, `logo.enabled` and their ConfigMap mounts. The image contains the brand assets, and old `favicon.*` and `logo.*` values are ignored.

## 0.1.0

### Features

- Initial version

### Fixes

- N/A
