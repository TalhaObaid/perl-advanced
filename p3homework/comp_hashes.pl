#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

print compare_hashes({Wallace => 1, Gromit => 2},{Gromit => 2, Wallace => 1});

print compare_hashes({Kirk => 'Captain', Spock => 'First Officer', McCoy => 'Doctor' }, {Spock => 'First Officer', McCoy =>'Doctor'});

print compare_hashes({}, {});

print compare_hashes({Wallace=>1, Gromit =>2}, {Wallace=>2, Gromit=>1});

print compare_hashes({Wallace=>1, Gromit=>2}, {Wallace=>1, Gromit=>2, Shawn =>3});



sub compare_hashes
{

    my $first_ref = shift;
    my $second_ref = shift;

    print "\n";
    print "( ";
    print "$_ => $$first_ref{$_} " for keys %$first_ref;
    print ") ";
    print "( ";
    print "$_ => $$second_ref{$_} " for keys %$second_ref;
    print ") ";
    
    return 'False' if length( keys %$first_ref ) != length ( keys %$second_ref );

    foreach my $merged_key ( keys %{{ %$first_ref, %$second_ref }} )
    {
        return 'False' if ( ( defined $$first_ref{ $merged_key } && $$first_ref{  $merged_key } .""  ) ne 
                            ( defined $$second_ref{ $merged_key} && $$second_ref{ $merged_key } ."" ) );
    }
    return 'True';
}
