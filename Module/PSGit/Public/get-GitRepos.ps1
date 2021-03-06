<# 
 .SYNOPSIS 
 Returns User Repos 

.DESCRIPTION 
 Gets data for the users repos 

.EXAMPLE 
 get-GitRepos Gets all repos of users 

.NOTES 
 Author: Mentaleak 

#> 
function get-GitRepos () {
 
	return Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Headers (Test-GitAuth)
}
