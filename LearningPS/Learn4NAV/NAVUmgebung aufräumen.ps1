docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker ps -a 

#komplett aufräumen - Images löscht alle images!
#docker rmi $(docker images)