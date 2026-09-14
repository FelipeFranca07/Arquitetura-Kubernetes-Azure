resource "azurerm_mssql_server" "main" {
  name                         = "sql-workload-prod"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "main" {
  name      = "workload-db"
  server_id = azurerm_mssql_server.main.id
  sku_name  = "S1"
}
