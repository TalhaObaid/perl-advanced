#!/usr/bin/perl

use strict;
use warnings;

my $marsupial = 'wallaby';

my $creature_ref = \$marsupial;

print $$creature_ref, "\n";
print "\$creature_ref = $creature_ref\n";
#printf "\$creature_ref = %x\n", $creature_ref;
#my $augmented = $creature_ref + 32;
#printf "\$creature_ref + 32 = %x\n", $augmented;

#print "\$augmented = $augmented\n";
#print "\$$augmented = ", $$augmented, "\n";

my $ref_copy = $creature_ref;
print "\$ref_copy      = $ref_copy\n";

my $australian = 'wallaby';
my $aussie_ref = \$australian;

print "\$aussie_ref    = $aussie_ref\n";
