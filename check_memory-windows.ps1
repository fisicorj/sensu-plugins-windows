$Memoryuse = ((get-counter -counter "\Memory\% committed bytes in use").CounterSamples[0].CookedValue)
$MemoryPencent = $Memoryuse
$MemoryDisplay = $Memoryuse.ToString("0.00")

$critical = 90
$warn = 70

if ($MemoryPencent -gt $critical)
    {
      Write-Output -InputObject "Memory OverLoad $MemoryDisplay %"  
      exit 2
    }
    elseif ($MemoryPencent -ge $warn)
    {
        Write-Output -InputObject "Memory Critical $MemoryDisplay %"
        exit 1
    }
    else 
    {  
        Write-Output -InputObject "Memory OK $MemoryDisplay %"
        exit 0
    } 

