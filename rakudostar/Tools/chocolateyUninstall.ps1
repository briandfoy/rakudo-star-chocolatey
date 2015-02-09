$packageName = 'rakudostar'
$version = '2014.12.1'

try {
    $rakudoRegistryVersion = $version -replace '^(\d{4}\.\d+)(\.\d+)?', '$1'
    $app = Get-WmiObject -Class Win32_Product | Where-Object {($_.Name -eq "Rakudo Star $rakudoRegistryVersion")}
    if ($app) {
        $msiArgs = $('/x' + $app.IdentifyingNumber + ' /quiet REBOOT=ReallySuppress')
        Start-ChocolateyProcessAsAdmin $msiArgs 'msiexec'
    }
    Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}
