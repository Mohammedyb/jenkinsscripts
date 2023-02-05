terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=2.60.0"
        }
    }
}


provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "mohammed_devops" {
    count     = "${length(var.resource_groups)}"
    name      = "${lookup(var.resource_groups[count.index],"name")}"
    location  = "${lookup(var.resource_groups[count.index],"location")}"
}

resource "azurerm_container_registry" "mohammed_devops_registry" {
    name                = var.container_registry["name"]
    location            = azurerm_resource_group.mohammed_devops.0.location
    resource_group_name = azurerm_resource_group.mohammed_devops.0.name
    sku                 = "Standard"

    tags = {
      Group                   = var.resource_tags.group
      ContactBeforeDelete     = var.resource_tags.contact
      CreatedDate             = timestamp()
    }

    lifecycle {
      ignore_changes = [
        tags["CreatedDate"]
      ]
    }  
}

resource "azurerm_kubernetes_cluster" "mohammed_devops" {
    count                   = "${length(var.kubernetes_clusters)}"
    name                    = "${lookup(var.kubernetes_clusters[count.index],"name")}"
    location                = azurerm_resource_group.mohammed_devops[count.index].location
    resource_group_name     = azurerm_resource_group.mohammed_devops[count.index].name
    dns_prefix              = "${lookup(var.kubernetes_clusters[count.index],"dns_prefix")}"
    default_node_pool {
        name                = "${lookup(var.kubernetes_clusters[count.index],"node_pool_name")}"
        node_count          = "${lookup(var.kubernetes_clusters[count.index],"node_count")}"
        vm_size             = "${lookup(var.kubernetes_clusters[count.index],"vm_size")}"
    }

    role_based_access_control {
      enabled = true
    }

    identity {
        type = "SystemAssigned"
    }

    tags = {
      Group                   = var.resource_tags.group
      ContactBeforeDelete     = var.resource_tags.contact
      CreatedDate             = timestamp()
    }
    
    lifecycle {
      ignore_changes = [
        tags["CreatedDate"]
      ]
    }  
}