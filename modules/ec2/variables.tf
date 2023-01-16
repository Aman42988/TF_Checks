variable "name" {
  type    = string
  default = ""
}

variable "ENV" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "aws_security_group" {
  type    = list(string)
  default = []
}

variable "iam_instance_profile" {
  type    = string
  default = ""
}
