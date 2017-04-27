$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'rakudostar' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$url       = ''
$url64      = 'http://rakudo.org/downloads/star/rakudo-star-2017.01-x86_64%20(JIT).msi'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  #url          = $url
  url64bit      = $url64
  #file         = $fileLocation

  softwareName  = 'rakudo*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # Checksums are now required as of 0.10.0.
  # To determine checksums, you can get that from the original site if provided.
  # You can also use checksum.exe (choco install checksum) and use it
  # e.g. checksum -t sha256 -f path\to\file
  checksum      = ''
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '97e38fc510eb591b6f4a0a76d64ded04ed5c963f1cdb6cfabb72b916ae9fe042'
  checksumType64= 'sha256' #default is checksumType

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
