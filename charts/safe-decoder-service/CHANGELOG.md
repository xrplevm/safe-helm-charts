# ChangeLog

## 0.1.0

### Features

- Initial version: safe-decoder-service v1.12.0 (last MIT release) with its web and worker, PostgreSQL and Redis.
- Configure trusted DELEGATECALL contracts manually through the decoder admin page after deployment. The chart does not seed contract rows.
- `config.secretKey`, `config.admin.password` and the PostgreSQL password have no default and are required. They and `DATABASE_URL` go to a Secret, not to the ConfigMap, because whoever has them can mark any contract as trusted.
- Pull PostgreSQL and Redis from `bitnamilegacy`. The default `bitnami` tags of these sub-chart versions no longer exist on Docker Hub.
