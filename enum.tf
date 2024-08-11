variable "zone-ru_central1_a" {
  type = string
  default = "ru-central1-a"
  description = "zone on ru-central1-a"
}

variable "env-develop" {
  type = string
  default = "develop"
}

variable "env-stage" {
  type = string
  default = "stage"
}

locals {
  zone-default_zone = var.zone-ru_central1_a
}