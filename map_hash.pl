#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

#my %marsupial = (koala => 1, kangroo => 1, possum => 1, wombat => 1);
my %marsupial = map { ($_, 1) } qw(koala kangroo possum wombat);

chomp( my @amphibians =<DATA> );
my %amphibian = map {$_, 1} @amphibians;
#$amphibian{$_} = 1 for @amphibians;

#print "Marsupials: ", join( ' ', sort keys %marsupial ), "\n";
#print "Amphibians: ", join( ' ', sort keys %amphibian ), "\n";
print Dumper \%amphibian, \%marsupial;

__END__
frog
toad
salamander
newt
caecilian
