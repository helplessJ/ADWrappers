<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.2.127
	 Created on:   	7/29/2016 7:04 PM
	 Created by:   	hawrylj
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
Import-Module ActiveDirectory

function List-ADBranchUsers
{

	[cmdletbinding()]
	param (
		
		[Parameter(Mandatory = $true)]
		[string]$Branch = $null,
		
		$Properties = @('title','LastLogonDate')
	)
	
	BEGIN
	{
		$targetOU = Get-ADOrganizationalUnit -Filter { Name -eq 'Users' } | Where-Object { $_.distinguishedName -match $Branch }
	}
	PROCESS
	{
		
    foreach ($userOU in $targetOU) {
      Get-ADUser -Filter * -SearchBase $userOU -Properties $Properties
    }
	}
}