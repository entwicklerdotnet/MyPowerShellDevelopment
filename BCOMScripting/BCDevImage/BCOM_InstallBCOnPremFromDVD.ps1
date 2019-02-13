
#$Licensefile    = 'c:\HostFiles\bcdevimage\5216086_365BC_Entwickler AG.flf'
$NAVDVD         = 'c:\HostFiles\Microsoft Dynamics 365 Business Central'
$Log            = 'C:\HostFiles\Log.txt'

$InstallationResult = Install-NAV -DVDFolder $NAVDVD -Configfile $ConfigFile -Log $Log

$null = Import-Module (join-path $InstallationResult.TargetPathX64 'service\navadmintool.ps1' )

write-host -ForegroundColor Green -Object "Installing licensefile '$Licensefile'"
$null = Get-NAVServerInstance | Import-NAVServerLicense -LicenseFile $LicenseFile
write-host -ForegroundColor Green -Object "Restarting $($installationresult.ServerInstance)"
$null = Get-NAVServerInstance  | Set-NAVServerInstance -Restart

#>