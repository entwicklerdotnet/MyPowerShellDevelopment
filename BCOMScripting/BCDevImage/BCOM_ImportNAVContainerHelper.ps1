Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
#-----------------------------------------------------------------------------------
#PS-Modul für NAvison laden: navcontainerhelper
#-----------------------------------------------------------------------------------
find-module 'navcontainerhelper' | install-module -force
Install-Package navcontainerhelper

#Write-NavContainerHelperWelcomeText
#get-command -Module navcontainerhelper[]



<#
#### werden erst später in einem bnoch zu erstellenden Skript aufgerufen

Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'
Import-Module -Name "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\RoleTailored Client\NavModelTools.ps1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\Microsoft.Dynamics.Nav.Management.psm1"
#>


<##>
#-----------------------------------------------------------------------------------
#PS-Modul für Navison laden: navcontainerhelper
#-----------------------------------------------------------------------------------
#find-module 'CRS.*' | install-module -force

<#>
Install-Module -Name CRS.NavContainerHelperExtension -Force
Install-Module CRS.RemoteNAVDockerHostHelper -Force
>
Import-Module Cloud.Ready.Software.NAV

Import-NAVModules
get-command -Module Cloud.Ready.Software.*
#>