#!/usr/bin/perl
use strict;
use warnings;

my @snakes = qw(adder coral cobra garter asp);

my $reptiles_ref = \@snakes;

my $index;

printf "%d $_\n", $index++ for @$reptiles_ref;
