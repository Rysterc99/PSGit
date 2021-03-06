<# 
 .SYNOPSIS 
 Git Pull but longer 

.DESCRIPTION 
 I dont know why this was made 

.PARAMETER force 
 string Parameter_force=Will ignore git sync status and overwrite the local repo 

.PARAMETER ProjectPath 
 string Parameter_ProjectPath=Path to the git project you would like to add commits and pushes to.
If Blank it will use the active powershell ISE File this was run from 

.EXAMPLE 
 Todo 

.NOTES 
 Author: Mentaleak 

#> 
function initialize-GitPull () {
 
	param(
		#Example: C:\Scripts\
		[string]$ProjectPath = ((Get-ChildItem ($psISE.CurrentFile.FullPath)).Directory.FullName),
		[switch]$force
	)


	#Write-Host "Test Local"
	if (test-GitLocal -ProjectPath $ProjectPath) {
		#Write-Host "Test remote"
		if (test-GitRemote -ProjectPath $ProjectPath) {
			#check branch divergence
			if ((test-GitSyncStatus -ProjectPath $ProjectPath) -or $force) {

				Set-Location $ProjectPath
				git pull

			}
		}
	}else{throw [System.IO.FileNotFoundException]"NO .git Folder present"}

}
