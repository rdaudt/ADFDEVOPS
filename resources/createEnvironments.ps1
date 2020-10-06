# script: createEnvironments.ps1
# functionality: 
# - setup azure environments in support of demo about 
#   Azure Data Factory integration with Azure DevOps

# enter a different prefix. Ideally, use your initials as part of the prefix
$prefix = "rd2020" 

# leave it as it is or enter the Azure location that best works for you
$loc = "West US 2"

# create the DEVELOPMENT environment
$env = "dev" 					
$rg = $prefix + "rg" + $env
# create resource group for development environment services
New-AzResourceGroup -Name $rg -Location $loc
# create services for development environment
New-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile ".\azuredeploy.json" -prefix $prefix -env $env

# create the TEST environment
$env = "tst" 
$rg = $prefix + "rg" + $env
# create resource group for test environment
New-AzResourceGroup -Name $rg -Location $loc
# create services for test environment
New-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile ".\azuredeploy.json" -prefix $prefix -env $env

# create the PRODUCTION environment
$env = "prd"
$rg = $prefix + "rg" + $env
# create resource group for production environment
New-AzResourceGroup -Name $rg -Location $loc
# create services for production environment
New-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile ".\azuredeploy.json" -prefix $prefix -env $env