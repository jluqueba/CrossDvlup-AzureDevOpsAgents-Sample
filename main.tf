resource "azurerm_storage_blob" "blob" {
  name                   = "my-awesome-content.zip"
  resource_group_name    = var.resource_group_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = "testfile.txt"
}