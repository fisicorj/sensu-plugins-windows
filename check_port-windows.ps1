$server = 'ip_here'
$portToCheck = 'port_here'
$message = ""
$exitCode = ""

If (Test-Connection $server -Quiet) 
{   
    try 
    {       
        $null = New-Object System.Net.Sockets.TCPClient -ArgumentList $server,$portToCheck

        $message = "Server: " + $server + " Test Port: " + $portToCheck + " Open: Yes"
        $exitCode = 0
    }
    catch 
    {
        $message = "Server: " + $server + " Test Port: " + $portToCheck + " Open: No"
        $exitCode = 2
    }    
}

Write-Output $message
exit $exitCode