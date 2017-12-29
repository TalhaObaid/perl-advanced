#!/usr/bin/perl

use strict;
use warnings;

$_ = "09/26/10 18:23:17 trish.oreilly.com ENABLE /perl2 & 09/27/10 09:16:23 tim.oreilly.com ENROLL /perl2";
 
while ( m!([\d/]+)\s+([\d:]+)[^/]*/(\S*)!g )
{
    my ($date, $time, $course)  = ( $1, $2, $3 );
    print "Date: $date; time: $time, course: $course\n";
}
