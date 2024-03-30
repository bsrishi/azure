variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "The location/region where the virtual machine is created."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The admin username of the virtual machine."
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet where the virtual machine will be connected."
  type        = string
}

variable "admin_password" {
  description = "The password for the admin user of the virtual machine."
  type        = string
  sensitive   = true
}

