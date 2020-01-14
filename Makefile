.PHONY: all
all: install-dependencies terraform-init terraform-validate terraform-plan terraform-apply terraform-destroy

# We use bashisms so this ensures stuff works as expected
SHELL := /bin/bash -l
TERRAFORM_VERSION := 0.12.18
docker_tag ?= "localtest-$(shell git rev-parse --short HEAD)"

# Download and install required binaries files
install-dependencies:
	curl -o terraform.zip \
	https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
	yes | unzip terraform.zip
	chmod +x terraform && mv terraform /usr/bin

# Format the terraform code
terraform-fmt:
	terraform fmt terraform-templates

# Perform a terraform init
terraform-init:
	cd terraform-templates && \
	terraform init -input=false
	terraform get -update terraform-templates

# Perform a validation of the terraform files
terraform-validate:
	cd terraform-templates && \
	terraform validate

# Produce the terraform plan
terraform-plan:
	cd terraform-templates && \
	terraform plan -input=false -out=tfplan

# Apply the terraform plan
terraform-apply:
	cd terraform-templates && \
	terraform apply -input=false -auto-approve tfplan

# Destroy the infrastructure provisioned
terraform-destroy:
	cd terraform-templates && \
	terraform destroy -input=false -auto-approve -refresh=false

# Remove the container
container-clean:
	-docker rm -f $(docker_tag)

# Build the image
container-build: container-clean
	docker build -f Dockerfile -t $(docker_tag) .

# Run the container
container-run: container-build
	docker run -dt --env AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) --env AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) --name $(docker_tag) $(docker_tag)
	docker cp ./ ${docker_tag}:/srv/example
