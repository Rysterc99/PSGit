<# 
 .SYNOPSIS 
 Checks to see if the project path has a .git folder 

.DESCRIPTION 
 Checks to see if the project path has a .git folder 

.PARAMETER ProjectPath 
 string Parameter_ProjectPath=ProjectPath is a parameter of type string. Path to the git project you would like to add commits and pushes to.
If Blank it will use the current directory 

.NOTES 
 Author: Mentaleak 

#> 
function test-GitLocal () {
 
	param(
		#Example: C:\Scripts\
		[string]$ProjectPath = ((Get-Item -Path ".\").FullName)
	)
	if ((Test-Path "$($ProjectPath)\.git"))
	{
		return $true
	}
	else
	{
		return $false
		#throw [System.IO.FileNotFoundException]"NO .git Folder present"

	}
}
