<# 
 .SYNOPSIS 
 Checks to see if the remote project exists 

.DESCRIPTION 
 Checks to see if the remote project exists by using data found in the local .git folder
returns bool 

.PARAMETER ProjectPath 
 string Parameter_ProjectPath=ProjectPath is a parameter of type string. Path to the git project you would like to add commits and pushes to.
If Blank it will use the current directory 

.NOTES 
 Author: Mentaleak 

#> 
function test-GitRemote () {
 
	param(
		#Example: C:\Scripts\
		[string]$ProjectPath = ((Get-Item -Path ".\").FullName)
	)
	$repos = get-GitRepos
	$config = (Get-Content "$($ProjectPath)\.git\config").split("`n")
	$urls = ($config | Where-Object { $_ -like "*url = *" })
	$giturl = ($urls | Where-Object { $_ -like "*github*" }).split("=").Trim()[1].Replace(".git","")

	if ($repos.html_url.Contains($giturl)) {
		return $true

	}
	throw [System.UriFormatException]"The repo $($giturl) Does not exsist"
	break all
}
