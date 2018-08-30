#$mylicense = "C:\FinUpdate\fin.flf"
$myimagename = "microsoft/bcsandbox"
$mycontainer = "arobc365"

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