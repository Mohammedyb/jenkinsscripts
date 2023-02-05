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
     default = [
        {
            "name" = "23dc9a96-cfb9-476d-999c-2927e88cd1b6"
       
        }
}
variable "subscription_id" {
    type        = string
    default = [
        {
            "name" = "c7f01de4-8043-4af7-9031-6c23fc09d3d0"
       
        }
}
variable "subscription_name" {
    type        = string
    default = [
        {
            "name" = "Azure subscription 1"
       
        }
}


