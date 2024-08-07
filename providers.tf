
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
      dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g3menglg4ufpjgjsho/etnk66l1n37i59am5nim"
    }

    bucket   = "tfstate-2a"
    region   = "ru-central1"
    key      = "terraform.tfstate"

    skip_credentials_validation  = true
    skip_region_validation       = true
    skip_requesting_account_id   = true
    skip_s3_checksum             = true

    dynamodb_table = "state-lock-table"
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = local.zone-default_zone
  # service_account_key_file = file("/home/anikulin/authorized_key.json")
}

