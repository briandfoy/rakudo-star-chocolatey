# Chocolatey Package for Rakudo Star

If you'd like help maintain this package (especially to be added to chocolatey
as a person who can add maintainers), let me (brian) know.

The [Chocolatey package for Rakudo Star](https://chocolatey.org/packages/rakudostar).
If you'd like to be a maintainer, just ask. I'd like to have a small
group of people that can respond to problems (or even just add new maintainers)
if someone can't update the package. Someone with Windows or Powershell
affinity would be nice.

You can use the [bin/cook_templates](bin/cook_templates) program to fetch the latest 
details and prepare the files:

	C:\> perl5.24 bin/cook_templates
	{"sha256":"6654495651890ebcee98c0d33d392cdcdc18d8deb0412f6f7026cb730bf0bbed",
	"url":"http:\/\/rakudo.org\/downloads\/star\/rakudo-star-2017.04.1-x86_64%20(JIT).msi",
	"version":"2017.04.1"}

There are some tests for the generated files:

	C:\> prove

The cooked templates are in _cooked\_templates_. Change into that directory.
Pack and push the update:

	C:\> cd cooked_templates
	C:\> choco pack
	C:\> choco push

After that the package will go through automated testing and human review.
That can take several days.

## Gory details

Use a minor version (third group of digits) to note the chocolatey attempt. If
you have to reupload a package for a modified Rakudo Star release of the same
Rakudo Star version, you need that third group to tell chocolatey that this
is new.

In  [rakudostar.nuspec](rakudostar.nuspec):

- Update the version
- Update the release notes

In [tools/chocolateyinstall.ps1](tools/chocolateyinstall.ps1)

- Update the URL to the direct link (not "latest")
- Update the SHA256 checksum `certUtil -hashfile pathToFileToCheck SHA256`

I'm trying to automate those steps. You can try [bin/cook_templates](bin/cook_templates)
then look in _cooked\_templates_ to see what happened. I haven't made the
next step to automate the bit to accept the templates.

You can test the distro, mostly to check the XML format and byte-order marks.
This requires [Strawberry Perl](http://strawberryperl.com/):

	C:\> prove

Pack the distro:

	C:\> choco pack

Push the distro:

	C:\> choco push

After this, the chocolatey system will perform some automatic tests and
then go into moderation. If everything goes well, in about three days it will
be available.

## Chocolatey Setup

If you haven't done this before, you probably need to setup chocolatey.
You can go through their instructions, but these are the parts I typically
need, in reverse order of setup:

You may need to set your [API key](https://github.com/chocolatey/choco/wiki/CommandsApiKey)
first (probaby requires admin shell):

	C:\> choco apikey -k <your key here> -s https://chocolatey.org/

Get your API key for your [chocolatey account page](https://chocolatey.org/account).
They hide the API key in a big grey box near the bottom. You need to click
to show it.

To install chocolatey, enter an admin shell. In Windows 10, [right click
on the name in the Start Menu to get the "Admin" option](http://www.techadvisor.co.uk/how-to/windows/how-run-programs-as-administrator-in-windows-10-3632744/).
You don't need an admin shell to `pack` or `push`.

PowerShell:

	iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

cmd.exe

	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
