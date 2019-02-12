<#
clear

$Licensefile    = '\\bechtle.net\group\CIO-Orga\ASM-BA\Navision\Lizenzierung\Business Central OnPrem\5216086_365BC_Entwickler AG.flf'
$NAVDVD         = 'c:\DockerFiles\Microsoft Dynamics 365 Business Central'
$Log            = 'C:\DockerFiles\Log.txt'

# Installationsordner nach lokal Kopieren
$BCOnPremDirServer    = "\\bechtle.net\group\CIO-Orga\ASM-BA\Navision\Entwicklung\Programme\Microsoft Dynamics 365 Business Central"
$BCOnPremTempDir    = "C:\DockerFiles"
$BCOnPremClientZip    =cd Join-Path $BCOnPremTempDir "Microsoft Dynamics 36dir5 Business Central\Dynamics365BusinessCentral DE.zip"
$BCOnPremTempDirZip = Join-Path $BCOnPremTempDir "Microsoft Dynamics 365 Business Central"

$ConfigFile     = join-path $BCOnPremTempDir 'Microsoft Dynamics 365 Business Central\BC365DevEnv.xml'

Copy-Item -Path $BCOnPremDirServer -Destination $BCOnPremTempDir -Force -Recurse

Expand-Archive -Path  $BCOnPremClientZip -DestinationPath $BCOnPremTempDirZip -Force

#>

$Licensefile    = 'c:\HostFiles\bcdevimage\5216086_365BC_Entwickler AG.flf'
$NAVDVD         = 'c:\HostFiles\Microsoft Dynamics 365 Business Central'
$Log            = 'C:\HostFiles\Log.txt'

$InstallationResult = Install-NAV -DVDFolder $NAVDVD -Configfile $ConfigFile -Log $Log

$null = Import-Module (join-path $InstallationResult.TargetPathX64 'service\navadmintool.ps1' )

write-host -ForegroundColor Green -Object "Installing licensefile '$Licensefile'"
$null = Get-NAVServerInstance | Import-NAVServerLicense -LicenseFile $LicenseFile
write-host -ForegroundColor Green -Object "Restarting $($installationresult.ServerInstance)"
$null = Get-NAVServerInstance  | Set-NAVServerInstance -Restart

#>