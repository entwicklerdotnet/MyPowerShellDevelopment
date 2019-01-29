Find-Module | where Author -eq waldo | Install-Module

Import-Module Cloud.Ready.Software.NAV

Import-NAVModules


get-command -Module Cloud.Ready.Software.*

Enable-NAVServerInstancePortSharing 