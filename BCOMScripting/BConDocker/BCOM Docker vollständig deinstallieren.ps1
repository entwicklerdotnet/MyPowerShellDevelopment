# Leave swarm mode (this will automatically stop and remove services and overlay networks)
docker swarm leave --force

# Stop all running containers
docker ps --quiet | ForEach-Object {docker stop $_}

#Container, Containerimages, networks  Volumes: Remove from System
docker system prune --volumes --all

# Get Packages docker was installed with
Get-PackageProvider #??not supported??-Name *Docker*

#Remove these packages, i.e.
Uninstall-Package -Name docker -ProviderName DockerMsftProvider
Uninstall-Module -Name DockerMsftProvider

# remove docker devault-network
Get-HNSNetwork | Remove-HNSNetwork

# Remove Docker prgram files
Remove-Item "C:\ProgramData\Docker" -Recurse