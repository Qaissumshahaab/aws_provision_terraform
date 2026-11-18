module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  common_tags = local.common_tags
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name

  vpc_id           = module.networking.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr

  common_tags = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  project_name = var.project_name

  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.security.security_group_id

  key_name   = var.key_name
  public_key = file(var.public_key_path)

  common_tags = local.common_tags
}
