# Landscape Scalable Product Module

This module requires a bootstrapped Juju cloud with a model created within it, the name of which can be provided as `model`.

For example, bootstrap a LXD cloud:

```sh
juju bootstrap lxd landscape-controller
```

Then, create a model named `landscape`:

```sh
juju add-model landscape
```

Then, use `landscape` as the value for `model`:

```sh
terraform apply -var model=landscape
```

After deploying the module to the model, use the `juju status` command to monitor the lifecycle:

```sh
juju status -m landscape --relations --watch 2s
```

> [!TIP]
> Customize the module inputs with a `terraform.tfvars` file. An example is `terraform.tfvars.example`, which can be used after removing the `.example` extension.

## API

### Inputs

The product module offers the following configurable inputs:

| Name               | Type   | Description                                                                                                                         | Required |
| ------------------ | ------ | ----------------------------------------------------------------------------------------------------------------------------------- | -------- |
| `haproxy`          | object | Configuration for the haproxy charm including app_name, channel, config, constraints, resources, revision, base, and units          | False    |
| `landscape_server` | object | Configuration for the landscape-server charm including app_name, channel, config, constraints, resources, revision, base, and units | False    |
| `model`            | string | The name of the Juju model to deploy Landscape Server to                                                                            | True     |
| `postgresql`       | object | Configuration for the postgresql charm including app_name, channel, config, constraints, resources, revision, base, and units       | False    |
| `rabbitmq_server`  | object | Configuration for the rabbitmq-server charm including app_name, channel, config, constraints, resources, revision, base, and units  | False    |

### Outputs

Upon being applied, the module exports the following outputs:

| Name                            | Description                                                                                                                                                               |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `applications`                  | Map containing all applications (charms) in the module                                                                                                                    |
| `admin_email`                   | The email of the first admin (if set).                                                                                                                                    |
| `admin_password`                | The password of the first admin (if set, sensitive).                                                                                                                      |
| `has_modern_amqp_relations`     | The deployment used the `inbound-amqp` and `outbound-amqp` endpoints to integrate the Landscape Server and RabbitMQ server charms rather than the legacy `amqp` endpoint. |
| `has_modern_postgres_interface` | The deployment supports the `postgresql_client` charm interface and used the `database` endpoint when integrating Landscape Server and PostgreSQL.                        |
| `registration_key`              | Registration key for Landscape Server clients (sensitive)                                                                                                                 |
| `self_signed_server`            | This deployment is not using custom TLS.                                                                                                                                  |

## Notes

- This module uses the [Landscape Server charm module](https://github.com/canonical/landscape-charm/tree/main/terraform)
