clear

<#>
#Docker service verwalten
services.msc
Stop-Service *docker* -Force
get-service *docker*
Start-Service *docker*
get-service *docker*
#>

start http://bctestserver/NAV/


start "C:\ProgramData\NavContainerHelper\Extensions\BCTESTServer\Program Files\130\RoleTailored Client\finsql.exe" "servername=BCTESTServer\SQLEXPRESS, Database=Cronusde, ntauthentication=1"
start "C:\ProgramData\NavContainerHelper\Extensions\BCTESTServer\Program Files\130\RoleTailored Client"


start https://hub.docker.com/u/microsoft


Clear-Host
docker version
docker info
start C:\ProgramData\Docker
docker images
docker pull microsoft/dotnet

docker rmi microsoft/dotnet 
docker ps -a
docker rmi 

#docker logs myserver

docker run --name  myserver -it -v "C:\DockerShare:c:\HostShare"  mcr.microsoft.com/windows/servercore
powershell
docker stop  myserver 
docker rm myserver
docker exec -it myserver powershell

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