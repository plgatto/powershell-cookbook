# Find service to stop using: Get-Service | Where {$_.status –eq 'running'}

$myList = 'SysMain', 'wuauserv', 'AdobeARMservice', 'dbupdate', 'dbupdatem'
foreach ($element in $myList) {
	Write-Output "Stopping $element..."
	Get-Service $element | Where {$_.status -eq 'Running'} | Stop-Service #Ottimizzazione avvio
	if($?) {
		Write-Output "$element stopped"
	}
}

Write-Output "Done"
Start-Sleep -Seconds 5
