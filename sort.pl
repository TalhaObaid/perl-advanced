#!/usr/bin/perl

use strict;
use warnings;

chomp( my @dates = <DATA> );
print "Before:\n", map { "\t$_\n" } @dates;
 
#@dates = sort bydate @dates;

@dates = map  { $_->[0] }
         sort { $a->[1] cmp $b->[1] }
map  { [ $_, date2str($_) ] } @dates;

print "After:\n", map { "\t$_\n" } @dates;

#sub bydate
#{
#    date2str($a) cmp date2str($b);
#}

sub date2str # 4/9/08 -> 20080409
{
    my $date = shift;
    my ($month, $day, $year) = split m!/!, $date;
    $year += $year > 50 ? 1900 : 2000;
    return sprintf "%d%02d%02d", $year, $month, $day
}

__END__ 
1/10/10
4/9/08
12/31/99
5/23/09
12/17/07
