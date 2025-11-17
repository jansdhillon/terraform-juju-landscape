# Landscape Terraform Product Modules

This project contains [Terraform][Terraform] product modules to deploy Landscape, including the Landscape Server charm and other required applications.

The modules use the [Terraform provider for Juju][Terraform Juju provider] to model the deployment onto any machine environment managed by [Juju][Juju].

In order to deploy the product modules, please follow the instructions in the `README.md` of the module.

## Linting

Use the following Make recipe to lint and automatically format the modules:

```sh
make fix
```

To verify formatting and linting without writing any changes:

```sh
make check
```

## Testing

Use the following Make recipe to run the tests in the modules:

```sh
make test
```

[Terraform]: https://www.terraform.io/
[Terraform Juju provider]: https://registry.terraform.io/providers/juju/juju/latest
[Juju]: https://juju.is
