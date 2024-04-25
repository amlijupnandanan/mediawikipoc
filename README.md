# Mediawiki Infra

## Azure Resources

**We are deploying following resources as part of IaC deployment**
-  Azure Kubernetes
-  Azure Container Registry
-  MSSQL server with database



**Follow the steps**
-  Create Resource group manually for keeping the terraform state in storage account - RGMEDIAWIKI001
-  Create storage account manually for keeping the terraform state - stmediawikitfstate0001
-  Create container in storage account - stmediawiki-tfstate-0001
-  Update subscription id in Infra cd workflow - https://github.com/amlijupnandanan/mediawikipoc/blob/main/.github/workflows/Infracd.yml 
    ARM_SUBSCRIPTION_ID: "*********"
-  Create Repository secrets and update the values
   ![image](https://github.com/amlijupnandanan/mediawikipoc/assets/67151561/b24011e0-8c35-49f0-a6f1-374d2ba6fd44)
   

     
      | Secret | Value                         |
      | ---------------|-------------------------------|
      |ARM_CLIENT_ID    |Client ID |
      |ARM_CLIENT_SECRET      |ARM_CLIENT_SECRET          |
      |ARM_TENANT_ID     |Tenant ID             |
      |TFSTATE_RESOURCE_GROUP_NAME | Resource Group name for tf state |
      |TFSTATE_STORAGE_ACCOUNT_KEY | Storage account access key |
      |TFSTATE_STORAGE_ACCOUNT_NAME|Storage account name|
  

  -  Create the environment in repo - mediawikidemo
  -  Run the Infra CD pipeline
  -  First part of the pipeline in Terraform plan. We can see the resources going to be create in summary
     ![image](https://github.com/amlijupnandanan/mediawikipoc/assets/67151561/e4ed5f46-86f8-4755-8162-05dc5576e42b)
  -  Once the plan is verified , can approve the apply which will deploy the resources
     ![image](https://github.com/amlijupnandanan/mediawikipoc/assets/67151561/e295bcb6-fb6a-43af-bff2-1adf44809784)



     
     
     
