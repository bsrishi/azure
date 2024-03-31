variable "admin_password" {
  type        = string
  description = "Admin password for the VM"
  default     = env("ADMIN_PASSWORD")
}
