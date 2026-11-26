# you can set the values of these variables in terraform.tfvars or use default values provided here. If you want to override the default values, create a terraform.tfvars file and set the values there.

variable "aws_region" {
  description = "AWS region"
  type        = string

}

variable "project_name" {
  description = "this is practice project for terraform"
  type        = string

}

variable "environment" {
  description = "this is environment variable for terraform which type you deploying like production or development you can set in terraform.tfvars file"
  type        = string
}

variable "vpc_cidr" {
  description = "this is vpc cidr block"
  type        = string

}

variable "subnet_cidr" {
  description = "this is subnet cidr block"
  type        = string

}

variable "ssh_allowed_cidr" {
  description = "CIDR block for SSH access"
  type        = string


  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "Provide a valid CIDR block, such as YOUR_PUBLIC_IP/32."
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string

}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string

}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
}
