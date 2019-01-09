
## 
Get-Command -Module Microsoft.Dynamics.Nav.Management, Microsoft.Dynamics.Nav.Apps.Management


## change the config file in that way:
## <netfx40_legacysecuritypolicy enabled="false"/>

Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'

Set-NAVServerConfiguration -KeyName PublicWebBaseURL -ServerInstance Dynamicsnav130 -KeyValue http://localhost:81/dynamicsnav130

Stop-NAVServerInstance -ServerInstance Dynamicsnav130
Start-NAVServerInstance -ServerInstance Dynamicsnav130

