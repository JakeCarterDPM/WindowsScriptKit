# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "---------------------- Report: Disk Space -----------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

# Generate and open report.
Write-Host "Generating disk space report..."

# Threshold for warning (% free space minimum)
$threshold = 20
# Array to hold warnings
$warnings = @()

# --- Normalise MediaType (some HDDs report as "Unspecified") ---
function Get-NormalisedMediaType ($physDisk) {
    if ($physDisk.MediaType -eq "SSD") { return "SSD" }
    if ($physDisk.MediaType -eq "HDD") { return "HDD" }
    # "Unspecified" — SpindleSpeed > 0 means it's rotating (HDD)
    if ($physDisk.SpindleSpeed -and $physDisk.SpindleSpeed -gt 0) { return "HDD" }
    return "HDD"   # default unrecognised to HDD
}

# --- Build a lookup: DriveLetter -> PhysicalDisk ---
$letterToDisk = @{}
Get-PhysicalDisk | ForEach-Object {
    $physDisk = $_
    Get-Disk -Number $physDisk.DeviceId -ErrorAction SilentlyContinue |
        Get-Partition -ErrorAction SilentlyContinue |
        Get-Volume -ErrorAction SilentlyContinue |
        Where-Object { $_.DriveLetter } |
        ForEach-Object {
            $letterToDisk[$_.DriveLetter] = $physDisk
        }
}

# --- Group volumes by physical disk number ---
$diskGroups = @{}

Get-Volume | Where-Object { $_.DriveLetter -and $_.Size -gt 0 } | ForEach-Object {
    $vol    = $_
    $letter = $vol.DriveLetter
    $phys   = $letterToDisk[$letter]

    if ($phys) {
        $diskNum = $phys.DeviceId
    } else {
        $diskNum = "Unknown_$letter"
    }

    if (-not $diskGroups.ContainsKey($diskNum)) {
        $diskGroups[$diskNum] = @{
            PhysicalDisk = $phys
            MediaType    = if ($phys) { Get-NormalisedMediaType $phys } else { "Unknown" }
            FriendlyName = if ($phys) { $phys.FriendlyName } else { "Unknown Disk" }
            Letters      = [System.Collections.Generic.List[char]]@()
            Volumes      = @{}
        }
    }

    $diskGroups[$diskNum].Letters.Add($letter)
    $diskGroups[$diskNum].Volumes[$letter] = $vol
}

# --- Helper: compute per-disk summary for sorting ---
function Get-DiskSummary ($group) {
    $totalGB = 0
    $freeGB  = 0
    foreach ($letter in $group.Letters) {
        $vol = $group.Volumes[$letter]
        $totalGB += [math]::Round($vol.Size          / 1GB, 2)
        $freeGB  += [math]::Round($vol.SizeRemaining / 1GB, 2)
    }
    $recommendedFree = [math]::Round($totalGB * ($threshold / 100), 2)
    $gbTillLimit     = [math]::Round($freeGB - $recommendedFree, 2)
    return @{ TotalGB = $totalGB; FreeGB = $freeGB; GbTillLimit = $gbTillLimit }
}

# --- Sort: SSD first, then HDD, then Unknown; within each type sort by GbTillLimit ascending ---
$sorted = $diskGroups.GetEnumerator() | Sort-Object {
    $group = $_.Value
    $mediaOrder = switch ($group.MediaType) {
        'SSD'     { 0 }
        'HDD'     { 1 }
        default   { 2 }
    }
    $summary = Get-DiskSummary $group
    [double]($mediaOrder * 1e9 + $summary.GbTillLimit)
}

# --- Header ---
Write-Host ""
Write-Host "Disk Space Report:"
$headerFormat = "{0,-4} | {1,-17} | {2,-5} | {3,-10} | {4,-6} | {5,-10} | {6}"
Write-Host ($headerFormat -f "Type", "Disk Name", "Letters", "Total", "% Free", "Free Space", "GB Till Limit")
Write-Host ("-" * 95)

# --- For Each Drive ---
$diskIndex = 1
foreach ($entry in $sorted) {
    $group   = $entry.Value
    $phys    = $group.PhysicalDisk
    $letters = $group.Letters | Sort-Object

    $diskLabel = if ($phys) {
        $phys.FriendlyName.Substring(0, [math]::Min(18, $phys.FriendlyName.Length))
    } else { "Unknown" }

    $diskTotalGB = 0
    $diskFreeGB  = 0
    foreach ($letter in $letters) {
        $vol = $group.Volumes[$letter]
        $diskTotalGB += [math]::Round($vol.Size          / 1GB, 2)
        $diskFreeGB  += [math]::Round($vol.SizeRemaining / 1GB, 2)
    }

    $diskRecommendedFree = [math]::Round($diskTotalGB * ($threshold / 100), 2)
    $diskGbTillLimit     = [math]::Round($diskFreeGB - $diskRecommendedFree, 2)
    $diskFreePct         = if ($diskTotalGB -gt 0) {
        [math]::Round(($diskFreeGB / $diskTotalGB) * 100, 2)
    } else { 0 }
    $diskFreePctStr      = $diskFreePct.ToString("F2") + "%"

    $mediaType = $group.MediaType

    # Row colour: white = ok, red = SSD warning, yellow = HDD warning
    $diskColor = if ($diskGbTillLimit -ge 0) {
        "White"
    } elseif ($mediaType -eq "SSD") {
        "Red"
    } else {
        "Yellow"
    }

    $gbTillLimitStr = if ($diskGbTillLimit -lt 0) {
        "$diskGbTillLimit GB (OVER LIMIT)"
    } else {
        "$diskGbTillLimit GB left"
    }

    $lettersStr  = ($letters | ForEach-Object { "$_" }) -join " "
    $diskTotalStr = "${diskTotalGB}GB"
    $diskFreeStr  = "${diskFreeGB}GB"

    Write-Host ($headerFormat -f $mediaType, $diskLabel, $lettersStr, $diskTotalStr, $diskFreePctStr, $diskFreeStr, $gbTillLimitStr) -ForegroundColor $diskColor

    # Collect warning as object so we can colour it correctly later
    if ($diskGbTillLimit -lt 0) {
        $neededGB = [math]::Round([math]::Abs($diskGbTillLimit), 2)
        $warnings += @{ Message = " - Clear ${neededGB} GB on drive(s) '$lettersStr' | '$diskLabel'"; MediaType = $mediaType }
    }

    $diskIndex++
}

# --- Final Report ---
Write-Host ("-" * 95)
Write-Host ""
Write-Host "Suggested Actions:"
if ($warnings.Count -gt 0) {
    foreach ($w in $warnings) {
        $wColor = if ($w.MediaType -eq "SSD") { "Red" } else { "Yellow" }
        Write-Host $w.Message -ForegroundColor $wColor
    }
} else {
    Write-Host "Nothing! All disks have sufficient free space." -ForegroundColor Green
}



# End of Script
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"