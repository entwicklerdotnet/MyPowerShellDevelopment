<#

$servicename = "BC365"

Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName ManagementServicesPort -KeyValue 7045
Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName ClientServicesPort -KeyValue 7046
Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName SOAPServicesPort -KeyValue 7047
Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName ODataServicesPort -KeyValue 7048
Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName DeveloperServicesPort -KeyValue 7049
Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName ManagementServicesEnabled -KeyValue true
Set-NAVServerConfiguration -ServerInstance $servicename   -KeyName ClientServicesEnabled -KeyValue true


Set-NAVServerInstance -ServerInstance  $servicename -Restart

Get-NAVServerInstance $servicename
Get-NAVServerConfiguration $servicename
#>

clear
Get-NAVServerInstance | where-Object –Property Version -like "13.0*”  | foreach {
    $Service = $_.ServerInstance
    Write-Host "Working on service $Service"
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName ManagementServicesPort -KeyValue 7045
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName ClientServicesPort -KeyValue 7046
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName SOAPServicesPort -KeyValue 7047
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName ODataServicesPort -KeyValue 7048
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName DeveloperServicesPort -KeyValue 7049
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName ManagementServicesEnabled -KeyValue true
    Set-NAVServerConfiguration -ServerInstance $Service   -KeyName ClientServicesEnabled -KeyValue true
    Set-NAVServerInstance -ServerInstance  $Service    -Restart
    
}
Get-NAVServerInstance | where-Object –Property Version -like "13.0*”  | where-Object {$_.State –eq 'Running'} 

