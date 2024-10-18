# Checks status of Windows Defender and AV exclusions, disables various aspects of Windows Defender, and sets a new exclusion path

# Checks the status of antimalware software
Get-MpComputerStatus

# Checks exclusions for Microsoft Defender
Get-MpPreference | select Exclusion* | fl

# Disables Defender Real Time Monitoring
Set-MpPreference -DisableRealtimeMonitoring $true

# Completely disables Windows Defender Antivirus on a computer
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force

# Set exclusion path
Set-MpPreference -ExclusionPath (pwd) -disablerealtimemonitoring
Add-MpPreference -ExclusionPath (pwd)
