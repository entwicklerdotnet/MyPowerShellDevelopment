# -- command to check docker version
# docker version

#-- Pull Buisness Central DE Version
#docker pull microsoft/bcsandbox:de

#Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
#Install-Module Navcontainerhelper -force
docker images
#docker container ls
New-NavContainer -containerName 365BCInspect -accept_eula Yes -alwaysPull - 