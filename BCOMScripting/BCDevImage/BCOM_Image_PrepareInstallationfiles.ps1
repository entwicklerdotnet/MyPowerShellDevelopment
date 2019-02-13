#--------------------------------------------------------------
# Prepare Installationfiles
#--------------------------------------------------------------
clear

<# var moved to BCOMStart.ps1>

#>
New-Item -Path $DockerVol -ItemType Directory -Force
Copy-Item -Path $BCOnPremDirServer -Destination $BCOnPremTempDir -Force -Recurse
Copy-Item -Path (Join-Path $LicenseDir $Licensefile) -Destination $BCOnPremTempDirZip -Force -Recurse

Expand-Archive -Path  $BCOnPremClientZip -DestinationPath $BCOnPremTempDirZip -Force

#start $LicenseDir
#start $BCOnPremTempDir