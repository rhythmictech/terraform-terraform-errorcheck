terraform {
  required_version = ">= 0.12.28"
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "~> 1.2"
    }
  }
}
