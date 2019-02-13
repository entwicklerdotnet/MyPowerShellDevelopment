clear

<##>
#Docker service verwalten
services.msc
Stop-Service *docker* -Force
get-service *docker*
Start-Service *docker*
get-service *docker*
#>


docker images

docker ps -a


docker logs myserver

docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore powershell
docker stop  myserver 
docker rm myserver
dir