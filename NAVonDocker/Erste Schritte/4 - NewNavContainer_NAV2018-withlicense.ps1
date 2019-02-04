Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Get-ExecutionPolicy -List

Import-Module navcontainerhelper

# 'Sichere' Windows-Anmleung mit meinem UserName
$mylicense = "C:\FinUpdate\fin.flf"
$myimagename = "microsoft/dynamics-nav"
$mycontainer = "aronav2018"

if ($credential -eq $null -or $credential -eq
[System.Management.Automation.PSCredential]::Empty) {
$credential = get-credential -UserName $env:USERNAME `
-Message "Please enter your Windows credentials."
}
# Start des Containers 'aronav2018' mit Bechtle-Lizenz
New-NavContainer -accept_eula `
-containerName $mycontainer `
-auth Windows `
-credential $credential `
-includeCSide `
-licensefile $mylicense `
-imageName $myimagename `
-updateHosts

#docker stop "aronav2018"
#Remove-NavContainer $mycontainer

