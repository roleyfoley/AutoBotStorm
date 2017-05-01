# Get the Uptime of a Windows Machine in JSON Format
function Get-Uptime {
   $ReturnObject = New-OBject Psobject
   $os = Get-WmiObject win32_operatingsystem
   $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
   $CurrentTime = Get-Date
	$REturnObject | Add-Member -MemberType NoteProperty -Name CurrentTime -Value "$($CurrentTime)"
	$ReturnObject | Add-Member -MemberType NoteProperty -Name OSLastBooTime -Value "$($os.ConvertToDateTime($os.lastbootuptime))"
	$ReturnObject | ADd-member -MemberType NOteProperty -Name Uptime -Value "Uptime: $( $Uptime.Days) days, $($Uptime.Hours) hours, $($Uptime.Minutes) minutes"

	$ReturnObject = Convertto-Json $ReturnObject
	return $ReturnObject
}

Clear-Host
Get-Uptime