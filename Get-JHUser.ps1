Function Pull-DomainNameFromDN {

  param($dn)
  $eleCount = ($dn -split ',').Count
  $dn = ($dn -split ',')[$eleCount - 2]
  $dn.TrimStart('dc=') + '.com'
}

Function Get-JhUser {
  [cmdletbinding()]
    param(
            [parameter(mandatory = $true)]
            [string]$DistinguishedUsername
          )

  BEGIN{}
  PROCESS
  {
    $domainName = Pull-DomainNameFromDN -dn $DistinguishedUsername
    Get-ADUser $DistinguishedUsername -Server $domainName
  }
  END{}

}