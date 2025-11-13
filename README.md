# Landscape Terraform Product Modules

This project contains [Terraform][Terraform] product modules to deploy Landscape, including the Landscape Server charm and other required applications.

The module use the [Terraform Juju provider][Terraform Juju provider] to model the bundle deployment onto any machine environment managed by [Juju][Juju].

In order to deploy a Landscape product module, please follow the instructions in the `README.md` of the module.

## Linting

Use the following Make recipe to lint the module(s):

```sh
make fmt-fix
```

## Testing

Use the following Make recipe to run the tests in the module(s):

```sh
make test
```

[Terraform]: https://www.terraform.io/
[Terraform Juju provider]: https://registry.terraform.io/providers/juju/juju/latest
[Juju]: https://juju.is
