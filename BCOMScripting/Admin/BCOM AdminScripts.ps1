<#
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'
Import-Module -Name "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\RoleTailored Client\NavModelTools.ps1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\Microsoft.Dynamics.Nav.Management.psm1"
#>
# Install nuget Provider 

$env:psmodulepath 

Get-PackageProvider
Register-PSRepository -Name "PSGallery" –SourceLocation "https://www.powershellgallery.com/api/v2/" -InstallationPolicy Trusted
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Find-Module | where Author -eq waldo | Install-Module

Import-Module Cloud.Ready.Software.NAV
Import-NAVModules
get-command -Module Cloud.Ready.Software.*

#sqlserver
Import-Module SqlServer

# Upload a license file https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/import-navserverlicense?view=businesscentral-ps
Import-NAVServerLicense BCOMaro -LicenseData ([Byte[]]$(Get-Content -Path "C:\FinUpdate\Lizenzen\NAV2018_2017-12-05.flf" -Encoding Byte))

Restart-NAVServerInstance -ServerInstance BCOMaro

# Test-NAVTenantDatabaseSchema -ServerInstance BCOMaro 
# Sync-NAVTenantDatabase -ServerInstance BCOMaro -Id BCOMaro@localhost
Sync-NAVTenant -ServerInstance BCOMaro 


Sync-NAVApp -ServerInstance BCOMaro -Name "BCOMaro"
