#Scripting läuft im Sicherheitskontext, dieser Befehl hebt ale Einschränkungen auf
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Get-ExecutionPolicy -List
# Vorbereitung WindowsServer 2016
<#
Install-Module -Name DockerMsftProvider -Repository PSGallery -force#Install-Package -name docker -ProviderName DockerMsftProvider
Restart-Computer -Force
#>

$DockerPath = "C:\\Docker"
#-----------------------------------------------------------------------------------
#optional könne  die Docker dateien auf einem anderen Laufwerk liegen
#-----------------------------------------------------------------------------------
# Windows Server: New-Item C:\ProgramData\Docker\config\daemon.json -force -value '{"data-root": "MeinLaufwerk":\\MeinVerzeichnis"}'

#-----------------------------------------------------------------------------------
#Windows 10:
#-----------------------------------------------------------------------------------
New-Item C:\ProgramData\Docker\config\daemon.json -force -value '{"graph": "C:\\Docker"}'

#-----------------------------------------------------------------------------------
#Restart Docker
#-----------------------------------------------------------------------------------
Stop-Service Docker -Force
Stop-Service com.docker.service -Force
Start-Service Docker
Start-Service com.docker.service
#alternativ
#Restart-Service docker#
#ReStart-Service com.docker.service

#-----------------------------------------------------------------------------------
#images laden
#-----------------------------------------------------------------------------------
# WindowsCore
docker pull microsoft/windowscore
#-----------------------------------------------------------------------------------
# Business Central On Premise
docker pull mcr.microsoft.com/businesscentral/onprem:de

docker run -e accept-eula=Y -m 3G mcr.microsoft.com/businesscentral/onprem:de
#alternativ testen:
#docker run -e accept_eula=Y --name test -h test -m 4G -e useSSL=N -e licensefile="C:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf" -v C:\Transfer\BCOnPrem:c:\run\my --restart always -e exitonerror=N -e locale=de-de mcr.microsoft.com/businesscentral/onprem


#einige mögliche Parameter:
docker run -e accept-eula=Y 
    -e username="nav_user"
    -e password="nav_user_pw_laut_passwortrichtlinie"
    -e ClickOnce=Y
    -v d:\Docker\MeineDateien:c:\run\my
    -m 2G
    --name dyn365bconprem
    --hostname dyn365
    mcr.microsoft.com/businesscentral/onprem:de
