#--------------------------------------------------------------
# Create Image base image is nanhoserver
#--------------------------------------------------------------

Clear-Host
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCDevImage\"BCOMStart.ps1" -Destination C:\DockerFiles\bcdevimage -force
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCDevImage\"BCOM ImportModules.ps1" -Destination C:\DockerFiles\bcdevimage -force
Copy-Item -Path C:\finsql\lizenzen\"5216086_365BC_Entwickler AG.flf" -Destination C:\DockerFiles\bcdevimage -force
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCDevImage\"InstallBCOnPremImageFromDVD.ps1" -Destination C:\DockerFiles\bcdevimage -force


$hostname = "mynanoserver"
#$hostname = "myserver"
docker run --name $hostname  -it -w "c:\HostFiles\BCDevImage" -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/nanoserver


docker start $hostname
docker exec -it $hostname "powershell c:\HostFiles\BCDevImage\BCOMStart.ps1"
docker exec -it $hostname "powershell 'c:\HostFiles\BCDevImage\BCOM ImportModules.ps1'"
docker exec -it $hostname "powershell 'c:\HostFiles\BCDevImage\InstallBCOnPremImageFromDVD.ps1'"
powershell version
in  
docker stop $hostname
docker rm $hostname
docker ps -a

get-command -Module Containers
<#>
#docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore powershell
Clear-Host

docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore
docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/nanoserver
docker start myserver
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCDevImage\"BCOM ImportModules.ps1" -Destination C:\DockerFiles\bcdevimage -force
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCDevImage\"InstallBCOnPremImageFromDVD.ps1" -Destination C:\DockerFiles\bcdevimage -force
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCDevImage\"BCOMStart.ps1" -Destination C:\DockerFiles\bcdevimage -force

#docker exec -it -w "c:\hostfiles"myserver cmd  

docker exec -it  -w "c:\hostfiles\BCDevImage" myserver powershell 
#docker exec -it  -w "c:\hostfiles" myserver powershell; BCOMStart.ps1
docker exec -it  -w "c:\hostfiles\BCDevImage" myserver powershell BCOMStart.ps1
#docker exec myserver cmd exit
#docker exec -it myserver powershell  .\InstallBCOnPremImageFromDVD.ps1
#dir c:\dockerfiles
#dir c:\hostfiles
exit

docker stop  myserver 
docker rm myserver
dir
#>