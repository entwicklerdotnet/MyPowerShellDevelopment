Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'

clear

<#
$(Get-NAVServerInstance ) 


#$ServiceInstance = 'DynamicsNAV130'
$ServiceInstance = 'BC365-006'
$null = sc.exe config (get-service NetTcpPortSharing).Name Start= Auto
$null = Start-service NetTcpPortSharing
#$null = sc.exe config  MicrosoftDynamicsNavServer$DynamicsNAV130 depend= HTTP/NetTcpPortSharing
$null = sc.exe config  $ServiceInstance depend= HTTP/NetTcpPortSharing
Set-NAVServerInstance -ServerInstance $ServiceInstance -Start     
#$null = sc.exe config (get-service  "*$ServiceInstance*").Name depend= HTTP/NetTcpPortSharing
#>



Stop-Service "NetTcpPortSharing"
# Set Startup Mode for NetTcpPortSharing to Manual
# Quelle: https://dynamics.is/?tag=nav-service
$command = ‘sc.exe \\$Computer config "NetTcpPortSharing" start= demand’
$Output = Invoke-Expression -Command $Command -ErrorAction Stop
 if($LASTEXITCODE -ne 0){
 Write-Error "$Computer : Failed to set NetTcpPortSharing to manual start. More details: $Output"
 }

<#
 Similar script is used to update the existing NAV Services to both delayed start and Tcp Port Sharing dependency.
[code lang=”powershell”]
#>
#Stop NAV Server Instances
Get-NAVServerInstance | Set-NAVServerInstance -Stop
#Update Startup Type and Dependency on NAV Server Instances
Get-NAVServerInstance | foreach {
    $Service = $_.ServerInstance
    Write-Host "Working on service $Service"
    $Computer = ‘LOCALHOST’
    $command = ‘sc.exe \\$Computer config "$Service" start= delayed-auto’
    $Output = Invoke-Expression -Command $Command -ErrorAction Stop
    if($LASTEXITCODE -ne 0){
      Write-Error "$Computer : Failed to set $Service to delayed start. More details: $Output"
    }
    $command = ‘sc.exe \\$Computer config "$Service" depend= NetTcpPortSharing/HTTP’
    $Output = Invoke-Expression -Command $Command -ErrorAction Stop
    if($LASTEXITCODE -ne 0){
      Write-Error "$Computer : Failed to set $Service TcpPortSharing. More details: $Output" -foregroundcolor red
    }

}
#Start NAV Server Instances
Get-NAVServerInstance | Set-NAVServerInstance -Start
# [/code]

