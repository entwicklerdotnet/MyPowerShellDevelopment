# WebServerInstance BCOM-Psys durch gew�nschte Instanz ersetzen
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"


#```  RootSite
#New-NAVWebServerInstance -WebServerInstance BC365 -Server BC365 -ServerInstance BC365 -SiteDeploymentType RootSite -WebSitePort 8081 -PublishFolder "C:\install_aro\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
New-NAVWebServerInstance -WebServerInstance 'BCOMaro'  -Server localhost  -ServerInstance 'BCOMaro' -ClientServicesPort '64046' -SiteDeploymentType RootSite -WebSitePort 8082  -PublishFolder "C:\install_aro\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"
#```Subsite
#New-NAVWebServerInstance -WebServerInstance BC365 -Server localhost -ServerInstance bc365 -SiteDeploymentType SubSite -ContainerSiteName 'Microsoft Dynamics 365 Business Central Web Client' -WebSitePort 8081 -PublishFolder "C:\inetpub\wwwroot\Microsoft Dynamics 365 Business Central Web Client\"


# Bei Bedarf Port anpassen, WebClient weglassen
#http://localhost:8081/BC365/WebClient