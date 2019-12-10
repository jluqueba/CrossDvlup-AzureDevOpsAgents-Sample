variable "resource_group_name" {
  type = string
  description = "(Required) Specifies the name of the Resource Group in which exists the target storage account to upload the blob"
}

variable "storage_account_name" {
  type = string
  description = "(Required) Specifies the name of the Storage Account in which upload the blob"
}

variable "storage_container_name" {
  type = string
  description = "(Required) Specifies the name of the Storage Container in which upload the blob"
}