# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "------------------- Enable PowerShell Scripts -------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

# Enable scripts
Write-Host "Enabling script execution..."
powershell "Set-ExecutionPolicy Unrestricted -force"

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"