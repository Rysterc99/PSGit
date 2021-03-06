<# 
 .SYNOPSIS 
 Git issues for the given project 

.DESCRIPTION 
 Provides all issues for the repo 

.PARAMETER FullName 
 string Parameter_FullName=FullName is a mandatory parameter of type string. FullName is a string containing the full name of the repo EX: "Mentaleak\PSGit" 

.EXAMPLE 
 TODO UP FOR GRABS, Submit a pull request 

.NOTES 
 Author: Mentaleak 

#> 
function get-GitIssues () {
 
	param(
		#Example: Mentaleak\PSGit
		[Parameter(mandatory = $true)] [string]$FullName
	)
	$RepoIssues = Invoke-RestMethod -Uri "https://api.github.com/repos/$($FullName)/issues" -Headers (Test-GitAuth)
	return $RepoIssues
}
