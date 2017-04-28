$ErrorActionPreference = 'Stop';

$packageName= 'rakudostar'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'http://rakudo.org/downloads/star/rakudo-star-2017.01-x86_64%20(JIT).msi'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'rakudo*'

  checksum64    = '97e38fc510eb591b6f4a0a76d64ded04ed5c963f1cdb6cfabb72b916ae9fe042'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
