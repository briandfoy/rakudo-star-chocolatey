# Many thanks to Brackets ps1 file developers for much of this code.
$packageName = 'rakudostar'
$version = '2014.12.1'

try {

  $rakudoRegistryVersion = $version -replace '^(\d{4}\.\d+)(\.\d+)?', '$1'

  $params = @{
    PackageName = $packageName;
    FileType = 'msi';
    SilentArgs = '/quiet';
    Url = 'http://rakudo.org/downloads/star/rakudo-star-2014.12.1-moar.msi';
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
