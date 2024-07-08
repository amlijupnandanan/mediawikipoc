 module "resourcegroup" {
   for_each = local.configure_resource_groups.settings
   source   = "../modules/resource-group"
   settings = each.value
 }
# module "aks" {
  # for_each = local.configure_aks_resources.settings
  # source   = "../modules/aks"
  # settings = each.value
# }
# module "mssql" {
  # for_each = local.configure_mssql_resources.settings
  # source   = "../modules/mssql"
  # settings = each.value
# } 
# module "acr" {
  # for_each = local.configure_acr_resources.settings
  # source   = "../modules/acr"
  # settings = each.value
# }
