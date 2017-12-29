#!/usr/bin/perl

use strict;
use warnings;

{
    my $marsupial = 'wallaby';
    my $creature_ref = \$marsupial;
    my @snakes = qw(adder coral cobra garter asp);
    my $reptiles_ref = \@snakes;
    
    modify_refs( $creature_ref, $reptiles_ref );
    print "\$marsupial = $marsupial\n";
    print "\@snakes = @snakes\n";
}

sub modify_refs
{
    my ($scalar_ref, $array_ref) = @_;
 
    $$scalar_ref .= ' stew';
    pop @$array_ref;
}
