#!/usr/bin/perl

use strict;
use warnings;

while (<DATA>)
{
    my $dividend = $_;
    my @factors;
    my $divisor = 2;
    my $remainder = $dividend % $divisor;
    my $result = $dividend / $divisor;
    while ( $result != 1 )
    {
        if ( $remainder != 0 )
        {
             $divisor++;
	}
        else {
            push @factors, $divisor;
            $dividend = $result;
        }
        $remainder = $dividend % $divisor;
        $result = $dividend / $divisor;
    }
    push @factors, $divisor;
    print join( ', ', @factors) . "\n";

}
__END__
7
12
69
5544
