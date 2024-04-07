locals {
  location       = var.spec.location
  aks            = var.spec.aks
}

# AKS has own resouce group
resource "azurerm_resource_group" "aks_rg" {
  name     = local.aks.resource_group
  location = local.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.aks.name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = local.aks.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.aks.tags
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

# Need this for a non-prod environment to be able to configure local kubectl
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}