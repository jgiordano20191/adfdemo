terraform {
  required_providers  {
      azurerm = {
         source =  "hashicorp/azurerm"
         version = "2.0"
      }
  }
  
backend "azurerm"  {
  resource_group_name  =  "terraform-backend"
  storage_account_name =  "terraformbackenddemo"
  container_name       =  "tfstate"
