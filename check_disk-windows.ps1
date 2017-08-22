$counterValueArray = (Get-counter  -Counter "\LogicalDisk(*)\% Free Space").countersamples | where {$_.InstanceName -ne "_total" -and $_.InstanceName -notmatch "harddiskvolume"} | Sort-Object InstanceName
$warningValue = 15
$critialValue = 10
$message = ""
$exitCode = -1
 
foreach ($counterValue in $counterValueArray) 
{ 
    if ($message -ne "")
    {
        $message += "`n"
    }
    
    $message += $counterValue.InstanceName + " " + [System.Math]::Round($counterValue.CookedValue,2) + " % free space"
 
    if($counterValue.CookedValue -le $critialValue)
    {
        $exitCode = 2
        $message += " - Critical"
    }
    elseif ($counterValue.CookedValue -le $warningValue)
    {
        if ($exitCode -lt 1)
        {
            $exitCode = 1
        }

        $message += " - Warning"
    }
    else
    {
        if ($exitCode -lt 0)
        {
            $exitCode = 0
        }  
        
        $message += " - Normal"     
    }
}
 
Write-Output $message
exit $exitCode
