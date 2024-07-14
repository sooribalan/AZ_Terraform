terraform {
   backend "azurerm" {
    resource_group_name  = "jenkins"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "tfstate7305"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    sas_token            = "sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2024-07-14T14:53:04Z&st=2024-07-14T06:53:04Z&spr=https,http&sig=lOkbIwBQWTNKyP4FMPTTVBn1aZU%2BE30pm%2B7i%2BSbCbiw%3D"  # Can also be set via `ARM_TENANT_ID` environment variable.

  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.107.0"
    }
  }
}

provider "azurerm" {
  features {}
} 