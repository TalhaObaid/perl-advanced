B0;95;c#!/usr/bin/perl
use strict;
use warnings;

my @chars = 'a' .. 'z';
my @indices;
push @indices, rand @chars for 1 .. shift || 10;
print join( ', ' => @chars[ @indices ] ), "\n";
my @beasts = qw(cat hound frog cuckoo);
my @noises = qw(miao bay ribbit cuckoo);

my %sound;
@sound{ @beasts } = @noises;
print "A $_ $sound{$_}s\n" for keys %sound;

my @parts = localtime;
printf "The time is %02d:%02d:%02d\n", @parts[2,1,0];
my ($hr, $min, $sec) = (localtime)[2,1,0];
printf "The time is %02d:%02d:%02d\n", $hr, $min, $sec;
