# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "-------------------- Network: Flush and Reset --------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

# Flushing and resetting network
Write-Host "Flushing and resetting network..."

#Release
ipconfig /release
#Flush
ipconfig /flushdns
#Renew
ipconfig /renew
#Reset
netsh int ip reset
netsh winsock reset

#Prompt for reset
$choice = Read-Host "A restart is required to fully apply changes. Restart now? (Y/N)"
if ($choice -match "^[Yy]$") {
    Write-Host "Restarting system..."
    Restart-Computer -Force
} else {
    Write-Host "Restart skipped. Please reboot manually to apply changes."
}

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"