locals {
  configure_acr_resources = {
    settings = {
      acrmediawiki0001 = {
        name                      = "acrmediawiki0001"
        location                  = "centralindia"
        resource_group_name       = "RGMEDIAWIKI001"
        data_endpoint_enabled     = true
        images_retention_enabled  = true
        images_retention_days     = 10
        quarantine_policy_enabled = false

        georeplications = []

      }
    }
  }
}
