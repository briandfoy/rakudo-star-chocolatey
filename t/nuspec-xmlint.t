#!perl

use Test::More 1.0;

if( exists $ENV{TESTDIR} ) {
	chdir $ENV{TESTDIR} or die "$!\n";
	note( "Working in $ENV{TESTDIR}" );
	}

my $file = 'rakudostar.nuspec';
ok -e $file, "$file exists";

my $rc = system 'xmllint', $file;
ok $rc == 0, 'xmllint passes';

done_testing();
