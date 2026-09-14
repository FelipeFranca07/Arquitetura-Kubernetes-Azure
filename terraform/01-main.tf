resource "azurerm_resource_group" "main" {
  name     = "rg-workload-prod"
  location = "Brazil South"
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-workload-prod"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
