#!/usr/bin/perl
use strict;
use warnings;

my @snakes = qw(adder coral cobra garter asp);
my $reptile_ref = \$snakes[2];

print "\$reptile_ref looks like $reptile_ref\n";

$$reptile_ref = 'boa';

print "\@snakes = @snakes\n";
