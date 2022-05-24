variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_public_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_private_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

variable "keyname" {
  type    = string
  default = "demo"
}

variable "environment" {
  type    = string
  default = "demo"
}