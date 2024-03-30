terraform {
  backend "local" {
    path = "/mnt/farmhost-community/tf-state/terraform.tfstate"
  }
}
