#!/usr/bin/perl

use strict;
use warnings;

my $furn_ref = [ qw(sofa chair loveseat piano credenza) ];
my $cost_ref = { sofa => 1500, chair => 300, loveseat => 800, piano => 6000, credenza => 500 };

# Rule 1
print "Cost of third item from \$furn_ref is: ",
#    $$cost_ref{ $$furn_ref[2] },
    $cost_ref->{ $furn_ref->[2] },
    "\n";

# Rule 2
my $alt_furn_ref = [ qw(bed rug rocker stool) ];
my $alt_cost_ref = { bed => 3000, rug => 75, rocker => 450, stool => 125 };
my @refs = ( $cost_ref, $alt_cost_ref );

print "Cost of third item is \$alt_furn_ref from second reference in array is: ",
#    ${ $refs[1] }{ $$alt_furn_ref[2] },
    $refs[1]->{ $alt_furn_ref->[2] },
    "\n";
