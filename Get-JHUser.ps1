Function Pull-DomainNameFromDN {

  param($dn)
  $eleCount = ($dn -split ',').Count
  ($dn -split ',')[$eleCount - 2]
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
    $userDom = Pull-DomainNameFromDN -dn $DistinguishedUsername
    $domainName = $userDom.TrimStart('dc=') + '.com'
    Get-ADUser $DistinguishedUsername -Server $domainName
  }
  END{}

}