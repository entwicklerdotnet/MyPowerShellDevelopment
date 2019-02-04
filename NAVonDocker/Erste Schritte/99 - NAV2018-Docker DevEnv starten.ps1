#Scripting läuft im Sicherheitskontext, dieser Befehl hebt ale Einschränkungen auf
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#Module mit den benötigten Powersehll-Commands für NAV on Docker
Import-Module navcontainerhelper
# Variable welches Imgae gezogen wird
$imageNameTag = "microsoft/dynamics-nav"
#lädt as angegebene Image herunter
docker pull $imageNameTag


# löscht die Umgebung aronav2018
docker rm aronav2018 -f
# startet NAV2018 als "Host"aronav2018, ist hierüber ansprechbar
docker run --name aronav2018
           -hostname aronav2018
           -volume c:\myfolder:c:\run\my
           -env accept_eula=Y
           -env usessl=N
           -env username="vmadmin"
           -env password="P@ssword1"
           -env ExitOnerror=N
           -env ClickOnce=Y            
           $imageNameTag
