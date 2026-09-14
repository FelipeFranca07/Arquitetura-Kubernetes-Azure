resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-workload-prod"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-workload"

  default_node_pool {
    name           = "system"
    node_count     = 3
    vm_size        = "Standard_D4s_v5"
    vnet_subnet_id = azurerm_subnet.private.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}
