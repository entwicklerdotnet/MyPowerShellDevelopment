<#
Funktion liegt künftig in eigenem Modul IOFunctions
#>
Function pause ($message) 
{ 
    # Check if running Powershell ISE 
    if ($psISE) 
    { 
     Add-Type -AssemblyName System.Windows.Forms 
     [System.Windows.Forms.MessageBox]::Show("$message") 
    } 
    else 
    { 
     Write-Host "$message" -ForegroundColor Yellow 
     $x = [System.Console]::ReadKey()
    } 
} 


clear
Write-Output "Voraussetzungen bitte beachten!!!"
Write-Output "Cloud.Ready.Software Github(https://github.com/waldo1001/Cloud.Ready.Software.PowerShell) muss lokal in d:\BCOM\Scripting liegen"
pause "Bitte beachten Sie die Voraussetzungen! Drücken Sie die Eingabetaste für Weiter"

<#### Beginn docker config>
$DockerPath = "D:\\Docker"
#-----------------------------------------------------------------------------------
#optional könne  die Docker dateien auf einem anderen Laufwerk liegen
#-----------------------------------------------------------------------------------
# Windows Server: New-Item C:\ProgramData\Docker\config\daemon.json -force -value '{"data-root": "MeinLaufwerk":\\MeinVerzeichnis"}'

#-----------------------------------------------------------------------------------
#Windows 10:
#-----------------------------------------------------------------------------------
New-Item C:\ProgramData\Docker\config\daemon.json -force -value '{"graph": "D:\\Docker"}'

#-----------------------------------------------------------------------------------
# set bechtle proxy environment var
#-----------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.bechtle.de:80", [EnvironmentVariableTarget]::Machine)
#-----------------------------------------------------------------------------------
#Restart Docker
#-----------------------------------------------------------------------------------
<#>
#-----------------------------------------------------------------------------------
#Docker EE auf Windows Server 2016
<#
services.msc
docker version
Stop-Service Docker -Force
Start-Service Docker
Get-Service Docker
docker version
#>
#-----------------------------------------------------------------------------------
# Docker for Windows Desktop
<#
Stop-Service com.docker.service -Force
Start-Service Docker
Start-Service com.docker.service
get-Service com.docker.service
####Ende Docker config
#>

#-----------------------------------------------------------------------------------
# set bechtle proxy environment var
#-----------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.bechtle.de:80", [EnvironmentVariableTarget]::Machine)


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
Install-Module CRS.RemoteNAVDockerHostHelper -Force

#-----------------------------------------------------------------------------------
#Entwicklungs- und Testcontainer auf Basis Image mcr.microsoft.com/businesscentral/onprem:DE
#-----------------------------------------------------------------------------------
$MyLicenseFile = "D:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf"

New-CSideDevContainer `
    -containerName 'BCDEVServer' `
    -ImageName mcr.microsoft.com/businesscentral/onprem:DE `
    -licenseFile $MyLicenseFile `
    -memoryLimit 3G `
    -updateHosts `
    -accept_eula `
    -additionalParameters @("--volume ""D:\DockerFiles\BCDEVServer:c:\HostFiles""") `
    -Verbose 


New-CSideDevContainer `
    -containerName 'BCTESTServer' `
    -ImageName mcr.microsoft.com/businesscentral/onprem:de `
    -licenseFile $MyLicenseFile `
    -memoryLimit 3G `
    -updateHosts `
    -accept_eula `
    -additionalParameters @("--volume ""D:\DockerFiles\BCDEVServer:c:\HostFiles""") `
    -Verbose 
 
 
<# Moved to BCOM Demo Containers Administration.ps1>
start 'http://bcdevserver/nav'
start 'http://bctestserver/nav'

Enter-NavContainer BCDEVServer
Get-NavContainerSharedFolders BCDEVServer | Format-List
#> 