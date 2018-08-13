$patch = "\\fsb2w01\INFRACORP.N3SO"
$share_test = Test-Path -Path $patch
$date = $Date = Get-Date -format "dd-MMM-yyyy HH:mm"
$message = ""
$exitCode = -1

If ($share_test -eq $true) {

$message = $patch + " Share check successful  " + $date
$exitcode = "0"

}
else {

$message = $patch + " Share not respond  "  + $date
$exitcode = "2"

}

Write-Output $message
exit $exitCode