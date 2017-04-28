# Chocolatey Package for Rakudo Star

The [Chocolatey package for Rakudo Star](https://chocolatey.org/packages/rakudostar).

Get the latest [Rakudo Star](http://rakudo.org/downloads/star/).
Use the URL to a specific version instead of the "latest" link. The
Chocolatey package uses a checksum, which changes.

Update the release notes in [rakudostar.nuspec](rakudostar.nuspec).

Update the version in  [rakudostar.nuspec](rakudostar.nuspec)
and [tools/chocolateyInstall.ps1](tools/chocolateyinstall.ps1).

Add the checksum to [tools/chocolateyInstall.ps1](tools/chocolateyinstall.ps1)

	certUtil -hashfile pathToFileToCheck [HashAlgorithm]

Pack the distro:

	choco pack

Push the distro:

	choco push

You may need to set your [API key](https://github.com/chocolatey/choco/wiki/CommandsApiKey) first:

	choco apikey -k <your key here> -s https://chocolatey.org/

If you'd like help maintain this package (especially to be added to chocolatey
as a person who can add maintainers), let me (brian) know.
