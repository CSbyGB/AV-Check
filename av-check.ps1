# Define list of antivirus processes
$av_check = @(
    "MsMpEng.exe", "AdAwareService.exe", "afwServ.exe", "avguard.exe", "AVGSvc.exe",
    "bdagent.exe", "BullGuardCore.exe", "ekrn.exe", "fshoster32.exe", "GDScan.exe",
    "avp.exe", "K7CrvSvc.exe", "McAPExe.exe", "NortonSecurity.exe", "PavFnSvr.exe",
    "SavService.exe", "EnterpriseService.exe", "WRSA.exe", "ZAPrivacyService.exe"
)

# Function to check for antivirus processes
function Check-Antivirus {
    $status = $false
    Write-Host "[+] Antivirus check is running .. "
    
    # Get list of processes
    $processes = Get-Process | Select-Object Id, ProcessName
    
    foreach ($process in $processes) {
        if ($av_check -contains $process.ProcessName) {
            Write-Host "--AV Found: $($process.ProcessName)"
            $status = $true
        }
    }
    
    if (-not $status) {
        Write-Host "--AV software is not found!"
    }
}

# Call the function
Check-Antivirus
