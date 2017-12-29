#!/usr/bin/perl

use strict;
use warnings;

$_ = join '', <DATA>;

s/([\d+*\/-]+)\s*=/qq{"$1 = " . ($1)}/eg;
print;

__END__
1+2/4= and 42**3 = 
 and 12-3/4 = 
