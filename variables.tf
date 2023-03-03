# Define student name to be used in constructing the prefix for resource names
variable "student" {
  default = "alexg"
}

# Define project name to be used in constructing the prefix for resource names
variable "project" {
  default = "day345webappexercise"
}

# Define separator character to be used in constructing the prefix for resource names
variable "separator" {
  default = "-"
}

# Define prefix for resource names
locals {
  prefix = join(var.separator, [var.student, var.project])
}

# Define Resource Group name and location
variable "rg_postfix" {
  default = "rg"
}
locals {
  rg_name = join(var.separator, [local.prefix, var.rg_postfix])
}
variable "rg_location" {
  default = "uksouth"
}

# Define Virtual Network name and CIDR
variable "vnet_postfix" {
  default = "wa-vnet"
}
locals {
  vnet_name = join(var.separator, [local.prefix, var.vnet_postfix])
}
variable "vnet_cidr" {
  default = ["10.0.0.0/16"]
}
