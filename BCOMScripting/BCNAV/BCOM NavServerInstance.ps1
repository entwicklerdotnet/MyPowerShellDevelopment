
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'
Import-Module -Name "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\RoleTailored Client\NavModelTools.ps1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\Microsoft.Dynamics.Nav.Management.psm1"


Get-NAVServerInstance
$BCOMNavServerInstanz =  "DynamicsNAV130"
Get-NAVServerInstance $BCOMNavServerInstanz 
Set-NAVServerInstance $BCOMNavServerInstanz -Stop
Get-NAVServerInstance $BCOMNavServerInstanz -Start

Set-NAVServerConfiguration