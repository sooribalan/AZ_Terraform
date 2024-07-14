resource "azurerm_resource_group" "RG1" {
    name = var.RGname
    location = var.location
  
}

module "Service_Principal" {
  source = "./modules/Service_Principal"
  service_principal_name = var.service_principal_name

  depends_on = [ azurerm_resource_group.RG1 ]
}