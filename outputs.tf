output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = data.aws_region.current.name
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "security_group_id" {
  value = module.security.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_private_ip" {
  value = module.ec2.private_ip
}
