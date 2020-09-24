# What we will be doing in this script.
#   1. Create a resource group
#   2. Deploy Azure services

########## Set before deployment, do not save to repository ##########
$sqlAdminPassword = ConvertTo-SecureString "<<replace>>" -AsPlainText -Force
######################################################################

# Update these according to the environment
$subscriptionName = "Visual Studio Enterprise"
$resourceGroupName = "rg-hybrid-multi-cloud-strategy-2"
$basePath = "C:\Users\elder\OneDrive\Sessions\Creating-a-hybrid-and-multi-cloud-strategy-using-Azure-API-Management"

# Login to Azure
Get-AzSubscription -SubscriptionName $subscriptionName | Set-AzContext

# Create the resource group and deploy the resources
New-AzResourceGroup -Name $resourceGroupName -Location 'West Europe' -Tag @{CreationDate=[DateTime]::UtcNow.ToString(); Project="Creating a hybrid and multi-cloud strategy using Azure API Management"; Purpose="Session"}
New-AzResourceGroupDeployment -Name "HybridMultiCloud" -ResourceGroupName $resourceGroupName -TemplateFile "$basePath\assets\iac\azuredeploy.json" -administratorPassword $sqlAdminPassword

# Optional for debugging, loops through each local file individually
#Get-ChildItem "$basePath\assets\iac" -Recurse -Filter *.json | 
#Foreach-Object {
#    Write-Output "Deploying: " $_.FullName
#    New-AzResourceGroupDeployment -Name Demo -ResourceGroupName $resourceGroupName -TemplateFile $_.FullName -TemplateParameterFile "$basePath\assets\iac\azuredeploy.parameters.json" -ErrorAction Continue
#}