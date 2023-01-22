variable "name" {
  type    = string
  default = ""
}

variable "cidr_blocks" {
  type    = list(string)
  default = []
}

variable "ENV" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}
variable "tag_mutable" {
  type    = string
  default = ""
}

variable "scan_on_push" {
   type    = bool
   default = false
}

variable "encryption_type" {
   type    = string
   default = ""
}
