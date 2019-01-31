Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'

Import-Module -Name "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\RoleTailored Client\NavModelTools.ps1"

Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"

#sqlserver
Import-Module SqlServer

# Upload a license file https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/import-navserverlicense?view=businesscentral-ps
Import-NAVServerLicense BCOMaro -LicenseData ([Byte[]]$(Get-Content -Path "C:\FinUpdate\Lizenzen\NAV2018_2017-12-05.flf" -Encoding Byte))

Restart-NAVServerInstance -ServerInstance BCOMaro

# Test-NAVTenantDatabaseSchema -ServerInstance BCOMaro 
# Sync-NAVTenantDatabase -ServerInstance BCOMaro -Id BCOMaro@localhost
Sync-NAVTenant -ServerInstance BCOMaro 


Sync-NAVApp -ServerInstance BCOMaro -Name "BCOMaro"
