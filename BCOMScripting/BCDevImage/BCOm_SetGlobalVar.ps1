clear-host
$DockerVol      = 'C:\DockerShare'
$HostVol        = 'C:\FileShare'
$Licensefile    = '5216086_365BC_Entwickler AG.flf'
$LicenseDir      ='\\bechtle.net\group\CIO-Orga\ASM-BA\Navision\Lizenzierung\Business Central OnPrem'
$NAVDVD         = Join-Path $DockerVol 'Microsoft Dynamics 365 Business Central'
$Log            = Join-Path $DockerVol 'Log.txt'

#Write-Output $Log

$BCOnPremDirServer    = "\\bechtle.net\group\CIO-Orga\ASM-BA\Navision\Entwicklung\Programme\Microsoft Dynamics 365 Business Central"  # Hier muss die aktuelle Versions-DVDF als ZIP Liegen
$BCOnPremTempDir    = $DockerVol  
$BCOnPremClientZip    = Join-Path $BCOnPremTempDir "Microsoft Dynamics 365 Business Central\Dynamics365BusinessCentral DE.zip"
$BCOnPremTempDirZip = Join-Path $BCOnPremTempDir "Microsoft Dynamics 365 Business Central"


