variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet."
}

variable "subnet_prefix" {
  type        = string
  description = "The address prefix to use for the subnet."
}
