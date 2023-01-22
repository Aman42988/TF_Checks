resource "aws_ecr_repository" "foo" {
  name                 = var.name
  
  #tfsec:ignore:aws-ecr-enforce-immutable-repository
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  #tfsec:ignore:aws-ecr-repository-customer-key
  encryption_configuration {
    encryption_type = var.encryption_type 
  }
}
