Install-Module navcontainerhelper -Force
docker ps -a 
# BC365csidedev   muss vorher angelegt werden
Enter-NavContainer BC365csidedev  

##Manueller Weg ohne cmdlet:
##Commadozeilenfenster als Admin öffnen
#docker exec -itBC365csidedev cmd.exe
##öffnet direkt die shell
##prüfen
#dir
#dir was auch immer-> BC-Programmordner oder z.B. Service tIER ORDNER
#powershell am prompt starten
# hierdrin z.B. Import-module navmgtm.. -disablenamecheckng
# Get-Navserverconfiguration
