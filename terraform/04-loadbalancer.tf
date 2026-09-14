resource "azurerm_lb" "public" {
  name                = "lb-public"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name      = "frontend"
    subnet_id = azurerm_subnet.public.id
  }
}

resource "azurerm_lb_backend_address_pool" "aks" {
  loadbalancer_id = azurerm_lb.public.id
  name            = "aks-pool"
}

resource "azurerm_lb_rule" "https" {
  loadbalancer_id                = azurerm_lb.public.id
  name                            = "https"
  protocol                        = "Tcp"
  frontend_port                   = 443
  backend_port                    = 443
  frontend_ip_configuration_name  = "frontend"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.aks.id]
}
