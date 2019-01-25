docker pull mcr.microsoft.com/businesscentral/onprem

Write-NavContainerHelperWelcomeText

New-NavContainer -containerName BCOnPrem -imageName mcr.microsoft.com/businesscentral/onprem -accept_eula

docker run -e accept_eula=Y --name test -h test -m 4G -e useSSL=N -e licensefile="C:\FinUpdate\Lizenzen\5216086_365BC_Entwickler AG.flf" -v C:\Transfer\BCOnPrem:c:\run\my --restart always -e exitonerror=N -e locale=de-de mcr.microsoft.com/businesscentral/onprem