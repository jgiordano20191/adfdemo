variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "username" {
  sensitive = true
  type = string
}

variable "password" {
  sensitive = true
  type = string
}

resource "azurerm_sql_server" "terraform-sqlserver" {
  name                         = "terraformsqlserver"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.user
  administrator_login_password = var.password
}

resource "azurerm_sql_database" "terraform-demo-sql-database" {
  name                = "terraform-demo-sqldb"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.terraform-sqlserver.name
}
