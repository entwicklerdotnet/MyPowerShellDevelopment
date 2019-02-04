
# Umgebungsvariablen:
#http://www.winfaq.de/faq_html/Content/tip0000/onlinefaq.php?h=tip0328.htm
#https://www.windows-faq.de/2017/07/10/windows-umgebungsvariablen-benutzerdefiniert-systemvariablen-bearbeiten/
<#
Quelle: https://www.linetwork.de/ordner-powershell-erstellen-loeschen/
Remove-Item | Einen Ordner oder eine Datei entfernen
Get-Item | Einen Ordner oder eine Datei Anzeigen
Set-Item | Ordner- oder Dateieigenschaften ändern
New-Item | Einen neuen Ordner oder eine neue Datei erstellen
Get-ChildItem | Unterordner anzeigen lassen
#>

<#
Zuerst lassen wir uns alle Ordner und Unterordner von „C:\Temp“ ausgeben und dann überprüfen wir pro Ordner ob dieser Leer ist oder nicht.

Wenn ein Ordner leer ist, dann entfernen wir diesen mit Remove-Item.
$alleordneranzeigen=Get-ChildItem -Path „C:\Temp\“ -Directory -Recurse
foreach($ordner in $alleordneranzeigen)
{
    if(($ordner | Get-ChildItem -Recurse).Count -eq 0)
    {
      Remove-Item -Path $ordner.FullName
    }
}
#>
Remove-Item -Path "C:\ProgramData\Docker"
Remove-Item -Path "C:\ProgramData\DockerDesktop" -force -confirm
#Get-ChildItem -Path „C:\Temp\Testordner1\“ -Directory | Remove-Item # alternative -file oder weglassen für alle

# Verzeichnis, ab dem Rekursiv nach der Datei gesucht wird
$Suchverzeichnis = "X:\"
 
# Datei, welche gesucht wird
$Datei = "update.ini"
 
#Dateiermittlung
Get-ChildItem -Path $Suchverzeichnis -Recurse -Include $Datei | Remove-Item -force -confirm