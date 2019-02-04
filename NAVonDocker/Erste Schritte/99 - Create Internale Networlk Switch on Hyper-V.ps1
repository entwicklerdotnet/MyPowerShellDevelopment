New-VMSwitch -SwitchName "InternalSwitch" -SwitchType Internal
New-NetIPAddress -IPAddress 172.21.31.1 -PrefixLength 24 -InterfaceAlias "vEthernet (InternalSwitch)"
New-NetNat -Name MyInternalnetwork -InternalIPInterfaceAddressPrefix 172.21.31.0/24