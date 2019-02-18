#-----------------------------------------------------------------------------------
#images laden
#-----------------------------------------------------------------------------------
docker pull mcr.microsoft.com/windows/nanoserver
# WindowsCore
docker pull mcr.microsoft.com/windows/servercore
# IIS
docker pull mcr.microsoft.com/windows/servercore/iis
# SQLServer
docker pull microsoft/mssql-server-windows-developer

#-----------------------------------------------------------------------------------
# Business Central On Premise
docker pull mcr.microsoft.com/businesscentral/onprem:de