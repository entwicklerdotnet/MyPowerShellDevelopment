# https://blogs.technet.microsoft.com/canitpro/2016/10/26/step-by-step-setup-docker-on-your-windows-2016-server/

#module
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force

# latest version of Docker  
Install-Package -Name docker -ProviderName DockerMsftProvider
 
 # rebbot the computer
 Restart-Computer -Force


 #-----------------------------------------------------------------------------------
# set bechtle proxy environment var
#-----------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.bechtle.de:80", [EnvironmentVariableTarget]::Machine)

#-----------------------------------------------------------------------------------
#optional könne  die Docker dateien auf einem anderen Laufwerk liegen
#-----------------------------------------------------------------------------------
$DockerPath = "D:\\Docker"
# Windows Server: 
New-Item C:\ProgramData\Docker\config\daemon.json -force -value '{"data-root": "D:\\Docker"}'


Stop-Service docker -Force
get-service docker
Start-Service docker
get-service docker