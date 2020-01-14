variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "example"
}

variable "instance_number" {
  description = "Number of instances to launch"
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  default     = "ami-0713f98de93617bb4"
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = ""
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}
