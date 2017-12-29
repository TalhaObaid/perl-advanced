#!/usr/bin/perl

use strict;
use warnings;

while ( <DATA> )
{
    print "Starting to match line: ";
    for my $number ( /(\d+)/g )
    {
        print " - $number ";
    }
    print "\n";
}


__END__
    Sing a song of 6 pence, a pocket full of rye; 4 and 20 blackbirds, backed in a pie.
    1969: Apollo 11 resunts from teh Moon after treavelling 828743 nautical miles.
The first firve values of Ackermann's function for n=1 are 2, 3, 5, 13, and 65533.
