Clear-Host

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
docker ps --help
docker ps -q

docker rm --help

docker ps -q | docker rm 
docker logs myserver


docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore powershell
docker stop  myserver 
docker rm myserver

docker ps -a
$mycont = 'BCTESTServer'
docker stop $mycont 
docker rm $mycont

