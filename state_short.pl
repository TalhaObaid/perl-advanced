#!/usr/bin/perl

use strict;
use warnings;

my %state = ( AK => { name    => 'Alaska',
                      capital => 'Juneau'
	            },
              AL => { name    => 'Alabama',
                      capital => 'Montgomery',
	            },
              AR => { name    => 'Arkansas',
                      capital => 'Little Rock',
	            },
            );

print "The capital of $state{AR}{name} is $state{AR}{capital}.\n";
