#-----------------------------------------------------------------------------------
#optional könne  die Docker dateien auf einem anderen Laufwerk liegen
#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#Windows 10:
#-----------------------------------------------------------------------------------
New-Item "C:\\Docker"
New-Item C:\ProgramData\Docker\config\daemon.json -force -value '{"graph": "C:\\Docker"}'

#-----------------------------------------------------------------------------------
# set bechtle proxy environment var
#-----------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.bechtle.de:80", [EnvironmentVariableTarget]::Machine)

#-----------------------------------------------------------------------------------
# manueller Restart Docker
#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
# Docker for Windows Desktop
<#
Stop-Service com.docker.service -Force
Start-Service Docker
Start-Service com.docker.service
get-Service com.docker.service
#>


#Source: 
#http://www.waldo.be/2017/11/03/dockerwaldo-my-local-demo-environment/

<#
#long way run with docker:
#docker run -e accept_eula=Y --name test -h test -m 4G -e useSSL=N -e licensefile="D:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf" -v D:\Transfer\BCOnPrem:D:\run\my --restart always -e exitonerror=N -e locale=de-de mcr.microsoft.com/businesscentral/onprem
#>
#-----------------------------------------------------------------------------------
#images laden
#-----------------------------------------------------------------------------------
docker pull mcr.microsoft.com/windows/nanoserver
# WindowsCore
docker pull mcr.microsoft.com/windows/servercore
# IIS
docker pull mcr.microsoft.com/windows/servercore/iis
# SQLServer
docker pull microsoft/mssql-server-windows-developer
#-----------------------------------------------------------------------------------
# Business Central On Premise
docker pull mcr.microsoft.com/businesscentral/onprem:de
<##>


#-----------------------------------------------------------------------------------
#PS-Modul für NAvison laden: navcontainerhelper
#-----------------------------------------------------------------------------------
find-module 'navcontainerhelper' | install-module
Write-NavContainerHelperWelcomeText
Install-Package navcontainerhelper

#-----------------------------------------------------------------------------------
#PS-Modul für Navison laden: navcontainerhelper
#-----------------------------------------------------------------------------------
#Install-Module CRS.RemoteNAVDockerHostHelper -Force
$url = "https://github.com/waldo1001/Cloud.Ready.Software.PowerShell/archive/master.zip"
$output = 'C:\DockerShare\BCDevImage\crsmaster.zip'
$start_time = Get-Date

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile $output
Expand-Archive -Path $output -DestinationPath 'C:\DockerShare\BCDevImage'


#-----------------------------------------------------------------------------------
#Entwicklungs- und Testcontainer auf Basis Image mcr.microsoft.com/businesscentral/onprem:DE
#-----------------------------------------------------------------------------------
$MyLicenseFile = "c:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf"

New-CSideDevContainer `
    -containerName 'BCDEVServer' `
    -ImageName mcr.microsoft.com/businesscentral/onprem `
    -licenseFile $MyLicenseFile `
    -memoryLimit 3G `
    -updateHosts `
    -accept_eula `
    -additionalParameters @("--volume ""C:\DockerShare\BCDEVServer:c:\HostFiles""") `
    -Verbose 


New-CSideDevContainer `
    -containerName 'BCTESTServer' `
    -ImageName mcr.microsoft.com/businesscentral/onprem:de `
    -licenseFile $MyLicenseFile `
    -memoryLimit 3G `
    -updateHosts `
    -accept_eula `
    -additionalParameters @("--volume ""C:\DockerShare\BCTestServer:c:\HostFiles""") `
    -Verbose 
        
        
<# Moved to BCOM Demo Containers Administration.ps1>
start 'http://bcdevserver/nav'
start 'http://bctestserver/nav'

Enter-NavContainer BCDEVServer
Get-NavContainerSharedFolders BCDEVServer | Format-List
#> 