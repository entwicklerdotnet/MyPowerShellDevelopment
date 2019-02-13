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

$ConfigFile     = join-path $BCOnPremTempDir 'Microsoft Dynamics 365 Business Central\BC365DevEnv.xml'

Remove-Item  -Path $BCOnPremTempDirZip -recurse #-force

# Installationsordner nach lokal Kopieren
& .\BCOMScripting\BCDevImage\BCOM_Image_PrepareInstallationfiles.ps1








#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force