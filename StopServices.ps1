# Find service to stop using: Get-Service | Where {$_.status –eq 'running'}
#
# Run PowerShell as administrator and then run:
# Set-ExecutionPolicy RemoteSigned
# ./StopServices.ps1

$services = 'SysMain', 'wuauserv', 'AdobeARMservice', 'dbupdate', 'dbupdatem'
$processes = 'sedlauncher', 'utcsvc', 'dosvc', 'sedsvc'

Write-Output "------------------"
Write-Output "Stopping services"
Write-Output "-----------------"

foreach ($service in $services) {
	Write-Output "Stopping $service..."
	Get-Service $service | Where {$_.status -eq 'Running'} | Stop-Service
	if($?) {
		Write-Output "$service stopped"
	}
}

Write-Output "------------------"
Write-Output "Stopping processes"
Write-Output "------------------"

foreach ($process in $processes) {
	Write-Output "Stopping $service..."
	if(get-process $process -ea SilentlyContinue) {
		Stop-Process -Name $process -Force
		Write-Output "$process stopped"
	} else {
		Write-Output "$process is not running"
	}
}

Write-Output "Done"
Start-Sleep -Seconds 5
