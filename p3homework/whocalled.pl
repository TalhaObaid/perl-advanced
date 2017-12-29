#!/usr/bin/perl

use strict;
use warnings;

in_eval();
eval { in_eval() };
eval { foo() };

sub foo { in_eval() }


sub in_eval
{
    my $i = 0;
    while ( (caller $i)[3] ) 
    {
	$i++;
    }

    my $subroutine = (caller ( $i - 1 ))[3];
    print $subroutine =~ /\(eval\)/?"Yes":"No", "\n";    
}
