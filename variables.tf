variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "path_to_ssh_key" {
  default     = "proto user for vm data"
  type        = string
}

variable "ip_address" {
  description = "ip-адрес"
  type        = string
  default = "192.1680.0.1"
  validation {
    condition     = can(cidrhost("${var.ip_address}/32", 0))
    error_message = "Неправильный ip-адрес"
  }
}

variable "ip_address_list" {
  description = "список ip-адресов"
  type        = list(string)
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  validation {
    condition = alltrue([for ip in var.ip_address_list: can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", ip))])
    error_message = "Неправильный список ip-адресов"
  }
}