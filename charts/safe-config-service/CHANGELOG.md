# ChangeLog

## 0.2.1

### Fixes

- Pin the nginx sidecar to `nginx:1.31.9-alpine` (digest `sha256:90b6bd2aec27…`) instead of the floating `nginx:alpine` tag. nginx 1.31.9 includes the security fixes of 18 November 2026.

## 0.2.0

### Features

- Add `ingress.paths` to choose the paths that the ingress routes. The default keeps the 0.1.0 paths.

### Breaking changes

- `config.clientGateway.token` has no default and is required. It must equal the client gateway `config.security.authToken`.

## 0.1.0

### Features

- Initial version

### Fixes

- N/A