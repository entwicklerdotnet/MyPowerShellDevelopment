#>clear

<#### Beginn docker config>
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
# set bechtle proxy environment var
#-----------------------------------------------------------------------------------#>
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.bechtle.de:80", [EnvironmentVariableTarget]::Machine)
#-----------------------------------------------------------------------------------
#Restart Docker
#-----------------------------------------------------------------------------------
#>
Stop-Service Docker -Force
Stop-Service com.docker.service -Force
#Start-Service Docker
Start-Service com.docker.service
get-Service com.docker.service
####Ende Docker config
#>


#Source: 
#http://www.waldo.be/2017/11/03/dockerwaldo-my-local-demo-environment/

<#
#long way run with docker:
#docker run -e accept_eula=Y --name test -h test -m 4G -e useSSL=N -e licensefile="C:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf" -v C:\Transfer\BCOnPrem:c:\run\my --restart always -e exitonerror=N -e locale=de-de mcr.microsoft.com/businesscentral/onprem
#>
#-----------------------------------------------------------------------------------
#images laden
#-----------------------------------------------------------------------------------
# WindowsCore
docker pull mcr.microsoft.com/windows/servercore
# IIS
docker pull mcr.microsoft.com/windows/servercore/iis
# SQLServer
# linux docker pull mcr.microsoft.com/mssql/server:2017-latest
#docker pull microsoft/mssql-server-windows-developer
docker pull microsoft/mssql-server-windows-developer
#-----------------------------------------------------------------------------------
# Business Central On Premise
docker pull mcr.microsoft.com/businesscentral/onprem:de
<##>

find-module 'navcontainerhelper' | install-module
Write-NavContainerHelperWelcomeText
Install-Package navcontainerhelper

$MyLicenseFile = "C:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf"

New-CSideDevContainer `
    -containerName 'BCDEVServer' `
    -ImageName mcr.microsoft.com/businesscentral/onprem `
    -licenseFile $MyLicenseFile `
    -memoryLimit 3G `
    -updateHosts `
    -accept_eula `
    -additionalParameters @("--volume ""C:\DockerFiles\BCDEVServer:c:\docker\HostFiles""") `
    -Verbose 



    
New-CSideDevContainer `
    -containerName 'BCTESTServer' `
    -ImageName mcr.microsoft.com/businesscentral/onprem:de `
    -licenseFile $MyLicenseFile `
    -memoryLimit 3G `
    -updateHosts `
    -accept_eula `
    -additionalParameters @("--volume ""C:\DockerFiles\BCDEVServer:c:\docker\HostFiles""") `
    -Verbose 
 
 
<# Moved to BCOM Demo Containers Administration.ps1>
start 'http://bcdevserver/nav'
start 'http://bctestserver/nav'

Enter-NavContainer BCDEVServer
Get-NavContainerSharedFolders BCDEVServer | Format-List
#> 
Enter-NavContainer BCDEVServer
docker ps
