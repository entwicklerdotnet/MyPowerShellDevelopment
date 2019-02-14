

$url = "https://github.com/waldo1001/Cloud.Ready.Software.PowerShell/archive/master.zip"
$output = 'C:\FileShare\BCDevImage\crsmaster.zip'
$start_time = Get-Date

<#
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
"The request was aborted: Could not create SSL/TLS secure channel."
#>
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile $output


Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Expand-Archive -Path $output -DestinationPath 'C:\FileShare\BCDevImage'

