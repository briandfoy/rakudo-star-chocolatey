$name = 'rakudostar-parrot'
$url = 'http://rakudo.org/downloads/star/rakudo-star-2014.12.1-parrot.msi'
$silent = '/quiet'

Install-ChocolateyPackage $name 'msi' $silent $url
