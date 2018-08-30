#dockernat unidentified network
net stop dnscache
net start dnscache
netsh winsock reset


docker ps
docker pull microsoft/nanoserver
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" 5503e2a118ad
ping 172.24.8.93
clear
Start-Service docker
docker pull mcr.microsoft.com/powershell
Stop-Service docker
Get-ContainerNetwork | Remove-ContainerNetwork -force


New-VMSwitch -SwitchName "ArosInternalSwitch" -SwitchType Internal
Get-NetAdapter
New-NetIPAddress -IPAddress 172.16.0.1 -PrefixLength 24 -InterfaceIndex 26
New-NetNat -Name ArosHyperVNAT1 -InternalIPInterfaceAddressPrefix 172.16.0.1/24
Get-NetNat HyperVNAT1
Get-NetNat HyperVNAT1 | Remove-NetNat
cd "C:\Program Files\Docker\Docker\resources"
dockerd -d -–fixed-cidr="172.16.0.1/24" 

import-module servermanager
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider
Restart-Computer -Force
docker network prune --help
docker network prune -f


docker ps
docker stop 897ddd5660d7

