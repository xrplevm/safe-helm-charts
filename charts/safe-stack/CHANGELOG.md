# ChangeLog

## 0.3.0

### Features

- Add `safe-decoder-service` chart 0.1.0 (v1.12.0). Configure trusted contracts through its admin page after deployment.
- Point the gateway to it with `SAFE_DATA_DECODER_BASE_URI`, and set `FF_TRUSTED_DELEGATE_CALL=true`. Batch proposals remain blocked until their target contracts are marked trusted in the decoder.

### Breaking changes

- Set `safe-decoder-service.config.secretKey`, `safe-decoder-service.config.admin.password` and `safe-decoder-service.safe-decoder-service-postgresql.global.postgresql.auth.password` in the deployment values. The render fails without them.

## 0.2.1

### Fixes

- Use `safe-wallet-web` chart 0.2.1: the footer no longer links to a release that does not exist.

## 0.2.0

### Features

- Use `safe-wallet-web` chart 0.2.0: the XRPL EVM Multisig image and no logo or favicon mounts.
- Remove the `safe-wallet-web.image` override, so the sub-chart default applies.
- Remove the empty `NEXT_PUBLIC_DEFAULT_MAINNET_CHAIN_ID` and the `safeVersion` override. The empty value made the app start on chain 0.
- Route only `/media` on the config service ingress, so `/admin` and `/api` are not public.
- Disable the transaction service and events service ingresses. The browser does not call them, and their admin interfaces use default credentials. Use `kubectl port-forward` to reach them.
- Use `safe-config-service` and `safe-client-gateway` charts 0.2.0.

### Breaking changes

- Remove the known gateway auth token `1234567890`. Set `safe-client-gateway.config.security.authToken` and `safe-config-service.config.clientGateway.token` to the same random secret in the deployment values. The render fails without them.

## 0.1.0

### Features

- Initial version

### Fixes

- N/A