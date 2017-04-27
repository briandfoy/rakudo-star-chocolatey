# Many thanks to Brackets ps1 file developers for much of this code.
$packageName = 'rakudostar'
$version = '2017.01'

try {

  $rakudoRegistryVersion = $version -replace '^(\d{4}\.\d+)(\.\d+)?', '$1'

  $params = @{
    PackageName    = $packageName;
    FileType       = 'msi';
    SilentArgs     = '/quiet';
    Url            = 'http://rakudo.org/downloads/star/rakudo-star-2017.01-x86_64%20(JIT).msi';
    checksum       = '97e38fc510eb591b6f4a0a76d64ded04ed5c963f1cdb6cfabb72b916ae9fe042'
    checksumType   = 'sha256'
  }
  write-host "Checking if 'Rakudo Star $rakudoRegistryVersion' is already installed..."
  $alreadyInstalled = Get-WmiObject -Class Win32_Product | Where-Object {($_.Name -eq "Rakudo Star $rakudoRegistryVersion")}

  if ($alreadyInstalled) {
    write-host "'Rakudo Star $rakudoRegistryVersion is already installed. Skipping installation."
  } else {
    write-host "Rakudo Star $rakudoRegistryVersion is not installed. Installing now..."
    Install-ChocolateyPackage @params
  }

} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}
