# Safe-Tx-Builder

## Introduction

This chart deploys the Transaction Builder app of the [XRPL EVM Multisig](https://github.com/xrplevm/safe-wallet-web) wallet on a [Kubernetes](http://kubernetes.io) cluster with [Helm](https://helm.sh). The app is `apps/tx-builder` of the rebranded safe-wallet-web fork, without Safe trademarks. The wallet opens it in an iframe to compose contract calls and batch them into one multisig transaction.

The chart runs the wallet image with another command: `yarn static-serve` in `/app/apps/tx-builder`. On start, the container builds the app with `VITE_GATEWAY_URL`, stops when the build contains Safe branding (`apps/web/scripts/check-brand.sh`), and serves it on port `4000`. The start takes about one minute. The pod is ready when `/manifest.json` answers.

## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- [Helm 3+](https://helm.sh)
- [Safe-client-gateway](../safe-client-gateway). Its CORS allowlist must include `https://<ingress.host>`, because the browser calls the gateway for ABIs and chain data.
- [Safe-wallet-web](../safe-wallet-web) with `config.txBuilderUrl: https://<ingress.host>`. In `safe-stack`, the URL is derived automatically from this chart's enabled state and ingress host.
- An image built from a fork commit that has `apps/tx-builder/scripts/static-serve.sh`.

## Installing the Chart

```bash
helm install [RELEASE-NAME] ./charts/safe-tx-builder
```

After the install, add the app in the config service admin (`Safe apps`, URL `https://<ingress.host>`, chain `1440000`). Without this entry the app still opens, but the wallet shows an "unknown app" warning the first time.

## Configuration

| Parameter | Description | Default |
|---|---|---|
| `nameOverride` | Provide a name in place of safe-tx-builder for `app:` labels | `""` |
| `fullnameOverride` | Provide a name to substitute for the full names of resources | `""` |
| `imagePullSecrets` | Pull secrets for a private image registry | `[]` |
| `replicaCount` | Number of instances | `1` |
| `image.repository` | Wallet image name | `ghcr.io/xrplevm/safe-wallet-web` |
| `image.tag` | Wallet image tag (commit SHA, pinned by digest) containing the builder start script | `e7c554c0313bb2c92618d83fd468dd23472646a1@sha256:4ce371031be7e371c8b1229215770507c341097bb5ae9b7a691580d25151d6e6` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `extraEnv` | Additional environment variables | `[]` |
| `config.clientGateway.url` | Required. Public URL of the Client Gateway, built into the app as `VITE_GATEWAY_URL` | `https://cgw-service.minikube.net` |
| `web.nodeSelector` |  | `{}` |
| `web.affinity` |  | `{}` |
| `web.tolerations` |  | `{}` |
| `web.securityContext` |  | `{}` |
| `web.podSecurityContext` |  | `{}` |
| `web.resources` |  | `{}` |
| `ingress.enabled` | Enable ingress | `true` |
| `ingress.ingressClassName` | Ingress class name | `nginx` |
| `ingress.host` | Ingress host. Use a host of its own (not a path of the wallet host), without "safe" in the name | `tx-builder.minikube.net` |
| `ingress.annotations` | Ingress annotations | <pre>nginx.ingress.kubernetes.io/force-ssl-redirect: "true"</pre> |
