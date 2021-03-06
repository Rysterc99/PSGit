<# 
 .SYNOPSIS 
 Displays a list of issues via Show-PsGUI A great module.... 

.DESCRIPTION 
 Mainly used for returning an array of solved issues when using add-GitAutoCommitPush -fixes
But feel free to use it how you like, its public do as you do. 

.PARAMETER FullName 
 string Parameter_FullName=REQUIRED
FullName is a string containing the full name of the repo EX: "Mentaleak\PSGit" 

.EXAMPLE 
 add-GitAutoCommitPush -fixes (get-gitfixesUI "Mentaleak\PSGit") 

.NOTES 
 Author: Mentaleak 

#> 
function get-gitfixesUI () {
 
	param(
		#Example: Mentaleak\PSGit
		[Parameter(mandatory = $true)] [string]$FullName
	)
	$gitissues = get-GitIssues $FullName | Sort-Object { [int]$_.number }
	$getfixobj = [pscustomobject]@{}
	foreach ($issue in $gitissues)
	{
		Add-Member -InputObject $getfixobj -MemberType NoteProperty -Name "$($issue.title) `#$($issue.number)" -Value $false
	}
	$fixedList = Show-Psgui $getfixobj
	if ($fixedList) {
		$fixes = ((Get-PSObjectParamTypes $fixedlist) | Where-Object { $_.Definition -match "TRUE" }).Name | ForEach-Object { $_.split("`#")[1] }
	}
	return $fixes
}
