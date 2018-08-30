#$ENV::SetEnvironmentVariable(“HTTP_PROXY”, “http://proxyserver 76:port”, [EnvironmentVariableTarget]::Machine)"

#"$ENV::SetEnvironmentVariable(“HTTP_PROXY”, “http://proxyserver 76:port”, $env:COMPUTERNAME::Machine"

#Invoke-WebRequest https://registry-1.docker.io/v2/

Invoke-WebRequest "https://master.dockerproject.org/windows/x86_64/docker.zip" -OutFile "$env:TEMP\docker.zip" -UseBasicParsing

#docker login -u entwickler@live.de -p test https://registry-1.docker.io/v2/

#restart-service docker
#docker port

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All 

#Add-WindowsFeature -Name RSAT-Hyper-V-Tools

help Get-WindowsOptionalFeature 
Update-Help

Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V 
clear
Import-Module hyper-v

Get-Command -Module hyper-v

docker version
docker ps
docker-machine ls
docker-machine create --driver hyperv default 
# hyper-v deaktivieren/aktivieren
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V /All
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
bcdedit /set hypervisorlaunchtype off
bcdedit /set hypervisorlaunchtype auto

docker --help

Get-VMSwitch
docker ps
docker stop 5ed308ea0de8
docker logs
docker images
#
install-module navcontainerhelper -force
Write-NavContainerHelperWelcomeText
find-module 'navcontainerhelper' | install-module
#

docker network --help
docker network ls
docker inspect nat
docker network prune
docker network prune --help

