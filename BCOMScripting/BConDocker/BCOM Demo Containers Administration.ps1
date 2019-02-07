clear

start 'http://bcdevserver/nav'
start 'http://bctestserver/nav'


copy-item -Path "C:\Users\andreas.rohrbach\Documents\Projekte\BCOM ERP2020\Teilprojekte\BCOMOnDocker\files" -Destination "C:\DockerFiles\BCDEVServer" -Recurse -Force

Get-ChildItem "C:\ProgramData\NavContainerHelper\Extensions\Original-13.3.27233.0-de" 

Enter-NavContainer BCDEVServer
cd C:\DockerFiles\BCDEVServer

Get-NavContainerSharedFolders BCDEVServer | Format-List

Get-ChildItem -Path "C:\DockerFiles\BCDEVServer" -Directory | Remove-Item


docker run  --name bcwinserver -h bcwinserver -m 3G -e useSSL=N  -v "C:\DockerFiles\BCWINServer:c:\run\mywinserver"   mcr.microsoft.com/windows/servercore
docker ps -a
docker stop 876594221d9f
docker kill --help
docker kill 876594221d9f 
docker images
##Commadozeilenfenster als Admin öffnen
docker exec -it bcwinserver cmd.exe
##öffnet direkt die shell
##prüfen
dir
#dir was auch immer-> BC-Programmordner oder z.B. Service tIER ORDNER
#powershell am prompt starten
# hierdrin z.B. Import-module navmgtm.. -disablenamecheckng
# Get-Navserverconfiguration

docker ps 