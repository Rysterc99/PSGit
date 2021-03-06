<# 
 .SYNOPSIS 
 Gets Collaborator data for a given Repo 

.DESCRIPTION 
 Gets Collaborator data for a given Repo 

.PARAMETER FullName 
 string Parameter_FullName=FullName is a string containing the full name of the repo EX: "Mentaleak\PSGit" 

.EXAMPLE 
 get-GitRepoCollaboratorsData "Mentaleak\PSGit" Gets Collaborator data for Repo Mentaleak\PSGit 

.NOTES 
 Author: Mentaleak 

#> 
function get-GitRepoCollaboratorsData () {
 
	param(
		#Example: Mentaleak\PSGit
		[string]$FullName
	)
	return Invoke-RestMethod -Uri "https://api.github.com/repos/$($FullName)/collaborators" -Headers (Test-GitAuth)
}
