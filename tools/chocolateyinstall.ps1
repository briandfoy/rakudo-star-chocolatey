$ErrorActionPreference = 'Stop';

$packageName= 'rakudostar'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://rakudo.perl6.org/downloads/star/rakudo-star-2017.07-x86_64%20(JIT).msi'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'rakudo*'

  checksum64    = '82f0f1debb7984ccf78f534caf31f6481da72fecc7be284a74cc329a74d5ebe6'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
