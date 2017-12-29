#!/usr/bin/perl

use strict;
use warnings;

my @clouds = qw(cumulus nimbus cumulonimbus stratus cirrus);

my $clouds_ref = \@clouds;

print "Cloud types:\n";
print "\t $clouds_ref->[$_]\n" for 0 .. $#$clouds_ref;

# http://www.navy.mil/navydata/questions/bells.html
my %mid_bells = ( one => '0030', two => '0100', three => '0130', four => '0200',
                  five => '0230', six => '0300', seven => '0030', eight => '0400' );

my $mid_ref = \%mid_bells;
print "Fourth mid bell is at $mid_ref->{four}\n";
