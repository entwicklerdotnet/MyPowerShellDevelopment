#Start the service(s)
Start-Service com.docker* -Passthru

# Set a hashtable for ease:
$dw = @{ HostAddress = 'npipe://./pipe/win_engine' }
#>

# check if docker is runnung
#services.msc
#Path to docker service
#C:\Program Files\Docker\Docker\Resources\dockerd.exe" --run-service --service-name docker -G BECHTLE\andreas.rohrbach --config-file C:\ProgramData\DockerDesktop\tmp-d4w\daemon.json
#Path to docker for windows service
#"C:\Program Files\Docker\Docker\com.docker.service"
clear
get-service docker
Get-Service com.docker.service
docker.exe pull mcr.microsoft.com/windows/nanoserver:1809
#c:\ProgramData\DockerDesktop\tmp-d4w\
#docker services rstart
restart-service docker
restart-Service com.docker.service
#
#
#davon überzeugen, dass der Docker-Service läuft.
docker version

#nicht erforderlich nur zum üben reinkommen
#Um ein Basis-Image herunterzuladen, gibt man für Nano Server
docker pull microsoft/nanoserver

# prüfen nach Abschluss des Vorgangs, dass die herunter­geladenen Basis-Images auf dem System vorhanden sind
docker images 