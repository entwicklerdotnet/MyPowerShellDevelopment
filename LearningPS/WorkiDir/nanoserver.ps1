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