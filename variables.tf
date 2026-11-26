variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "this is practice project for terraform"
  type        = string
  default     = "terraform-practice"
}

variable "environment" {
  description = "this is environment variable for terraform which type you deploying like production or development"
  type        = string
  default     = "development"
}

variable "vpc_cidr" {
  description = "this is vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "this is subnet cidr block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ssh_allowed_cidr" {
  description = "CIDR block for SSH access"
  type        = string
  default     = "172.27.8.117/32"

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "Provide a valid CIDR block, such as YOUR_PUBLIC_IP/32."
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
  default     = "my-key"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "./terraform-ec2-key.pub"
}
