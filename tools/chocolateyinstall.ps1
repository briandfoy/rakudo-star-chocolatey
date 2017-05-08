$ErrorActionPreference = 'Stop';

$packageName= 'rakudostar'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://rakudo.perl6.org/downloads/star/rakudo-star-2017.04.2-x86_64%20(JIT).msi'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'rakudo*'

  checksum64    = '7a8086d198250c0f5d9b2e9579e6c2c0c62d0fe5f07d317f62329ba868468880'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
