$name = 'rakudostar-moar'
$url = 'http://rakudo.org/downloads/star/rakudo-star-2014.12.1-moar.msi'
$args = 'INSTALLDIR="%ChocolateyInstall%\lib\rakudosta-moar.2014.12.1" /passive /le failure.log'

Install-ChocolateyPackage $name 'msi' $args $url
