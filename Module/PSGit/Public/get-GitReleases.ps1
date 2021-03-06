<# 
 .SYNOPSIS 
 Gets all releases 

.DESCRIPTION 
 Gets releases on a given repo 

.PARAMETER FullName 
 string Parameter_FullName=REQUIRED
FullName is a string containing the full name of the repo EX: "Mentaleak\PSGit" 

.EXAMPLE 
 get-GitReleases "Mentaleak\PSGit" 

.NOTES 
 Author: Mentaleak 

#> 
function get-GitReleases () {
 
	param(
		[Parameter(mandatory = $true)] [string]$FullName
	)
	return Invoke-RestMethod -Uri "https://api.github.com/repos/$($fullname)/releases" -Headers (Test-GitAuth)
}
