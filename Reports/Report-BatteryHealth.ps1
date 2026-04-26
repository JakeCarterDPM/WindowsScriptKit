# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "-------------------- Report: Battery Health ---------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

# Generate and open report.
$ErrorActionPreference = "Stop"
try {
    Write-Host "Generating battery report..."

    powercfg /batteryreport | Out-Null

    $path = "$env:USERPROFILE\battery-report.html"

    # Wait until file exists (max ~5 seconds)
    $timeout = 25
    $count = 0
    while (!(Test-Path $path) -and $count -lt $timeout) {
        Start-Sleep -Milliseconds 200
        $count++
    }

    if (!(Test-Path $path)) {
        throw "Battery report was not created."
    }

    Write-Host "Opening report in browser..."
    Start-Process $path
}
catch {
    Write-Host "$($_.Exception.Message)"
}

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"