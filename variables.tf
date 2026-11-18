variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "IP address allowed to SSH into EC2"
  type        = string

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
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
}
