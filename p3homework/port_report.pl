#!/usr/bin/perl

use strict;
use warnings;

my $fh;
open $fh, '-|', "netstat -an" or die "Can't open pipe: $!\n";
my %port;
while ( <$fh> ) {
    next unless /\A[a-z]+\s+\d\s+\d\s+((\d\.\d\.\d\.\d)|(\:\:))\:(\d+).*LISTEN/;
    print $4 . "\n" unless $port{$4}++;
}

