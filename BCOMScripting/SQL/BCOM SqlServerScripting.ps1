clear
<#
#sqlserver services
Get-service *SQL*

Get-service *SQL* | Where-Object {$_.status -eq   "Running"}

#Start-Service ..
#Stop-Service ...
#>


#sqlserver Powershell modul laden
Import-Module SqlServer
<#
dir sqlserver:

Get-ChildItem SQLSERVER:\SQL


$server = Get-Item SQLSERVER:\sql\default
$server.Configuration.Properties 

Set-Location SQLSERVER:\SQL\localhost\default
Get-ChildItem

Set-Location SQLSERVER:\SQL\localhost\default\Databases
Get-ChildItem
get-childitem|Backup-SqlDatabase

#>
Set-Location SQLSERVER:\SQL\localhost\default\Databases
foreach ($db in (Get-ChildItem))
{
   $dbname = $db.Name
   $dt = Get-Date -Format yyyyMMddHHmmss
   $DbPath = "c:\sqldata\backup\"
   $DbBak = "c:\sqldata\backup\$($dbname)_db_$($dt).bak"  # + ".bak"
   Write-Output "Die Sicherungsdatei heistt: $DbBak , wenn die Variables timmt".   
   Backup-SqlDatabase -Database $dbname -BackupFile $DbBak 
   #Backup-SqlDatabase -Database $dbname -BackupFile "$($dbname)_db_$($dt).bak" 
   If (Test-Path  $DbBak)
   {
      $db.drop()
   }
   else
   {
      Write-Error  $dbname + "wurde nicht gesichert, bitte prüfen."
   }
}
Install-NAV -DVDFolder 
<#
help sqlserver

#Get a server object which corresponds to the default instance  
cd \sql\localhost\  
$srv = get-item default  
$srv.Databases
#Create a new database  
$db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $srv, "Test_SMO_Database"  
$db.Create()  

#Reference the database and display the date when it was created.   
$db = $srv.Databases["Test_SMO_Database"]  
$db.CreateDate  

#Drop the database  
$db.Drop()  
#>