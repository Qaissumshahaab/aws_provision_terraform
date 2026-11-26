resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = merge(var.common_tags, {
    Name = var.key_name
  })
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  associate_public_ip_address = true

  key_name = aws_key_pair.this.key_name




  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 8

    delete_on_termination = true
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-web-server"
  })

  volume_tags = merge(var.common_tags, {
    Name = "${var.project_name}-web-server-volume"
  })
}
