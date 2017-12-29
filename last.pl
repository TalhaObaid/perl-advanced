#!/usr/bin/perl
use strict;
use warnings;

open my $fh, '-|', "last" or die "Can't open pipe: $!\n";
my %seen;
while ( <$fh> )
{
    next unless /\A(\S+).*\s((?:[A-Z][a-z]{2} ){2}[ \d]\d \d\d:\d\d)/;
    print "$1 - $2\n" unless $seen{$1}++;
}
