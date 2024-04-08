

az provider list --query "[?namespace=='Microsoft.Kubernetes']" --output table


## Tools
1. Install Azure CLI (Ubuntu) -  https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
2. Install kubectl (Ubuntu) - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
3. Validate ```kubectl version --client```
4. Create Service Principal and assign the right permissions and allow Terraform to use the service principal to deploy resources in Azure. https://learn.microsoft.com/en-us/cli/azure/azure-cli-sp-tutorial-1?tabs=bash
5. Export variables in system. (this is for local validation)
```
export ARM_CLIENT_ID="<service_principal_app_id>"
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<service_principal_tenant_id>"
export ARM_CLIENT_SECRET="<service_principal_secret>"
```
This is required to be stored in a safety place. It won't be visible again. It can be recreated.


# ASK checking 

az aks check-acr --resource-group ask-rg --name assessment-cluster --acr repositoryassessment.azurecr.io
