docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker ps -a 
clear
#komplett aufräumen - Images löscht alle images!
docker images
docker rmi e886a855184a

Write-Output $(docker images)
docker rmi e886a855184a
#aktuell fehlermeldungbeio:  docker rmi $(docker images)