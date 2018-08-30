
/////

docker ps
docker --version

#docker run hello-world

#docker run --name navserver --hostname navserver --volume c:\myfolder:c:\run\my --env accept_eula=Y --env usessl=N --env username="vmadmin" --env password="P@ssword1" --env ExitOnerror=N --env ClickOnce=Y microsoft/dynamics-nav:2018-de


#docker run -m 3G --name navserver --hostname navserver --env accept_eula=Y --env usessl=N --env username="vmadmin" --env password="P@ssword1" --env ExitOnerror=N --env ClickOnce=Y microsoft/dynamics-nav:2018-de

#docker images

#docker run microsoft/dynamics-nav
#docker run --help

#docker pull microsoft/dynamics-nav
#docker ps

docker run -it -e accept_eula=Y -m 4G microsoft/dynamics-nav 

#-i -d #-name DynamicsNAV2018 

# ping https://registry-1.docker.io
#ping 172.24.4.60
#ipconfig
#docker stop f64d4d01c969
