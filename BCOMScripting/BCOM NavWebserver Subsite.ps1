Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NAVWebClientManagement.psm1"
Get-Command

#```  RootSite
#New-NAVWebServerInstance -WebServerInstance DynamicsNAV130  -Server b001cvs000931 -ServerInstance DynamicsNAV130 -SiteDeploymentType RootSite -WebSitePort 50080 -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"

#```  SubSite
New-NAVWebServerInstance -WebServerInstance "Microsoft Dynamics 365 Business Central Web Client" -Server b001cvs000931 -ServerInstance DynamicsNAV130 -SiteDeploymentType Subsite -ContainerSiteName BC130SubSite -PublishFolder "C:\Install\Dynamics\Dynamics365BusinessCentral DE\WebClient\Microsoft Dynamics NAV\130\Web Client\WebPublish"



```  
New-NAVWebServerInstance -WebServerInstance MyNavWebClient -Server NAVServer -ServerInstance NAVServerInstance -SiteDeploymentType RootSite -WebSitePort 8081 -PublishFolder "C:\Web Client\WebPublish"
```
```  
New-NAVWebServerInstance -WebServerInstance MyWebApp -Server NAVServer -ServerInstance NAVServerInstance -SiteDeploymentType Subsite -ContainerSiteName MySiteContainer -WebSitePort 8081 -PublisherFolder "C:\WebClient\WebPublish"
```


#New-NAVWebServerInstance -WebServerInstance  BC130Web -Server b001cvs000931 -ServerInstance DynamicsNAV130 

New-NAVWebServerInstance -WebServerInstance  BC130Web -Server b001cvs000931 -ServerInstance DynamicsNAV130 -AppPoolName "Microsoft Dynamics 365 Business Central Web Client"

Remove-NAVWebServerInstance -WebServerInstance BC130Web

Get-NAVWebServerInstance