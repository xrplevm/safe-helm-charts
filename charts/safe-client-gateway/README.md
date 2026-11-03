# Safe-Client-Gateway

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps a [safe-client-gateway](https://github.com/safe-global/safe-client-gateway) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

We also package the following helm charts from Bitnami for you to _optionally_ use:

| Chart                                                                        | Descrption                      |
|------------------------------------------------------------------------------|---------------------------------|
| [Redis](https://github.com/bitnami/charts/tree/main/bitnami/redis)           | For enabling caching            |

## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- [Safe-transaction-service](../safe-transaction-service/)
- [Safe-config-service](../safe-config-service/)
- Redis _(optional)_


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages

helm install [RELEASE-NAME] safe/safe-client-gateway
```

The command deploys safe-client-gateway on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`


## Uninstalling the Chart

To uninstall the `[RELEASE-NAME]` deployment:

```bash
helm uninstall [RELEASE-NAME]
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Upgrading Chart

To upgrade the `[RELEASE-NAME]` deployment with the latest version:

```bash
helm upgrade [RELEASE-NAME] safe/safe-client-gateway
```

## Configuration

The following table lists the configurable parameters of the safe-client-gateway chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe-client-gateway
```


### Common parameters

| Parameter | Description | Default |
|---|---|---|
| `nameOverride` | Provide a name in place of safe-client-gateway for `app:` labels | `""` |
| `fullnameOverride` | Provide a name to substitute for the full names of resources | `""` |

### Installation parameters

| Parameter | Description | Default |
|---|---|---|
| `replicaCount` | Number of instance for safe-client-gateway-web | `1` |
| `image.repository` | safe-client-gateway image name | `safeglobal/safe-client-gateway-nest` |
| `image.tag` | safe-client-gateway image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `Always` |
| `extraEnv` | Specify additional environment variables | `[]` |

### Configuration parameters

| Parameter | Description | Default |
|---|---|---|
| `config.debug` | Enable debug mode | `true` |
| `config.cfgService.url` | URL of the Config-Service | `""` |
| `config.security.authToken` | Required. Token that guards `POST /v1/hooks/events`. Use a random secret and keep it out of git | `""` |
| `config.redis.host` | Redis Host<br>if `safe-client-gateway-redis.enabled=false` | `""` |
| `config.redis.port` | Redis Port | `6379` |

### Pod parameters

| Parameter | Description | Default |
|---|---|---|
| `web.nodeSelector` |  | `{}` |
| `web.affinity` |  | `{}` |
| `web.tolerations` |  | `{}` |
| `web.securityContext` |  | `{}` |
| `web.podSecurityContext` |  | `{}` |
| `web.resources` |  | `{}` |

### Ingress parameters

| Parameter | Description | Default |
|---|---|---|
| `ingress.enabled` | Enable ingress | `true` |
| `ingress.ingressClassName` | Ingress class name | `nginx` |
| `ingress.host` | Ingress host | `cgw-service.minikube.net` |
| `ingress.annotations` | Ingress annotations | <pre>nginx.ingress.kubernetes.io/force-ssl-redirect: "true"<br>nginx.ingress.kubernetes.io/enable-cors: "true"<br>nginx.ingress.kubernetes.io/cors-allow-methods: "OPTIONS, GET, HEAD, DELETE, PUT, POST"<br>nginx.ingress.kubernetes.io/cors-allow-origin: "https://*.minikube.net"<br>nginx.ingress.kubernetes.io/cors-allow-headers: "DNT,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization,Safe-Wallet-Signature,Safe-Wallet-Signature-Timestamp"</pre> |

### CORS sidecar parameters

| Parameter | Description | Default |
|---|---|---|
| `cors.enabled` | Enable the nginx CORS sidecar | `true` |
| `cors.allowOrigins` | One origin string or a YAML list of origins | `"https://*.minikube.net"` |

The sidecar returns the matching request origin in `Access-Control-Allow-Origin` for preflight and normal responses.
Disallowed origins receive no `Access-Control-Allow-Origin` header.
Responses include `Vary: Origin` so caches distinguish request origins.
Existing scalar values remain supported, including `"*"` to allow any origin.
A wildcard such as `https://*.minikube.net` matches one subdomain label.
Only HTTP and HTTPS origins support this subdomain wildcard. Other wildcard patterns and regular expressions are not supported.

For the standalone chart, configure multiple origins as a YAML list:

```yaml
cors:
  allowOrigins:
    - https://multisig.xrplevm.org
    - https://multisig-txbuilder.xrplevm.org
```

For `safe-stack`, nest `cors` under `safe-client-gateway`.
Ingress CORS annotations are separate from the sidecar configuration. If ingress CORS is enabled, its allowlist must also allow these origins.

### Redis parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-client-gateway-redis.enabled` | Spin up a Redis instance | `true` |

Refer to [bitnami/redis](https://artifacthub.io/packages/helm/bitnami/redis) for configuration.


## Troubleshooting

- 