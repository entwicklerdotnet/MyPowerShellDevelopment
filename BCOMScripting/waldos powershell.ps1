Find-Module | where Author -eq waldo | Install-Module

Import-Module Cloud.Ready.Software.NAV

Import-NAVModules

get-command -Module Cloud.Ready.Software.*

 <# Enable-NAVServerInstancePortSharing #>
 mport-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'


function Enable-NAVServerInstancePortSharing
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0)]
        [System.String]
        $ServiceInstance = 'DynamicsNAV90'
    )
    write-Host -ForegroundColor Green "Enabling PortSharing for $ServiceInstance"
    Set-NAVServerInstance -ServerInstance $ServiceInstance -Stop -ErrorAction SilentlyContinue

    $null = sc.exe config (get-service NetTcpPortSharing).Name Start= Auto
    $null = Start-service NetTcpPortSharing
    
    $null = sc.exe config (get-service  "*$ServiceInstance*").Name depend= HTTP/NetTcpPortSharing
    
    Set-NAVServerInstance -ServerInstance $ServiceInstance -Start 
}