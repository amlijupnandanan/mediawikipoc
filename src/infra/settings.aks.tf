locals {
  configure_aks_resources = {
    settings = {
      aksmediawiki0001 = {
        name                                             = "aksmediawiki0001"
        location                                         = "centralindia"
        resource_group_name                              = "RGMEDIAWIKI001"
        kubernetes_version                               = "1.27.9"
        sku_tier                                         = "Standard"
        private_cluster_enabled                          = false
        custom_dns_zone_enabled                          = false
        azure_active_directory_role_based_access_control = {}

        default_node_pool = {
          node_count          = 1
          vm_size             = "Standard_DS2_v2"
          max_pods            = 100
          enable_auto_scaling = false
          max_count           = 1
          min_count           = 1
          node_labels = {
            "type" = "system"

          }
        }

        azurerm_kubernetes_cluster_node_pool = [
          {
            name            = "media1"
            vm_size         = "Standard_DS2_v2"
            min_count       = 1
            max_count       = 1
            node_count      = 1
            max_pods        = 100
            priority        = "Spot"
            eviction_policy = "Delete"
            zones           = []
            node_labels = {
              "type"                                  = "user"
              "poolname"                              = "mediapool1"
              "kubernetes.azure.com/scalesetpriority" = "spot"
            }
            # upgrade_settings = {
            #   max_surge = "33%"
            # }
            node_taints = [
              "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
            ]
          }
        ]
        # tags = local.common.tags
      }

    }
  }
}
