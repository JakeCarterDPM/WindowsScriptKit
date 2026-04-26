# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "------------------- Power Profile: Performance ------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

# Apply Performance Power Profile.

Write-Host "Finding Power Profile: Performance..."
$HighPerfGUID = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
$plans = powercfg /list
if ($plans -match $HighPerfGUID) {
}
else {
    powercfg -duplicatescheme $HighPerfGUID | Out-Null
    Write-Host "Creating Power Profile: Performance..."
}

powercfg /setactive $HighPerfGUID
Write-Host "Applying Power Profile: Performance..."

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"