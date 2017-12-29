#!/usr/bin/perl

use strict;
use warnings;

my $MINUTE = 60; #seconds within

my %length;

while ( <DATA> )
{
    next unless /\A\d+\.\s+"(.*?)".*\s(\d+):(\d+)/;
    my ($title, $min, $sec) = ($1, $2, $3);
    $length{$title} = $min * $MINUTE + $sec;
}

my $limit = shift || 3;
my @long_tracks = grep { $length{$_} > $limit * $MINUTE } sort keys %length;
report( $limit, @long_tracks );

sub report
{
    my $limit = shift;

    print "Tracks over $limit minutes long:\n";
    print "$_\n" for @_;
}
__END__
Sgt. Pepper's Lonely Hearts Club Band (Track listing from Wikipedia)
Side one
No.	Title	Length
1.	"Sgt. Pepper's Lonely Hearts Club Band"	2:00
2. 	"With a Little Help from My Friends"	2:43
3.	"Lucy in the Sky with Diamonds"		3:26
4.	"Getting Better"		2:47
5.	"Fixing a Hole"		2:35
6. 	"She's Leaving Home"	3:35
7.	"Being for the Benefit of mr. Kite!"	2:35
Side two
No.	Title	Length
1.	"Within You Without You" (George Harrison)	5:05
2. 	"When I'm Sixty-Four"	2:37
3.	"Lovely Rita"	2:41
4.	"Good Morning Good Morning"	2:42
5.	"sgt. Pepper's Lonely Hearts Club Band (Reprise)"	1:19
6. 	"A Day in the Life"	5:04

