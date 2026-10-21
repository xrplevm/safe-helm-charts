# ChangeLog

## 0.2.0

### Features

- Deploy the XRPL EVM Multisig image `ghcr.io/xrplevm/safe-wallet-web` (branch `1.82.0`, commit `be9d8cb`, digest `sha256:4c67803a42bf…`) in place of `safeglobal/safe-wallet-web`, which ships Safe trademarks.
- Default `NEXT_PUBLIC_DEFAULT_MAINNET_CHAIN_ID` to `1440000` (`config.defaultChainId`) and `NEXT_PUBLIC_SAFE_VERSION` to `1.4.1+L2`, the production values.
- Render `imagePullSecrets` in the pod spec.
- Set `NEXT_PUBLIC_APP_URL` from `config.appUrl`, or `https://<ingress.host>` when it is empty.

### Breaking changes

- Remove `favicon.enabled`, `logo.enabled` and their ConfigMap mounts. The image contains the brand assets.

## 0.1.0

### Features

- Initial version

### Fixes

- N/A
