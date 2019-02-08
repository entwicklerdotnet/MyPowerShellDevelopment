

pause "Press any key to continue"

Funktionsdefinition:

Function pause ($message) 
{ 
    # Check if running Powershell ISE 
    if ($psISE) 
    { 
     Add-Type -AssemblyName System.Windows.Forms 
     [System.Windows.Forms.MessageBox]::Show("$message") 
    } 
    else 
    { 
     Write-Host "$message" -ForegroundColor Yellow 
     $x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown") 
    } 
} 

# mit .Net-Framework
Write-Host -NoNewLine 'Press any key to continue...'; 
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown'); 
Quelle Teilen