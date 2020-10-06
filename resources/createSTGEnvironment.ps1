# script: createSTGEnvironment.ps1
# functionality: 
# - setup STG azure environments in support of demo about 
#   Azure Data Factory integration with Azure DevOps

# enter a different prefix. Ideally, use your initials as part of the prefix
$prefix = "rd2020" 

# leave it as it is or enter the Azure location that best works for you
$loc = "West US 2"

# create the SIT environment
$env = "stg" 					
$rg = $prefix + "rg" + $env
# create resource group for uat environment services
New-AzResourceGroup -Name $rg -Location $loc
# create services for uat environment
New-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile ".\azuredeploy.json" -prefix $prefix -env $env

