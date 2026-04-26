# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "-------------------- List Installed Products --------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

Write-Host "Loading installed products..."
# List products

# Suggested one?
# Get-WmiObject Win32_Product

#Barnacules Nerdgasm method
# Get-AppXPackage
# Get-AppxPackage|Findstr [AppHint]
# Remove-AppXPackage -package [packagefullname]

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"