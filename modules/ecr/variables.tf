variable "name" {
  type    = string
  default = ""
}

variable "tag_mutable" {
  type    = string
  default = "IMMUTABLE"
}

variable "scan_on_push" {
   type    = bool
   default = true
}

variable "encryption_type" {
   type    = string
   default = ""
}
