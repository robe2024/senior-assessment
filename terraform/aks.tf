locals {
    location = var.spec.location
    resource_group = var.spec.resource_group
    aks = var.spec.aks
}

resource "azurerm_resource_group" "aks_rg" {
  name     = local.resource_group
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

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}