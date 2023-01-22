module "security_group" {
  source      = "../modules/security_group"
  name        = var.name
  cidr_blocks = var.cidr_blocks
  ENV         = var.ENV
}

module "iam" {
  source = "../modules/iam"
  name   = var.name
  ENV    = var.ENV
}

module "iam_instance_profile" {
  source   = "../modules/iam_instance_profile"
  name     = var.name
  iam_role = module.iam.iam_role_name

}

module "ec2" {
  source               = "../modules/ec2"
  name                 = var.name
  instance_type        = var.instance_type
  iam_instance_profile = module.iam_instance_profile.instance_profile_name
  aws_security_group   = [module.security_group.sg_id]
  ENV                  = var.ENV
}
    
module "ecr" {
  source             = "../modules/ecr"
  name               = "spring-boot-app"
  tag_mutable        = var.tag_mutable
  scan_on_push       = var.scan_on_push
  encryption_type    = var.encryption_type
}
  
