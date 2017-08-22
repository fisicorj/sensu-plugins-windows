$servicesArray = Get-WmiObject Win32_Service | Where {$_.StartMode -eq 'Auto'}
$servicesToIgnore = "Remote Registry","Software Protection","Cloud Initialization Service","Shell Hardware Detection","Group Policy Client","Windows Modules Installer","User Access Logging Service","Snow Inventory Client"
$message = ""
$exitCode = 0

for ($index = 0;$index -lt $servicesArray.Count-1; $index++) 
{
	if ($servicesArray.Item($index).State -eq "Stopped" -and $servicesArray.Item($index).DisplayName -NotIn $servicesToIgnore)
    {
        if ($message -ne "")
        {
            $message += "`n"
        }
        
        $message += $servicesArray.Item($index).DisplayName + " stopped - Critical"
        $exitCode = 2
    }
}

if ($exitCode -eq 0)
{
    $message = " All automatic services started - Normal"
}

Write-Output $message
exit $exitCode