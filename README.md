# terraform-aws-registry

This is a simple module that creates an ERC repository with its policy.

## How to use:

```hcl
module "registry" {
  source      = "graphnode-technologies/registry/aws"
  version     = "~> 1.0"

  name = var.domain_name
}
```

## Inputs

| Name | Description | Default value | Required |
|------|-------------|---------------|----------|
| `name`  | The ERC repository name and policy | - | yes |
| `tags`  | Add custom tags for the resources | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `repository_name`  | The full repository name |
| `repository_url`  | The url for the repository |