$ErrorActionPreference = 'Stop';

$packageName= 'rakudostar'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://rakudo.perl6.org/downloads/star/rakudo-star-2017.04.1-x86_64%20(JIT).msi'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'rakudo*'

  checksum64    = '6654495651890ebcee98c0d33d392cdcdc18d8deb0412f6f7026cb730bf0bbed'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
