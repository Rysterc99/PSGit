<# 
 .SYNOPSIS 
 Don't programatically do this 

.DESCRIPTION 
 Do it manually 

.PARAMETER name 
 string Parameter_name=We aren't going to do anything with this. Deal with it 

.EXAMPLE 
 STOP! 

.NOTES 
 Author: Mentaleak 

#> 
function remove-gitRepo () {
 
	param(
		[Parameter(mandatory = $true)] [string]$name
	)
	throw [System.NotSupportedException]"Somethings are just too powerful, Make your own mistakes, I'm not helping"
}
