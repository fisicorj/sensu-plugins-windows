$cpuPercent = [Math]::Truncate((get-counter -counter "\Processor(_Total)\% Processor Time").CounterSamples[0].CookedValue)
$criticalValue = 90
$warningValue = 80
$message = ""
$exitCode = -1

if ($cpuPercent -gt $criticalValue)
{
    $message = "CPU $CPUPercent % consumption - Critical"  
    $exitCode = 2
}
elseif ($cpuPercent -ge $warningValue)
{
    $message = "CPU $CPUPercent % consumption - Warning"
    $exitCode = 1
}
else 
{  
    $message = "CPU $CPUPercent % consumption - Normal"
    $exitCode = 0
} 

Write-Output $message
exit $exitCode