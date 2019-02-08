
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"

clear
#Get-NAVWebServerInstance
<#
Get-Website
Get-NAVWebServerInstance 
Get-NAVWebServerInstance | where-Object –Property Version -like "13.0*” 
Get-NAVWebServerInstanceConfiguration -KeyName AllowNtlm -WebServerInstance BC365-006Web -ContainerSiteName BC365-006Web -SiteDeploymentType RootSite
Set-NAVWebServerInstanceConfiguration -KeyName AllowNtlm -KeyValue false -WebServerInstance BC365-006Web -ContainerSiteName BC365-006Web -SiteDeploymentType RootSite
#>

Get-NAVWebServerInstance | where-Object –Property Version -like "13.0*” | foreach {
    $Server = $_.Server
    $Service = $_.ServerInstance
    $WebService = $_.WebServerInstance
    $SpnHint = "(net.tcp:/" + $Server + ":7046/" +  $Service +  "/Service)=NoSpn"
    Write-Host "Working on service $Server / $Service / $WebService"
    Write-Host $SpnHint
    Set-NAVWebServerInstanceConfiguration -KeyName AllowNtlm -KeyValue false -WebServerInstance $WebService -ContainerSiteName $WebService -SiteDeploymentType RootSite
    Set-NAVWebServerInstanceConfiguration -KeyName ServerInstance -KeyValue "$Service" -WebServerInstance $WebService -ContainerSiteName $WebService -SiteDeploymentType RootSite
    Set-NAVWebServerInstanceConfiguration -KeyName ClientServicesPort -KeyValue 7046 -WebServerInstance $WebService -ContainerSiteName $WebService -SiteDeploymentType RootSite
    Set-NAVWebServerInstanceConfiguration -KeyName ManagementServicesPort -KeyValue 7045 -WebServerInstance $WebService -ContainerSiteName $WebService -SiteDeploymentType RootSite
    Set-NAVWebServerInstanceConfiguration -KeyName UnknownSpnHint -KeyValue $SpnHint -WebServerInstance $WebService -ContainerSiteName $WebService -SiteDeploymentType RootSite
    
}


# Get-NAVServerInstance | where-Object –Property Version -like "13.0*”  | where-Object {$_.State –eq 'Running'} 
<#
$content = [System.IO.File]::ReadAllText("c:\bla.txt").Replace("[MYID]","MyValue")
[System.IO.File]::WriteAllText("c:\bla.txt", $content)
#>