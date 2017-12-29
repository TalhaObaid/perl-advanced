#!/usr/bin/perl

use strict;
use warnings;

print( " " . compare_arrays ( [ qw(Wallace Gromit) ], [ qw(Wallace Gromit Shawn) ]) ."\n" );

print (" ". compare_arrays ( [3..5], [5,4,3]) . "\n");

print (" ". compare_arrays ( [], [] ) . "\n" );

print (" " . compare_arrays ( [ qw(Kirk Spock McCoy) ], [ qw(Kirk Spock) ] ) . "\n" );

print (" " . compare_arrays ( [ 1..3 ], [qw(1 2 3)]) . "\n" );

sub compare_arrays
{
    my $first_ref = shift;
    my $second_ref = shift;

    print join (' ', @$first_ref) , " = ", $#$first_ref, " | ", join ( ' ', @$second_ref), " = ", $#$second_ref;

    return "False" if $#$first_ref != $#$second_ref;
    # start searching from the end, unix grep command like behaviour
    while ( ($#$first_ref >=0 && $#$second_ref >=0 ) && pop @$first_ref eq pop @$second_ref ){}
    
    return $#$first_ref < 0 && $#$second_ref < 0?"True":"False";
}
