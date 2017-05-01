#!perl

# see https://chocolatey.org/docs/create-packages#character-encoding

use Test::More 1.0;

my @files = glob "tools/*.ps1";

foreach my $file ( @files ) {
	ok -e $file, "$file exists";

	my $rc = open my $fh, '<:raw', $file;
	ok $rc, "Opened $file";

	my $line = readline $fh;
	like $line, qr/\A\x{ef}\x{bb}\x{bf}/, "$file starts with BOM";
	}

done_testing();
