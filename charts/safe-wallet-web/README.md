# Safe-Wallet-Web

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps an [XRPL EVM Multisig](https://github.com/xrplevm/safe-wallet-web) web app deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. The app is a rebranded fork of safe-wallet-web without Safe trademarks. The image already contains the brand assets, so the chart does not mount logos or favicons.


## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- [Safe-transaction-service](../safe-transaction-service/)
- [Safe-config-service](../safe-config-service/)
- [Safe-client-gateway](../safe-client-gateway)


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages

helm install [RELEASE-NAME] safe/safe-wallet-web
```

The command deploys safe-wallet-web on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

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
helm upgrade [RELEASE-NAME] safe/safe-wallet-web
```

## Configuration

The following table lists the configurable parameters of the safe-wallet-web chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe-wallet-web
```


### Common parameters

| Parameter | Description | Default |
|---|---|---|
| `nameOverride` | Provide a name in place of safe-wallet-web for `app:` labels | `""` |
| `fullnameOverride` | Provide a name to substitute for the full names of resources | `""` |

### Installation parameters

| Parameter | Description | Default |
|---|---|---|
| `imagePullSecrets` | Pull secrets for a private image registry | `[]` |
| `replicaCount` | Number of instance for safe-wallet-web | `1` |
| `image.repository` | Web app image name | `ghcr.io/xrplevm/safe-wallet-web` |
| `image.tag` | Web app image tag (commit SHA of the `1.82.0` branch, pinned by digest) | `3d608540a38984ac4dc5c912addd12e37ef94fa3@sha256:6645c7707c8d73261c48c504c2ef5a148aa833333dd14511a1b2eae9618ac564` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `extraEnv` | Specify additional environment variables | `[]` |
| `extraEnvVars` | Extra variables in the env ConfigMap. `NEXT_PUBLIC_DEFAULT_MAINNET_CHAIN_ID` and `NEXT_PUBLIC_APP_URL` here take precedence over `config.defaultChainId` and `config.appUrl` | `{}` |

### Configuration parameters

| Parameter | Description | Default |
|---|---|---|
| `config.debug` | Enable debug mode | `true` |
| `config.clientGateway.url` | URL of the Client-Gateway | `""` |
| `config.safeVersion` | Safe contract version used for new accounts | `1.4.1+L2` |
| `config.defaultChainId` | Chain selected when the app opens. A non-empty `extraEnvVars.NEXT_PUBLIC_DEFAULT_MAINNET_CHAIN_ID` takes precedence | `1440000` |
| `config.appUrl` | Public origin of the app, used for link previews. Required when ingress is disabled or has no host | `https://<ingress.host>` |
| `config.walletConnect.projectId` | Wallet-Connect project ID | `""` |
| `config.walletConnect.bridge` | Wallet-Connect Bridge | `""` |

### Pod parameters

| Parameter | Description | Default |
|---|---|---|
| `web.nodeSelector` |  | `{}` |
| `web.affinity` |  | `{}` |
| `web.tolerations` |  | `{}` |
| `web.securityContext` |  | `{}` |
| `web.podSecurityContext` |  | `{}` |
| `web.resources` |  | `{}` |

### Basic auth parameters

An nginx sidecar asks for a login before it proxies to the app. It works with any ingress class. `/healthz` stays open for load balancer health checks and returns `200` only when the app answers `/welcome`.

| Parameter | Description | Default |
|---|---|---|
| `basicAuth.enabled` | Run the nginx basic auth sidecar. The Service then targets port `8080` | `false` |
| `basicAuth.user` | Basic auth user name | `""` |
| `basicAuth.password` | Basic auth password | `""` |

### Ingress parameters

| Parameter | Description | Default |
|---|---|---|
| `ingress.enabled` | Enable ingress | `true` |
| `ingress.ingressClassName` | Ingress class name | `nginx` |
| `ingress.host` | Ingress host | `safe-wallet.minikube.net` |
| `ingress.annotations` | Ingress annotations | <pre>nginx.ingress.kubernetes.io/force-ssl-redirect: "true"<br/>nginx.ingress.kubernetes.io/enable-cors: "false"</pre> |


## Troubleshooting

- 