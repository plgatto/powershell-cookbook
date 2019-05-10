# Find service to stop using: Get-Service | Where {$_.status –eq 'running'}

$services = 'SysMain', 'wuauserv', 'AdobeARMservice', 'dbupdate', 'dbupdatem'
foreach ($service in $services) {
	Write-Output "Stopping $service..."
	Get-Service $service | Where {$_.status -eq 'Running'} | Stop-Service #Ottimizzazione avvio
	if($?) {
		Write-Output "$service stopped"
	}
}

Write-Output "Done"
Start-Sleep -Seconds 5
