# Example Terraform Practice

This repo contains the code for `Terraform Practice` in Jenkins.

## Getting started

1. Install [Terraform](https://www.terraform.io/) or run `make install-dependencies`
1. Set your AWS credentials as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
1. Run `make terraform-init`
1. Run `make terraform-plan`
1. If the plan looks good, run `make terraform-apply`.

## What you can get from the Makefile

Variables:

 * TERRAFORM_VERSION = 0.12.18

```Makefile
# Download and install required binaries files
install-dependencies:
	...

# Format the terraform code
terraform-fmt:
	...

# Perform a terraform init
terraform-init:
	...

# Perform a validation of the terraform files
terraform-validate:
	...

# Produce the terraform plan
terraform-plan:
	...

# Apply the terraform plan
terraform-apply:
	...

# Destroy the infrastructure provisioned
terraform-destroy:
	...

# Remove the container
container-clean:
	...

# Build the image
container-build: container-clean
	...

# Run the container
container-run: container-build
	...

```
