#!/usr/bin/perl

use strict;
use warnings;

$_ = join '', <DATA>;

print "Date: Total collected\n";
while ( /^([\d-]+).* ([\d.]+)/mg )
{
    print "$1: $2\n";
}

__END__
Date Principal donors Attendance Total collected
2010-09-23 Fred Frintstone, Daffy Duck 20 1700.00
2010-09-24 Bugs Bunny, Marvin the Martian, Gossamer 170 250000
2010-09-25 Pepe le Pew, Atom Ant, Foghorn Leghorn 410 810000
2010-09-26 Snagglepuss 7 12.50
