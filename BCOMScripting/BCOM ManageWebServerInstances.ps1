# WebServerInstance BCOM-Psys durch gew�nschte Instanz ersetzen
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"

clear

#Remove-NAVWebServerInstance -WebServerInstance DynamicsNAV130
#Remove-NAVWebServerInstance -WebServerInstance "Microsoft Dynamics 365 Business Central Web Client"
#Remove-NAVWebServerInstance -WebServerInstance "BC365-001Web"

#```  RootSite
New-NAVWebServerInstance -WebServerInstance DynamicsNAV130  -Server b001cvs000931 -ServerInstance DynamicsNAV130 -SiteDeploymentType RootSite -WebSitePort 50080 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#ed
#New-NAVWebServerInstance -WebServerInstance BC365-001Web  -Server b001cvs000931 -ServerInstance BC365-001 -SiteDeploymentType RootSite -WebSitePort 50180 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#NN
New-NAVWebServerInstance -WebServerInstance BC365-002Web  -Server b001cvs000931 -ServerInstance BC365-002 -SiteDeploymentType RootSite -WebSitePort 50280 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#NN
New-NAVWebServerInstance -WebServerInstance BC365-003Web  -Server b001cvs000931 -ServerInstance BC365-003 -SiteDeploymentType RootSite -WebSitePort 50380 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#NN
New-NAVWebServerInstance -WebServerInstance BC365-004Web  -Server b001cvs000931 -ServerInstance BC365-004 -SiteDeploymentType RootSite -WebSitePort 50480 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#NN
New-NAVWebServerInstance -WebServerInstance BC365-005Web  -Server b001cvs000931 -ServerInstance BC365-005 -SiteDeploymentType RootSite -WebSitePort 50580 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#ar
#New-NAVWebServerInstance -WebServerInstance BC365-006Web  -Server b001cvs000931 -ServerInstance BC365-006 -SiteDeploymentType RootSite -WebSitePort 50680 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"

#```Subsite
#```
#New-NAVWebServerInstance -WebServerInstance "Microsoft Dynamics 365 Business Central Web Client" -Server b001cvs000931 -ServerInstance BC365-001 -SiteDeploymentType Subsite -ContainerSiteName BC365-001Web -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"

# Bei Bedarf Port anpassen, WebClient weglassen
#http://localhost:8081/BC365/WebClient


Remove-NAVWebServerInstance -WebServerInstance BC365