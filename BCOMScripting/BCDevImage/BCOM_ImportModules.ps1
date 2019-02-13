<#>
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'
Import-Module -Name "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\RoleTailored Client\NavModelTools.ps1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\Microsoft.Dynamics.Nav.Management.psm1"
#>
#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
#Find-Module | where Author -eq waldo | Install-Module 


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
#-----------------------------------------------------------------------------------
#PS-Modul für NAvison laden: navcontainerhelper
#-----------------------------------------------------------------------------------
find-module 'navcontainerhelper' | install-module
Write-NavContainerHelperWelcomeText
Install-Package navcontainerhelper
<#>
#-----------------------------------------------------------------------------------
#PS-Modul für Navison laden: navcontainerhelper
#-----------------------------------------------------------------------------------
Install-Module CRS.RemoteNAVDockerHostHelper -Force
Import-Module Cloud.Ready.Software.NAV

Import-NAVModules
get-command -Module Cloud.Ready.Software.*
#>