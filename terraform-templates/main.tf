# AWS provider configuration
provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "this" {
  count                    = var.instance_number
  ami                      = var.ami
  instance_type            = var.instance_type
  user_data                = var.user_data
  subnet_id                = var.subnet_id
  key_name                 = var.key_name
  monitoring               = var.monitoring
  iam_instance_profile     = var.iam_instance_profile
  availability_zone        = var.availability_zone

  tags = merge(var.tags, map("Name", format("%s-%d", var.name, count.index+1)))
}