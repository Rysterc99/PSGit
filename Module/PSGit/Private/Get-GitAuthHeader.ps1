<# 
 .SYNOPSIS 
 Creates a Basic auth value and returns it as a header 

.DESCRIPTION 
 Creates a Basic auth value using base64string and returns it as a header 

.PARAMETER cred 
 string Parameter_cred=cred is a parameter of type pscredential. A credential object containing username and password (More secure, in local memory) 

.PARAMETER pass 
 string Parameter_pass=pass is a parameter of type string. The password 

.PARAMETER user 
 string Parameter_user=user is a parameter of type string. The username 

.NOTES 
 Author: Mentaleak 

#> 
function Get-GitAuthHeader () {
 
	param(
		[string]$user,
		[string]$pass,
		[pscredential]$cred
	)
	if ($cred)
	{
		$user = $cred.UserName
		$basicAuthValue = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($user):$([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($($cred.Password))))")))"
	}
	elseif ($user -and $pass)
	{
		$pair = "${user}:${pass}"
		$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
		$base64 = [System.Convert]::ToBase64String($bytes)
		$basicAuthValue = "Basic $base64"
	}
	else {
		throw [System.InvalidOperationException]"Please Provide either (-cred) or (-user and -pass)"
	}
	$headers = @{ Authorization = $basicAuthValue }
	return $headers
}
