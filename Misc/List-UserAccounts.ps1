# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "----------------------- List User Accounts -----------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

Write-Host "Loading user accounts..."
# List products
wmic useraccount list brief
#CMD NUMBER OF LOGONS wmic netlogin where (name like "%%USERNAME%%") get numberoflogons
#LESS DETAILED LIST: net user

# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"