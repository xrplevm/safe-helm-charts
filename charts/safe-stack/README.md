# Safe-Stack

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps a [safe](https://github.com/safe-global/safe-infrastructure) infrastructure deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

We also package the following helm charts from Bitnami for you to _optionally_ use:

| Chart                                                                        | Descrption                      |
|------------------------------------------------------------------------------|---------------------------------|
| [PostgreSQL](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) | For use as a database           |
| [Redis](https://github.com/bitnami/charts/tree/main/bitnami/redis)           | For enabling caching            |
| [RabbitMQ](https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq)     | For use as a message broker     |

## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- [Ethereum Node JSON-RPC Endpoint](https://ethereum.org/en/developers/docs/apis/json-rpc/)
- PostgreSQL v14 _(optional)_
- Redis _(optional)_
- RabbitMQ _(optional)_


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages

helm install [RELEASE-NAME] safe/safe-stack
```

The command deploys safe-stack on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

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
helm upgrade [RELEASE-NAME] safe/safe-stack
```

## Configuration

The following table lists the configurable parameters of the safe-stack chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe/safe-stack
```

### Common parameters

| Parameter | Description | Default |
|---|---|---|
| `nameOverride` | Provide a name in place of safe-transaction-service for `app:` labels | `""` |
| `fullnameOverride` | Provide a name to substitute for the full names of resources | `""` |


### safe-transaction-service parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-transaction-service.enabled` | Spin up safe-transaction-service | `true` |

Refer to [safe-global/safe-transaction-service](../safe-transaction-service/) for configuration.

### safe-config-service parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-config-service.enabled` | Spin up safe-config-service | `true` |

Refer to [safe-global/safe-config-service](../safe-config-service/) for configuration.

### safe-client-gateway parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-client-gateway.enabled` | Spin up safe-client-gateway  | `true` |

Refer to [safe-global/safe-client-gateway](../safe-client-gateway/) for configuration.

### safe-wallet-web parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-wallet-web.enabled` | Spin up safe-wallet-web  | `true` |
| `safe-wallet-web.config.txBuilderUrl` | Optional external builder URL. Empty: use `https://<safe-tx-builder.ingress.host>` when the builder is enabled, otherwise the wallet opens the app list | `""` |

Refer to [safe-global/safe-wallet-web](../safe-wallet-web/) for configuration.

### safe-tx-builder parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-tx-builder.enabled` | Spin up safe-tx-builder | `true` |
| `safe-tx-builder.image.tag` | Wallet image containing the builder start script, pinned by digest | `e7c554c0313bb2c92618d83fd468dd23472646a1@sha256:4ce371031be7e371c8b1229215770507c341097bb5ae9b7a691580d25151d6e6` |

Refer to [safe-tx-builder](../safe-tx-builder/) for configuration.

The stack resolves the builder URL once for the wallet ConfigMap and its rollout checksum. `safe-wallet-web.extraEnvVars.NEXT_PUBLIC_TX_BUILDER_URL` takes precedence over `safe-wallet-web.config.txBuilderUrl`, which takes precedence over the derived URL. Leave the internal `safe-wallet-web.parentManaged` flag enabled.



## Troubleshooting

- 

