$hosts = @("192.168.1.1", "192.168.1.2", "192.168.1.3")
$user = "user"
foreach ($hostName in $hosts) {
	
	$address = "$user@$hostName"
	
	Write-Host "--------------------------------------"
	Write-Host "Starting deployment to $hostName"
	Write-Host "--------------------------------------"
	
	Write-Host "Uploading payload..."
	scp test.ear deploy.sh "$address":/tmp
	Write-Host "Upload done"

	Write-Host "Starting deploy.sh..."
	ssh -t "$address" 'chmod a+x /tmp/deploy.sh;bash /tmp/deploy.sh'
	Write-Host "deploy.sh done"
}
