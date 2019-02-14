& .\BCOMScripting\BCDevImage\BCOm_SetGlobalVar.ps1

Remove-Item  -Path $BCOnPremTempDirZip -recurse #-force

# Installationsordner nach lokal Kopieren
& .\BCOMScripting\BCDevImage\BCOM_Image_PrepareInstallationfiles.ps1
& .\BCOMScripting\BCDevImage\BCOM_CreateBCImage.ps1








#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force