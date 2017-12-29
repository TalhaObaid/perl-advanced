#!/usr/bin/perl

use strict;
use warnings;

sub add 
{
    my ($left, $right) = @_;
    return $left + $right;
}

sub make_adder
{
    my $operand = shift;
    return sub { add( $operand, @_ ) };
}

my $add_three = make_adder( 3 );
my $add_seven = make_adder( 7 );

my $i = 12;

print "\$i = $_\n" for $i, $add_three->($i), $add_seven->($i);
