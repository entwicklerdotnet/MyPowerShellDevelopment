<#>
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'
Import-Module -Name "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\RoleTailored Client\NavModelTools.ps1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\Microsoft.Dynamics.Nav.Management.psm1"
#>
Find-Module | where Author -eq waldo | Install-Module

Import-Module Cloud.Ready.Software.NAV
Import-NAVModules
get-command -Module Cloud.Ready.Software.*
