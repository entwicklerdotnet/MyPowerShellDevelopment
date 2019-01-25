docker run -it -e accept_eula=Y -m 4G microsoft/365BC 


#docker run --name navserver --hostname navserver --volume c:\myfolder:c:\run\my --env accept_eula=Y --env usessl=N --env username="vmadmin" --env password="P@ssword1" --env ExitOnerror=N --env ClickOnce=Y microsoft/dynamics-nav:2018-de

#docker run -m 3G --name navserver --hostname navserver --env accept_eula=Y --env usessl=N --env username="vmadmin" --env password="P@ssword1" --env ExitOnerror=N --env ClickOnce=Y microsoft/dynamics-nav:2018-de

#docker run --help
docker ps
docker version
#docker images
clear


