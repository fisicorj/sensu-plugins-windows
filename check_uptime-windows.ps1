Clear-Host
$Computer = hostname
Write-Host "$Computer's Uptime :"
$Booted = Get-WmiObject -Class Win32_OperatingSystem -Computer $Computer
$convert = [DateTime]::Now - $Booted.ConvertToDateTime($Booted.LastBootUpTime)`

$timeBoot = "{0:N2}" -f (($convert.TotalHours))

if ($timeBoot -gt 0)
    {
      Write-Output -InputObject "Servidor $computer Ligado a $timeBoot Horas"  
      exit 0
    }
    else 
    {  
        Write-Output -InputObject "Servidor $Computer Desligado $MemoryPencent"
        exit 1
    } 

    

