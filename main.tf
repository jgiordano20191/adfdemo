terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>2.0"
    }
  }

  backend "azurerm" {
        resource_group_name  = "terraform-back"
        storage_account_name = "terraformbackdemo"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terraform-adfdemo" {
    name = "terraform-adfdemo"
    location = "us-east"

    tags = {
        creator = "Terraform"
        project = "terraform-adfdemo"
    }
}

data "azurerm_key_vault" "terraform-backend-vault" {
  resource_group_name = "terraform-backend"
  name = "tf-backend-vault"
}

data "azurerm_key_vault_secret" "sql-user" {
  name = "sql-server-user"
  key_vault_id = data.azurerm_key_vault.terraform-backend-vault.id
}

data "azurerm_key_vault_secret" "sql-password" {
  name = "sql-server-password"
  key_vault_id = data.azurerm_key_vault.terraform-backend-vault.id
}

module "blob-storage" {
  source = "./modules/blob-storage"

  resource_group_name = azurerm_resource_group.terraform-demo.name
  location = azurerm_resource_group.terraform-demo.location
}

module "sql-database" {
  source = "./modules/database"

  resource_group_name = azurerm_resource_group.terraform-demo.name
  location = azurerm_resource_group.terraform-demo.location
  username = data.azurerm_key_vault_secret.sql-username.value
  password = data.azurerm_key_vault_secret.sql-password.value
}

resource "azurerm_data_factory" "terraform-demo-factory" {
  name                = "terraform-demo-factory"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name
  github_configuration {
    account_name = "jgiordano20191"
    branch_name = "adf_publish"
    git_url = "https://github.com/jgiordano20191/adfdemo"
    repository_name = "adfdemo"
    root_folder = "/"
  }

  tags = {
        creator = "Terraform"
        project = "terraform-demo"
  }
}
