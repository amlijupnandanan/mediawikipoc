locals {
  configure_managed_identity = {
    settings = {
      name                = var.settings.name
      resource_group_name = var.settings.resource_group_name
      location            = var.settings.location
    }
  }
}

resource "azurerm_user_assigned_identity" "managed-identity" {
  name                = var.settings.managed_identity
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location

  tags = var.settings.tags
}

resource "azurerm_mssql_server" "this" {
  name                                 = var.settings.name
  resource_group_name                  = var.settings.resource_group_name
  location                             = var.settings.location
  version                              = var.settings.version
  connection_policy                    = var.settings.connection_policy
  minimum_tls_version                  = var.settings.minimum_tls_version
  public_network_access_enabled        = false
  outbound_network_restriction_enabled = false
  administrator_login                  = var.settings.administrator_login
  administrator_login_password         = var.settings.administrator_password


  tags = var.settings.tags
  depends_on = [azurerm_user_assigned_identity.managed-identity]
}



resource "azurerm_mssql_database" "this" {
  for_each       = try({ for n in var.settings.mssql_database : n.name => n }, {})
  name           = each.key
  server_id      = azurerm_mssql_server.this.id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  zone_redundant = false
  tags           = var.settings.tags
}

