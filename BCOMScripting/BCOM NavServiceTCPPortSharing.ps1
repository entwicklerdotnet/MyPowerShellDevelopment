
# PortSharing auf Auto-Start setzen
sc.exe config (get-service NetTcpPortSharing).Name Start= Auto

# alle NAV-ServerInstanzen anhalten
Get-NAVServerInstance | Set-NAVServerInstance -Stop

# alle NAV-ServerInstanzen  auf auto-start delayed setzen, 
    # verzögert, damit ggfs. andere Dienste vorher starten können, die der NAVService benötigt, insbesondere der SQLServer,falls auf einer Maschine
# und die dependancy auf den PortSharing dienst setzen, sonst wird portsharing vom entsprechenden NAVService nicht genutzt
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