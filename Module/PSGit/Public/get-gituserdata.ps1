<# 
 .SYNOPSIS 
 Gets the current users data 

.DESCRIPTION 
 Gets the current users data from github 

.NOTES 
 Author: Mentaleak 

#> 
function get-gituserdata () {
 
	$userdata = Invoke-RestMethod -Uri "https://api.github.com/user" -Headers (Test-GitAuth)
	$emailheader = @{ Scope = 'user:email' }
	$emailheader += (Test-GitAuth)
	try { $useremail = Invoke-RestMethod -Uri "https://api.github.com/user/emails" -Headers $emailheader }
	catch { $useremail = $null }
	$user = New-Object PSObject -Property @{
		UserData = $userdata
		UserEmail = $useremail
	}

	return $user
}
