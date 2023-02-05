# Manifest is configured for 2 resource groups, each with an AKS cluster
variable "resource_groups" {
    type = list
    default = [
        {
            "name"      = "mohammed_devops",
            "location"  = "West US"
        }
    ]
}
variable "kubernetes_clusters" {
    type = list
    default = [
        {
            "name"              = "mohammed_devops_aks",
            "dns_prefix"        = "mohammed-devops",
            "node_count"        = 1,
            "node_pool_name"    = "development"
            "vm_size"           = "standard_d2ads_v5"
        }
    ]
}


variable "container_registry" {
    type = map
    default = {
        "name" = "mohammedDevOpsContainers"
    }                  
}

variable "resource_tags" {
    type = map
    default = {
        group       = "DevOps"
        contact     = "Mohammed Bubshait"
    }
}

### Variables from *.auto.tfvars
variable "tenant_id" {
    type        = string
}
variable "subscription_id" {
    type        = string
}
variable "subscription_name" {
    type        = string
}

#  "cloudName": "AzureCloud",
#     "homeTenantId": "76955bbc-806c-4944-9c3a-c7c5692ecf8e",
#     "id": "12cc1b79-4ffc-4110-9810-647cb5dbb33a",
#     "isDefault": true,
#     "managedByTenants": [],
#     "name": "Azure subscription 1",
#     "state": "Enabled",
#     "tenantId": "76955bbc-806c-4944-9c3a-c7c5692ecf8e",
#     "user": {
#       "name": "mohammed.bubshait@revature.net",
#       "type": "user"