<# 
 .SYNOPSIS 
 Copies a remote repo to a local one 

.DESCRIPTION 
 Copies a remote repo to a local one, makes new directory with name in remote repo
uses git clone to local path 

.PARAMETER LocalPath 
 string Parameter_LocalPath=Folder to make a new local repo with same name as remote repo in C:\Scripts\ 

.PARAMETER RemoteRepo 
 string Parameter_RemoteRepo=Url of repo https://github.com/{USERNAME}/{REPO} 

.EXAMPLE 
 Copy-GitRepo -RemoteRepo "https://github.com/Mentaleak/PSGit" -localPath C:\Scripts\ clones repo to C:\Scripts\PSGit 

.NOTES 
 Author: Mentaleak 

#> 
function Copy-GitRepo () {
 
	param(
		#Example: C:\Scripts\
		[Parameter(mandatory = $true)] [string]$LocalPath,
		#Example: https://github.com/{USERNAME}/{REPO}
		[Parameter(mandatory = $true)] [string]$RemoteRepo
	)
	if (!(Test-Path $LocalPath))
	{
		New-Item -ItemType Directory -Force -Path $LocalPath
	}
	Set-Location $LocalPath
	git clone $RemoteRepo
}
