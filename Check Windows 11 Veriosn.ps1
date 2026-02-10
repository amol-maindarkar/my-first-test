# Get OS version and build info.
$OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
$BuildNumber = [int](Get-CimInstance Win32_OperatingSystem).BuildNumber

# Windows 11 24H2 is expected to be build 26100 or higher.
$TargetBuild = 26100

Write-Host "Detected OS Version: $OSVersion"
Write-Host "Detected Build Number: $BuildNumber"

# Find OS a veriosn and compare to target build.
if ($BuildNumber -lt $TargetBuild) {
    Write-Host "This system is running Windows 11 version lower than 24H2."
} elseif ($BuildNumber -eq $TargetBuild) {
    Write-Host "This system is running Windows 11 version 24H2."
} else {
    Write-Host "This system is running Windows 11 version newer than 24H2."
}