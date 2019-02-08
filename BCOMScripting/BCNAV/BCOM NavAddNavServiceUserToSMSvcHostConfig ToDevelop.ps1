﻿Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'

<#
This script will search for the SMSvcHost.exe.config file, load it and check to see if the NAV Service User is already allowed access.
If not then the config file is updated and saved.  
This script must be executed with administrative privileges.
Quelle: https://dynamics.is/?tag=nav-service
#>

clear
#Modify User and Domain to fit your environment
$UserToAdd = ‘FIN’
$UserDomainToAdd = ‘BECHTLE.NET’

#Initial Values
$UserSidFound = ‘false’
$ConfigurationSet = ‘false’

#Net.Tcp Port Sharing Service Name
$ServiceName = ‘NetTcpPortSharing’

#Get SID for the Service User
# Convert error Invalid Parameter: $UserSid = ([wmi] "win32_userAccount.Domain=’$UserDomainToAdd’,Name=’$UserToAdd’").SID
# look here maby it helps: https://www.lifewire.com/how-to-find-a-users-security-identifier-sid-in-windows-2625149
# My solution found here: 2776-powershell-sid-to-user-and-user-to-sid
$objUser = New-Object System.Security.Principal.NTAccount("BECHTLE", "FIN") 
$UserSid  = $objUser.Translate([System.Security.Principal.SecurityIdentifier]) 
#Get Path for SMSvcHost.exe.config file
$SMSvcHostPath = (Get-WmiObject win32_service | ?{$_.Name -like $ServiceName} ).PathName
$SMSvcHostPathConfig = $SMSvcHostPath + ‘.config’

Write-Host "Reading XML from $SMSvcHostPathConfig"
#Read Config file
$xmlDoc = [xml] (Get-Content $SMSvcHostPathConfig)

Write-Host "Looking for access permission for $UserSid"
#Loop through allowed accounts and search for the service user Sid
$allowAccounts = Select-Xml "configuration/system.serviceModel.activation/net.tcp/allowAccounts/add" $xmlDoc
$allowAccounts | ForEach-Object {
    $ConfiguredSid = $_.Node.Attributes.Item(0).Value
    if ($ConfiguredSid -eq $UserSid) 
    {
        $UserSidFound = ‘true’
    }
    $ConfigurationSet = ‘true’
    Write-Host "Found SID $ConfiguredSid"
}

#Act if Access Configuration is not enabled
if ($ConfigurationSet -eq ‘false’) 
{
    Write-Host "Access permission not configured"
    $config = [xml] ‘<system.serviceModel.activation>
    <net.tcp listenBacklog="10" maxPendingConnections="100" maxPendingAccepts="2" receiveTimeout="00:00:10" teredoEnabled="false">
    <allowAccounts>
    <add securityIdentifier="S-1-5-18"/>
    <add securityIdentifier="S-1-5-19"/>
    <add securityIdentifier="S-1-5-20"/>
    <add securityIdentifier="S-1-5-32-544" />
    </allowAccounts>
    </net.tcp>
    <net.pipe maxPendingConnections="100" maxPendingAccepts="2" receiveTimeout="00:00:10">
    <allowAccounts>
    <add securityIdentifier="S-1-5-18"/>
    <add securityIdentifier="S-1-5-19"/>
    <add securityIdentifier="S-1-5-20"/>
    <add securityIdentifier="S-1-5-32-544" />
    </allowAccounts>
    </net.pipe>
    <diagnostics performanceCountersEnabled="true" />
    </system.serviceModel.activation>’

    $configurationNode = $xmlDoc.DocumentElement
    $newConfig = $xmlDoc.ImportNode($config.DocumentElement, $true)
    $configurationNode.AppendChild($newConfig)

    $allowAccounts = Select-Xml "configuration/system.serviceModel.activation/net.tcp/allowAccounts/add" $xmlDoc
    $allowAccounts | ForEach-Object 
    {
        $ConfiguredSid = $_.Node.Attributes.Item(0).Value
        Write-Host "Found SID $ConfiguredSid"
        if ($ConfiguredSid -eq $UserSid) 
        {
            $UserSidFound = ‘true’
        }
        $ConfigurationSet = ‘true’
    }

}

#Add Service User Sid if needed
if ($UserSidFound -ne ‘true’) {
    $nettcp = $xmlDoc.SelectSingleNode("configuration/system.serviceModel.activation/net.tcp/allowAccounts")
    $addNode = $xmlDoc.CreateElement(‘add’)
    $secIden = $xmlDoc.CreateAttribute(‘securityIdentifier’)
    $secIden.Value = $UserSid
    $addNode.Attributes.Append($secIden)

    $nettcp.AppendChild($addNode)
    $xmlDoc.Save($SMSvcHostPathConfig)
    Write-Host "Configuration Updated"
    #Restart Service if running
    if ((Get-Service NetTcpPortSharing).Status -eq "Running") 
    {
    Restart-Service NetTcpPortSharing -Force
    }
}

