terraform {
   backend "azurerm" {
    resource_group_name  = "jenkins"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "aksstorage7305"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    sas_token            = "sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2024-07-13T18:42:07Z&st=2024-07-13T10:42:07Z&spr=https&sig=zwCVvT%2FwSMuVwiVkaT%2F2DKzlY88m0JGOW2fBp7FbjC4%3D"  # Can also be set via `ARM_TENANT_ID` environment variable.

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