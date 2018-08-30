#Sicherheitsrichtlinien deaktivieren
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
#Hyper-V aktivieren-> erforert Neustart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
#Container aktivieren
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All

#Docker-Website muss von der Website heruntergeladen werden
https://docs.docker.com/docker-for-windows/install/#download-docker-for-windows

#Im Docker System tray Befehl Switch to Windows containers ausführen.

#davon überzeugen, dass der Docker-Service läuft.
docker version

#nicht erforderlich nur zum üben reinkommen
#Um ein Basis-Image herunterzuladen, gibt man für Nano Server
docker pull microsoft/nanoserver

# prüfen nach Abschluss des Vorgangs, dass die herunter­geladenen Basis-Images auf dem System vorhanden sind
docker images 

#nur zum Üben (s.o.)
#Dieses Kommando startet einen Container auf Basis des Nano-Images in einer inter­aktiven Session und öffnet dort die Eingabeauf­forderung.
docker run -it microsoft/nanoserver cmd

clear
