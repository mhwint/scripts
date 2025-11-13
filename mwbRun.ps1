Clear-Host

$MB_Service = "C:\Program Files\Malwarebytes\Anti-Malware\MBAMService.exe"
$WaitTimeSeconds = 180

Write-Host "Starting MWB Update"
Start-Process -FilePath $MB_Service -ArgumentList "-update" -ErrorAction Stop

Write-Host "Delay 5 minutes for update"
Start-Sleep -Seconds $WaitTimeSeconds

Write-Host "Scanning"
Start-Process -FilePath $MB_Service -ArgumentList "-scan -threat" -ErrorAction Stop

# Self Deletion
# Remove-Item $MyInvocation.MyCommand.Path -ErrorAction SilentlyContinue