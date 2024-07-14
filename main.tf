resource "azurerm_resource_group" "RG1" {
    name = var.RGname
    location = var.location
  
}

module "Service_Principal" {
  source = "./modules/Service_Principal"
  service_principal_name = var.service_principal_name

  depends_on = [ azurerm_resource_group.RG1 ]
}

resource "azurerm_role_assignment" "rolespn" {
  scope = "/subscriptions/736f8140-d7a6-40ec-86b4-9e3da5fc8382"
  role_definition_name = "Contributor"
  principal_id = module.Service_Principal.service_principal_object_id

  depends_on = [ module.Service_Principal ]
}

module "key_vault" {
  source = "./modules/key_vault"
  keyvault_name = var.keyvault_name
  location = var.location
  resource_group_name = var.RGname
  service_principal_name   = var.service_principal_name
  service_principal_object_id = module.Service_Principal.service_principal_object_id
  service_principal_tenant_id = module.Service_Principal.service_principal_tenant_id
  

}

resource "azurerm_key_vault_secret" "kvsecret" {
  name = module.Service_Principal.client_id
  value = module.Service_Principal.client_secret
  key_vault_id = module.key_vault.keyvault_id
}