# Import CRS Module to use its functions, i.e.:
#Import-Module Cloud.Ready.Software.NAV
Import-Module Cloud.Ready.Software.SQL

# dir env:
$SQLServer = 'localhost';
$SQLInstanz = '';
$SQLDbName = 'DevTool';
#$BackupFile = $env:HOMEDRIVE + $env:HOMEPATH + '\' + $SQLDbName + '.bak'
$BackupFile = $SQLDbName + '.bak'


Backup-SQLDatabaseToFile -DatabaseServer $SQLServer -DatabaseInstance $SQLInstanz -DatabaseName $SQLDbName -BackupFile $BackupFile