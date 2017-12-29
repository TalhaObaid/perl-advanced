#!/usr/bin/perl

use strict;
use warnings;

my $total = 0;
while ( <> )
{
    s/(\d+(\.\d{2})?)/\$$1/g;
   print $_, "\n";
}
