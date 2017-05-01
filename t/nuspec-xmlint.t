#!perl

use Test::More 1.0;

my $file = 'rakudostar.nuspec';
ok -e $file, "$file exists";

my $rc = system 'xmllint', $file;
ok $rc == 0, 'xmllint passes';

done_testing();
