<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-module?view=powershell-6
#>
# Geladene Module der aktuellen Session anzeigen
Get-Module
# alle lokal installierten  Module anzeigen
Get-Module -ListAvailable

Import-Module PowerShellGet

<# Installieren des SQL Server PowerShell-Moduls #>
Install-Module -Name SqlServer -AllowClobber