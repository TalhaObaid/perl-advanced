#!/usr/bin/perl

use strict;
use warnings;

my $side = shift or die; # L3ngth

my %area_refs = ( 3 => \&triangle, 4 => \&square, 5 => \&pentagon );
for my $sides ( 3..5 )
{
    print "Area of reqular $sides-gon side $side = ",
    $area_refs{$sides}->( $side ), "\n";
}

sub triangle # Equilateral
{
    my $side = shift;
    return sqrt(3) / 4 * $side ** 2
}

sub square
{
    my $side = shift;
    return $side ** 2;
}

sub pentagon # Regular
{
    my $side = shift;

    return sqrt(25 + 10 * sqrt(5)) / 4 * $side ** 2;
}
