docker ps -a 

Install-Module navcontainerhelper -Force

Write-NavContainerHelperWelcomeText

New-csidedevcontainer -accept_eula BCcsidedev -doNotExportObjectsToText mcr.microsoft.com/businesscentral/onprem:de