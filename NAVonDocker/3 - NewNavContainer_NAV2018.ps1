$myimagename = "microsoft/dynamics-nav"
$mycontainer = "aronav2018"
# 'Sichere' Windows-Anmleung mit meinem UserName
if ($credential -eq $null -or $credential -eq
[System.Management.Automation.PSCredential]::Empty) {
$credential = get-credential -UserName $env:USERNAME `
-Message "Please enter your Windows credentials."
}

# Start des Containers 'aronav2018' mit Cronus-Lizenz
New-NavContainer -accept_eula `
-containerName $mycontainer `
-auth Windows `
-credential $credential `
-includeCSide `
-imageName $myimagename `
-updateHosts `
-doNotExportObjectsToText


#docker stop $mycontainer
#Remove-NavContainer $mycontainer
