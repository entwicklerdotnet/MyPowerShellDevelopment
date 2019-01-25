#Remove-NAVServerInstance -ServerInstance bc130ua
Remove-NAVServerInstance -ServerInstance bc365-002
clear

#001
Get-Credential | New-NAVServerInstance -ManagementServicesPort 50145 -ServerInstance BC365-001 -ClientServicesPort 50146 -DatabaseName BC365-001 -DatabaseServer b001cvs000932 -DeveloperServicesPort 50149 -ODataServicesPort 50148 -ServiceAccount User -SOAPServicesPort 50147
#002
Get-Credential | New-NAVServerInstance -ManagementServicesPort 50245 -ServerInstance BC365-002 -ClientServicesPort 50246 -DatabaseName BC365-001 -DatabaseServer b001cvs000932 -DeveloperServicesPort 50249 -ODataServicesPort 50248 -ServiceAccount User -SOAPServicesPort 50247
#003
Get-Credential | New-NAVServerInstance -ManagementServicesPort 50345 -ServerInstance BC365-003 -ClientServicesPort 50346 -DatabaseName BC365-001 -DatabaseServer b001cvs000932 -DeveloperServicesPort 50349 -ODataServicesPort 50348 -ServiceAccount User -SOAPServicesPort 50347
#004
Get-Credential | New-NAVServerInstance -ManagementServicesPort 50445 -ServerInstance BC365-004 -ClientServicesPort 50446 -DatabaseName BC365-001 -DatabaseServer b001cvs000932 -DeveloperServicesPort 50449 -ODataServicesPort 50448 -ServiceAccount User -SOAPServicesPort 50447
#005
Get-Credential | New-NAVServerInstance -ManagementServicesPort 50545 -ServerInstance BC365-005 -ClientServicesPort 50546 -DatabaseName BC365-001 -DatabaseServer b001cvs000932 -DeveloperServicesPort 50549 -ODataServicesPort 50548 -ServiceAccount User -SOAPServicesPort 50547
#006
Get-Credential | New-NAVServerInstance -ManagementServicesPort 50645 -ServerInstance BC365-006 -ClientServicesPort 50646 -DatabaseName BC365-001 -DatabaseServer b001cvs000932 -DeveloperServicesPort 50649 -ODataServicesPort 50648 -ServiceAccount User -SOAPServicesPort 50647
