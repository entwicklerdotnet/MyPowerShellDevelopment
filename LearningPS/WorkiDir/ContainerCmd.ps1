clear
docker images

docker ps -a


docker logs myserver

docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore powershell
docker stop  myserver 
docker rm myserver
dir