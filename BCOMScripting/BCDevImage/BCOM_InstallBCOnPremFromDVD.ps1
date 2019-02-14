
#$Licensefile    = 'c:\HostFiles\bcdevimage\5216086_365BC_Entwickler AG.flf'
$NAVDVD         =  'c:\fileshare\Microsoft Dynamics 365 Business Central'
$Log            = 'c:\fileshare\Log.txt'
$ConfigFile     = join-path $BCOnPremTempDir 'Microsoft Dynamics 365 Business Central\BC365DevEnv.xml'

$InstallationResult = Install-NAV -DVDFolder $NAVDVD -Configfile $ConfigFile -Log $Log

<#>
$null = Import-Module (join-path $InstallationResult.TargetPathX64 'service\navadmintool.ps1' )

write-host -ForegroundColor Green -Object "Installing licensefile '$Licensefile'"
$null = Get-NAVServerInstance | Import-NAVServerLicense -LicenseFile $LicenseFile
write-host -ForegroundColor Green -Object "Restarting $($installationresult.ServerInstance)"
$null = Get-NAVServerInstance  | Set-NAVServerInstance -Restart

#>