#!perl

# see https://chocolatey.org/docs/create-packages#character-encoding

use Test::More 1.0;

if( exists $ENV{TESTDIR} ) {
	chdir $ENV{TESTDIR} or die "$!\n";
	note( "Working in $ENV{TESTDIR}" );
	}

my $file = 'rakudostar.nuspec';
ok -e $file, "$file exists";

my $rc = open my $fh, '<:raw', $file;
ok $rc, "Opened $file";

my $line = readline $fh;
like $line, qr/\A</, "$file starts with XML decl (no bom)";

done_testing();
