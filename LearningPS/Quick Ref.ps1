Line comment # # This is a line comment
Block comment <#
#>
<#
This is a block or multi-line comment
#>


Special characters
Refer to the following table:
Statement separator ; Get-Command Get-Process; Get-Command Get-Help
Call operator & & ‘Get-Process’ # Invoke the string as a command
& { Get-Process –Id $PID } # Invoke the script block
Dot-source operator . . C:\script.ps1 # Execute the script in the current
scope (instead of its own scope)

'one' -replace 'o','t' `
      -replace 'n','w' `
      -replace 'e','o'`


Write-Host "First`tSecond"