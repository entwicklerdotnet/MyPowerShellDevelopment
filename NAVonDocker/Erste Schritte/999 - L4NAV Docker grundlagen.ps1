clear

# test of docker läuft, lädt das image herunter und führt den container aus
docker run hello-world


# Anzeige der images
docker ps -a 
# Ausgabe auf ContainerID beschränken
docker ps -a -q

#alle vorhandenen Images wieder löschen
docker rm $(docker ps -a -q)

#docker configuration
New-Item C:\ProgramData\Docker\config\daemon.json -Force -Value '{"data-root": "c:\\docker"}'
# out of date: New-Item C:\ProgramData\Docker\config\daemon.json -Force -Value '{"graph": "c:\\docker"}'

Stop-Service Docker -Force 
Stop-Service  com.docker.service -Force
Start-Service Docker 
Start-Service com.docker.service

#Docker installieren windows server 2016 only??
Install-Module -Name DockerMsftProvider -Force
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force

# Package installieren -> nur windows server !!
Install-Package -Name docker -ProviderName DockerMsftProvider 

Import-Module -Name OneGet
Find-Package | Out-Gridview

#Computer neu starten
Restart-Computer -Force

# öffne c:\Program Files\Docker
# Win cmd docker info
docker info

#welche images habe ich
docker images

docker pull microsoft/dotnet-samples:dotnetapp-nanoserver

docker container ls

docker search microsoft

docker pull microsoft/windowsservercore
docker run -it --name WindowsS1 microsoft/windowsservercore
## powershell
docker run -it --name WindowsS1 microsoft/powershell

docker run -it --name WindowsSDateien microsoft/windowsservercore

docker run -it --name WindowsSMapping -v c:\ContainerMapping:c:\docker\HostDateien microsoft/windowsservercore

# in cmd
docker exec -it WindowsSMapping cmd

docker container ls


# Image wieder entfernen
docker stop neuerserver 
docker rm neuerserver 


docker stop WindowsSMapping
docker rm WindowsSMapping


docker stop WindowsSDateien
docker rm WindowsSDateien


docker stop WindsSDateien
docker rm WindsSDateien


#eignes Image erzeugen in cmd
docker run -it --name neuerserver microsoft/windowsservercore
# in neuerserver webserver installieren: c:\powershell  add-windowsfeature Web-Server
docker commit neuerserver bechtle/neuerservermitwebserver

#docker netzwerk
docker network ls
Get-VMSwitch
docker network inspect nat

docker ps
docker images

docker pull microsoft/mssql-server-windows-developer # funzt net

docker pull mcr.microsoft.com/businesscentral/onprem:de

# eigenes transp netz erzeugen - funzt so noch nicht
docker network create -d transparent --subnet=10.1.26.0/24 --gateway=10.1.26.21 bechtle_translan

docker run -it --name servermitTLAN --network=bechtle_translan --ip=10.1.26.77 bechtle/neuerservermitwebserver

# docker mit ports
docker run -e accept_eula=Y ´    -m 3G                   ´ <# 2 GB RAM reochen aus wenn SQLServer extern ist #> ´
    --name nav2018_ohneportoption ´ <#name des Containers#> ´
    --hostname nav2018_ohneportoption ´ <#name des servers#> ´
    microsoft/danmics-nav:de
docker run -e accept_eula=Y ´    -p 8080:8080 -p80:80 -p 443:443 -p 7045-7049:7045-7049                      ´ <#nav2018_spezportmapping#>  ´
    -m 3G                   ´ <# 2 GB RAM reochen aus wenn SQLServer extern ist #> ´
    --name nav2018_spezportmapping ´ <#name des Containers#> ´
    --hostname nav2018_spezportmapping ´ <#name des Servers#> ´
    microsoft/danmics-nav:de
docker run -e accept_eula=Y ´    -P                      ´ <#alle Ports mit dem Host binden#>  ´
    -m 3G                   ´ <# 2 GB RAM reochen aus wenn SQLServer extern ist #> ´
    --name nav2018_alleports ´ <#name des Containers#> ´
    --hostname nav2018_alleports ´ <#name des Servers#> ´
    microsoft/danmics-nav:de

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker ps -a
docker ps --format "{{.Names}}: {{.Ports}}"
docker ps --no-trunc --format "{{.Command}}"