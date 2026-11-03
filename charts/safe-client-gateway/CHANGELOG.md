# ChangeLog

## Unreleased

### Features

- Accept a YAML list in `cors.allowOrigins` alongside existing scalar values. The CORS sidecar returns one matching request origin, or no allow-origin header for disallowed origins, on preflight and normal responses.
- Add `Vary: Origin` to CORS sidecar responses and support the default single-subdomain wildcard without returning a literal wildcard origin. Scalar `"*"` still allows any origin.
- Restart the gateway pods when the CORS ConfigMap changes so nginx loads the updated origin allowlist.

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