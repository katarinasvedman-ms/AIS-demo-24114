az group create --name rg-visma-demo --location swedencentral
az deployment group create --resource-group rg-visma-demo --template-file .\azuredeploydemo.bicep