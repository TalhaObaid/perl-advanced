#!/usr/bin/perl

use strict;
use warnings;

my $line = "Never try to teach a pig to sing.";

my ($result) = ( $line =~s/\bpig\b/squirrel/ );
print "   Successful substitution result: $result\n";
   ($result) = ( $line =~ s/jackass/zebra/ );
print "Unsuccessful substitution result: ", (defined $result ? "'$result'" : 'undef'), "\n";

$_ = "It wastes your time and annoys the pig.";

($result) = s/\b(pig)\b/squirrel/;
print "   Successful subsitutuion result: $result\n";

($result) = s/(jackass)/zebra/;
print "Unsuccessful subsitution result: ", (defined $result ? "'$result'" : 'undef' ), "\n";

