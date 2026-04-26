# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "----------------------- Restart Explorer ------------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

#Restart File Explorer.exe
Stop-Process -Name explorer -Force; Start-Process explorer

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"