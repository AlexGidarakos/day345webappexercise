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

# Define WebApp subnet variables
variable "subnet_wa_postfix" {
  default = "webapp-subnet"
}
variable "subnet_wa_delegation_postfix" {
  default = "delegation"
}
locals {
  subnet_wa_name = join(var.separator, [local.prefix, var.subnet_wa_postfix])
  subnet_wa_delegation_name = join(var.separator, [local.subnet_wa_name, var.subnet_wa_delegation_postfix])
}
variable "subnet_wa_cidr" {
  default = ["10.0.1.0/24"]
}
variable "subnet_wa_service_delegation_name" {
  default = "Microsoft.Web/serverFarms"
}
variable "subnet_wa_service_delegation_actions" {
  default = ["Microsoft.Network/virtualNetworks/subnets/action"]
}
