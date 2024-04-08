locals {
  acr                 = var.spec.acr
}

# AKS and ACR are using different resource groups
# This is using location provided as global for all resources
resource "azurerm_resource_group" "acr_rg" {
  name     = local.acr.resource_group
  location = local.location
}

resource "azurerm_container_registry" "acr" {
  name                = local.acr.name
  location            = azurerm_resource_group.acr_rg.location
  resource_group_name = azurerm_resource_group.acr_rg.name
  sku                 = local.acr.sku
}

# resource "azurerm_role_assignment" "role_aks_acr" {
#   principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.acr.id
#   skip_service_principal_aad_check = true
#   depends_on = [ 
#     azurerm_kubernetes_cluster.aks, 
#     azurerm_container_registry.acr 
#   ]
# }