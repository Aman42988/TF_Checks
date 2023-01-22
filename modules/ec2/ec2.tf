data "aws_ami" "ubuntu_22_0" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
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
    volume_size = 30
    encrypted = true
  }

  monitoring           = true
  iam_instance_profile = var.iam_instance_profile
  
 #tfsec:ignore:aws-ec2-enforce-http-token-imds 
 metadata_options {
     http_endpoint = "enabled"
 }

  tags = {
    Name = "${var.name}-Terraform-Instance"
    ENV  = var.ENV
  }
}
