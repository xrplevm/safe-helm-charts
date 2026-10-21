# ChangeLog

## 0.2.0

### Breaking changes

- `config.security.authToken` has no default and is required. The old default `1234567890` let anyone post to `/v1/hooks/events`.

### Fixes

- Name the CORS nginx ConfigMap with the `safe-client-gateway.fullname` helper. The chart failed to render on its own.

## 0.1.0

### Features

- Initial version

### Fixes

- N/A