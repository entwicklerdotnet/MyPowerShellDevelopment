clear
docker images
docker ps -a
docker rm myserver

docker logs 

#--------------------------------------------------------------
# Prepare Instalaltionfiles
#--------------------------------------------------------------
clear

$Licensefile    = '\\bechtle.net\group\CIO-Orga\ASM-BA\Navision\Lizenzierung\Business Central OnPrem\5216086_365BC_Entwickler AG.flf'
$NAVDVD         = 'c:\DockerFiles\Microsoft Dynamics 365 Business Central'
$Log            = 'C:\DockerFiles\Log.txt'

# Installationsordner nach lokal Kopieren
$BCOnPremDirServer    = "\\bechtle.net\group\CIO-Orga\ASM-BA\Navision\Entwicklung\Programme\Microsoft Dynamics 365 Business Central"
$BCOnPremTempDir    = "C:\DockerFiles"
$BCOnPremClientZip    = Join-Path $BCOnPremTempDir "Microsoft Dynamics 365 Business Central\Dynamics365BusinessCentral DE.zip"
$BCOnPremTempDirZip = Join-Path $BCOnPremTempDir "Microsoft Dynamics 365 Business Central"

$ConfigFile     = join-path $BCOnPremTempDir 'Microsoft Dynamics 365 Business Central\BC365DevEnv.xml'

Copy-Item -Path $BCOnPremDirServer -Destination $BCOnPremTempDir -Force -Recurse

dir
#--------------------------------------------------------------


#docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore powershell
docker run --name  myserver -it -v "C:\DockerFiles:c:\HostFiles"  mcr.microsoft.com/windows/servercore
docker start myserver
Copy-Item -Path C:\GIT\PowerShellScripts\BCOMScripting\BCNAV\InstallBCOnPremImageFromDVD.ps1 -Destination C:\DockerFiles\InstallBCOnPremImageFromDVD.ps1 -force
docker start myserver
docker exec -it myserver powershell 
#docker exec -it myserver powershell  .\InstallBCOnPremImageFromDVD.ps1
#dir c:\dockerfiles
#dir c:\hostfiles
exit

docker stop  myserver 
docker rm myserver
dir
#>