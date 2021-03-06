<# 
 .SYNOPSIS 
 Creates a connection to github 

.DESCRIPTION 
 Creates a connection to github, sets web security to handle api calls, sets global headers for use elsewhere
Will use better credentials stored github Credentials "GithubBasicAuth" if they exist in local keystore 

.PARAMETER ManualCred 
 string Parameter_ManualCred=switch, Will prompt user for credentials 

.EXAMPLE 
 Connect-github Connects to github 

.NOTES 
 Author: Mentaleak 

#> 
function Connect-github () {
 
	param(
		[switch]$ManualCred = $false
	)
	set-WebSecurity_PSTool
	if ($ManualCred) {
		$bcred = (Get-Credential -Title "Github" -Description "Enter GitHub Credentials")
		if ($bcred) { Set-Credential -Credential $bcred -Target "GithubBasicAuth" -Description "GitHub Credentials" }
		$cred = ((Find-Credential | Where-Object Target -Match "GithubBasicAuth")[0])
	} else {
		$cred = ((Find-Credential | Where-Object Target -Match "GithubBasicAuth")[0])
		if (!($cred)) {
			$bcred = (Get-Credential -Title "Github" -Description "Enter GitHub Credentials")
			if ($bcred) { Set-Credential -Credential $bcred -Target "GithubBasicAuth" -Description "GitHub Credentials" }
			$cred = ((Find-Credential | Where-Object Target -Match "GithubBasicAuth")[0])
		}
	}

	$tmpheader = Get-GitAuthHeader -cred ($cred)
	try { $userdata = Invoke-RestMethod -Uri "https://api.github.com/user" -Headers $tmpheader }
	catch {
		throw [System.UnauthorizedAccessException]"$((($_.ErrorDetails.Message) | ConvertFrom-Json).message)"
		break all
	}
	Write-Host "Connection Successful"
	Write-Host "Login: $($userdata.Login)"
	Write-Host "URL: $($userdata.html_url)"
	$global:GitAuth = $tmpheader
}
