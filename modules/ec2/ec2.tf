data "aws_ami" "ubuntu_22_0" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-groovy-22.0-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu_22_0.id
  instance_type          = var.instance_type
  key_name               = "${var.name}-keypair"
  vpc_security_group_ids = var.aws_security_group

  root_block_device {
    encrypted = true
  }

  monitoring           = true
  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = "${var.name}-Terraform-Instance"
    ENV  = var.ENV
  }

  #tfsec:ignore:aws-ec2-enforce-http-token-imds 
  metadata_options {

  }
}
