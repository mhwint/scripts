Clear-Host

$MB_Service = "C:\Program Files\Malwarebytes\Anti-Malware\MBAMService.exe"
$WaitTimeSeconds = 300

Write-Host "Starting MWB Update"
Start-Process -FilePath $MB_Service -ArgumentList "-update" -ErrorAction Stop

Write-Host "Delay 5 minutes for update"
Start-Sleep -Seconds $WaitTimeSeconds

Write-Host "Scanning"
Start-Process -FilePath $MB_Service -ArgumentList "-scan -threat" -ErrorAction Stop

Remove-Item $MyInvocation.MyCommand.Path -ErrorAction SilentlyContinue