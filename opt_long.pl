#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;


my $size = 42;
GetOptions( 'library=s@'         => \my @libraries,
            'coordinates=f{2}'   => \my @coordinates,
            'size:i'             => \$size,
    );

print join( "\n\t", "Libraries:", @libraries ), "\n";
print join( "\n\t", "Coordinates:", @coordinates ), "\n";
print "Size: $size\n";
print "Remaining in \@ARGV: @ARGV\n";
