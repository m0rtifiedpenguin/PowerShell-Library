# PowerShell script to collect information about computers

# List computer manufacturer and model.
Get-CimInstance -ClassName Win32_ComputerSystem

# List OS version information
Get-CimInstance -ClassName Win32_OperatingSystem |
    Select-Object -Property Build*,OSType,ServicePack*

# List processor information
Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"

# List BIOS information
Get-CimInstance -ClassName Win32_BIOS

# List local users and owner
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property *user*

# Show currently logged on user
Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName
