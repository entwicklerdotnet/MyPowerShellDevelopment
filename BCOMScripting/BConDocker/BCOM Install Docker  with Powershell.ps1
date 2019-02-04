# Source: https://gist.github.com/Jaykul/15a6982aad9b6197a537f1ce5a786723

#requires -RunAsAdministrator 
#requires -Version 5.1
function Download {
    [CmdletBinding()]
    param([Parameter(Mandatory)]$url, [Parameter(Mandatory)]$path)
    
    $null = mkdir (Split-Path $path) -Force
    $null = if((Get-Service BITS).Status -eq "Running") {
        Start-BitsTransfer $Url -Destination $Path
    } else {
        Invoke-WebRequest $Url -OutFile $Path
    }
    Get-Item $Path
}

#-----------------------------------------------------------------------------------
# set bechtle proxy environment var
#-----------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.bechtle.de:80", [EnvironmentVariableTarget]::Machine)

#$Installer = Download "https://download.docker.com/win/static/stable/x86_64/docker-17.09.0-ce.zip" "$Env:Temp\InstallDocker.msi"

$DockerInstaller = "N:\CIO-Orga\ASM-BA\Navision\Entwicklung\Installation Docker\Docker for Windows Installer.exe" 
Copy-Item   $DockerInstaller "$Env:Temp\"
$Installer = "$Env:Temp\Docker for Windows Installer.exe"

$Docker = Download "https://aka.ms/tp5/b/dockerd.exe" "$Env:ProgramFiles\docker\dockerd.exe"


## Now install it
#msiexec -i $Installer #-quiet
Start-Process -FilePath $Installer
# HArdcode during test phase no siltent install
Start-Process "C:\Program Files\docker\Docker\Docker for Windows.exe"
#Switch to Windows container
& $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon .

#&$Docker -H npipe:////./pipe/win_engine --service-name=com.docker.windows --register-service

# Ensure the feature is enabled (this was taken care of by the Docker Installer, but for completeness sake) ... 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V, Containers -All

# disabled for windows10
# check if mandatory then update reg-paths for win10
<#
# Temporary Fix for Containers Bug 

#Set-ItemProperty -Path 'HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers' -Name VSmbDisableOplocks -Type DWord -Value 0 -Force

# Make the services easier to tell apart
Set-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\com.docker.windows DisplayName "Docker Engine for Windows"
Set-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\com.docker.windows Description "Windows Containers Server for Docker"

Set-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\com.docker.service DisplayName "Docker Engine for Linux"
Set-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\com.docker.service Description "Linux Containers Server For Docker"

# Temporary location for the docker module
Register-PSRepository -Name DockerPS-Dev -SourceLocation https://ci.appveyor.com/nuget/docker-powershell-dev
Install-Module Docker -Repository DockerPS-Dev -Force

# Start the service(s)
Start-Service com.docker* -Passthru

# Set a hashtable for ease:
$dw = @{ HostAddress = 'npipe://./pipe/win_engine' }
#>

# check if docker is runnung
#services.msc
#Path to docker service
#C:\Program Files\Docker\Docker\Resources\dockerd.exe" --run-service --service-name docker -G BECHTLE\andreas.rohrbach --config-file C:\ProgramData\DockerDesktop\tmp-d4w\daemon.json
#Path to docker for windows service
#"C:\Program Files\Docker\Docker\com.docker.service"
clear
get-service docker
Get-Service com.docker.service
docker.exe pull mcr.microsoft.com/windows/nanoserver:1809
#c:\ProgramData\DockerDesktop\tmp-d4w\
#docker services rstart
restart-service docker
restart-Service com.docker.service
#
#
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
