#!/usr/bin/perl

use strict;
use warnings;

my $stock_ref = get_stock_ref( 'INSECTS' );
print "I have $$stock_ref{ants} ants\n";

sub get_stock_ref
{
    my $seeking = shift;
  
    my (@data, $type);
    while ( <DATA> )
    {
        if ( ( my ($what, $number) = /(.*)\s+(\d+)/ ) && ( $type eq $seeking ) )
        {
            push @data, $what, $number;
        }
        elsif ( /(\S+)/ )
	{
            $type = $1;
        }
        else
        {
            next;
        }
    }
    return { @data };
}

__END__

INSECTS
ants 1000000
beetles 200000

MAMMALS
aardvarks 4
antelopes 3

FISH
guppies 10
angel fish 40
king crabs 10
