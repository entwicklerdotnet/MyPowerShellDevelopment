clear
get-service docker
Get-Service com.docker.service

#davon überzeugen, dass der Docker-Service läuft.
docker version

# prüfen nach Abschluss des Vorgangs, dass die herunter­geladenen Basis-Images auf dem System vorhanden sind
docker images #--help

# container übersicht mit status
docker ps -s #--help