$ErrorActionPreference = 'Stop';

$packageName= 'rakudostar'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://rakudo.perl6.org/downloads/star/rakudo-star-2017.04-x86_64%20(JIT).msi'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'rakudo*'

  checksum64    = '702346fe0cb7338f57869c6f92fc6589f2af88fc2470a06c2fcaedfdb55c2e70'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
