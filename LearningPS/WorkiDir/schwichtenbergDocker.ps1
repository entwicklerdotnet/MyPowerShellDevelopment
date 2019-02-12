# https://www.heise.de/developer/artikel/Windows-und-Linux-basierte-Docker-Container-auf-Windows-nutzen-Teil-1-von-2-3735148.html?seite=all

[string] $AktuelleDockerSetupUrl = "https://get.docker.com/builds/Windows/x86_64/docker-17.03.0-ce.zip"
[string] $AktuelleDockerPowerShellUrl = "https://github.com/Microsoft/Docker-PowerShell/releases/download/v0.1.0/Docker.0.1.0.zip"

function Test-IsAdmin {
([Security.Principal.WindowsPrincipal] ↵
[Security.Principal.WindowsIdentity]::GetCurrent())↵
.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

if (-not (Test-IsAdmin)) { Write-Error "Skript erfordert Admin-Rechte!"; ↵
return }

# -------------- Schritt 1
"Installation Windows Container auf Windows 10 - Schritt 1 (Windows-Features)"

[bool] $restart = $false
if ( (Get-WindowsOptionalFeature –Online -FeatureName containers)↵
.State -ne "Enabled")
{
Enable-WindowsOptionalFeature -Online -FeatureName containers -All
$restart = $true
}

if ( (Get-WindowsOptionalFeature –Online -FeatureName Microsoft-Hyper-V)↵
.State -ne "Enabled")
{
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
$restart = $true
}

if ($restart -eq $true) { Restart-Computer -Force; return; }

# -------------- Schritt 2
"Installation Windows Container auf Windows 10 - Schritt 2 (Docker-Werkzeuge)"

# Registry-Einstellung für Docker
Set-ItemProperty -Path 'HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion↵
\Virtualization\Containers' -Name VSmbDisableOplocks -Type DWord -Value 0 -Force

# Docker-Werkzeuge herunterladen. Achtung: Versionsnummer kann sich ändern!
$tempname = "c:\temp\docker-setup.zip"
Invoke-WebRequest $AktuelleDockerSetupUrl -OutFile $tempname -UseBasicParsing
Expand-Archive -Path $tempname -dest $env:ProgramFiles

# Umgebungsvariablen setzen im RAM
$env:path += ";$env:ProgramFiles\Docker"
# Umgebungsvariablen setzen persistent
$existingMachinePath = [Environment]::GetEnvironmentVariable("Path",↵
[System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", $existingMachinePath + ↵
";$env:ProgramFiles\Docker", [EnvironmentVariableTarget]::Machine)

# Docker als Dienst starten
dockerd --register-service
Start-Service Docker
Get-Service Docker
docker --version

# -------------- Schritt 3
"Installation Windows Container auf Windows 10 - Schritt 3 (PowerShell-Modul)"
[string] $AktuelleDockerPowerShellUrlHttp = "https://github.com/Microsoft/Docker-PowerShell/archive/master.zip"
# PowerShell-Modul herunterladen. Achtung: Versionsnummer kann sich ändern!
$tempname = "c:\temp\docker-powershell-setup.zip"
#Invoke-WebRequest $AktuelleDockerPowerShellUrl -OutFile $tempname -UseBasicParsing
Invoke-WebRequest $AktuelleDockerPowerShellUrlHttp -OutFile $tempname -UseBasicParsing
Expand-Archive -Path $tempname -dest "$Home\Documents\WindowsPowerShell\↵
Modules\Docker"
Get-Command -Module Docker 