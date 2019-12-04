data "azurerm_resource_group" "rsg" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "sta" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rsg.name

  depends_on = [data.azurerm_resource_group.rsg]
}

data "azurerm_storage_container" "stc" {
  name                  = var.storage_container_name
  resource_group_name   = data.azurerm_resource_group.rsg.name
  storage_account_name  = data.azurerm_storage_account.sta.name
  
  depends_on = [data.azurerm_resource_group.rsg,
                data.azurerm_storage_account.sta]
}

resource "azurerm_storage_blob" "blob" {
  name                   = "my-awesome-content.zip"
  resource_group_name    = data.azurerm_resource_group.rsg.name
  storage_account_name   = data.azurerm_storage_account.sta.name
  storage_container_name = data.azurerm_storage_container.stc.name
  type                   = "Block"
  source                 = "testfile.txt"

  depends_on = [data.azurerm_resource_group.rsg,
                data.azurerm_storage_account.sta, 
                data.azurerm_storage_container.stc]
}