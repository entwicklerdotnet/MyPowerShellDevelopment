#Scripting läuft im Sicherheitskontext, dieser Befehl hebt ale Einschränkungen auf
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
# Prüfung Hat's geklappt?
Get-ExecutionPolicy -List
#Module mit den benötigten Powersehll-Commands für NAV on Docker
Import-Module navcontainerhelper
# Variable welches Imgae gezogen wird
# NAV2018 aktuellstes CU
$imageNameTag = "microsoft/dynamics-nav"
# Business Central aktuellstes CU
#"$imageNameTag =microsoft/bcsandbox"
#lädt as angegebene Image herunter
docker pull $imageNameTag