locals {
  sql_tags = {
    "ApplicationName"    = ""
    "BusinessUnit"       = ""
    "CostCenter"         = ""
    "Description"        = ""
    "DisasterRecovery"   = ""
    "environment"        = ""
    "OwnerName"          = ""
    "RequesterName"      = ""
    "ServiceClass"       = ""
    "ISV"                = ""
    "DataClassification" = ""
  }

  configure_mssql_resources = {
    settings = {
      sqlsvrmediawiki0001 = {
        location               = "centralindia"
        resource_group_name    = "RGMEDIAWIKI001"
        name                   = "sqlsvrmediawiki0001"
        managed_identity       = "idmediawikisql0001"
        administrator_login    = "sqladmin"
        administrator_password = "Azurepr@123456"

        elasticpool = {
          name = "sqlsvrmediawiki0001"
          per_database_settings = {
          }
          sku = {
          }
        }



        mssql_database = [
          {
            name        = "sqldbmediawiki0001"
            max_size_gb = 32
            sku_name    = "GP_Gen5_2"
            read_scale  = false
          },
        ]
        tags = local.sql_tags


      }
    }
  }
}
