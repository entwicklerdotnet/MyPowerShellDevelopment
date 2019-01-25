# WebServerInstance BCOM-Psys durch gew�nschte Instanz ersetzen
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"



#Remove-NAVWebServerInstance -WebServerInstance DynamicsNAV130
#Remove-NAVWebServerInstance -WebServerInstance "Microsoft Dynamics 365 Business Central Web Client"
#Remove-NAVWebServerInstance -WebServerInstance "BC365-001Web"

#```  RootSite
#ed
#New-NAVWebServerInstance -WebServerInstance BC365-001Web  -Server b001cvs000932 -ServerInstance BC365-001 -SiteDeploymentType RootSite -WebSitePort 50180 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"




#ar
New-NAVWebServerInstance -WebServerInstance BC365-006Web  -Server b001cvs000932 -ServerInstance BC365-006 -SiteDeploymentType RootSite -WebSitePort 50680 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"

#```Subsite
#```
#New-NAVWebServerInstance -WebServerInstance "Microsoft Dynamics 365 Business Central Web Client" -Server b001cvs000932 -ServerInstance BC365-001 -SiteDeploymentType Subsite -ContainerSiteName BC365-001Web -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"

# Bei Bedarf Port anpassen, WebClient weglassen
#http://localhost:8081/BC365/WebClient