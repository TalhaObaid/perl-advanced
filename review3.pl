#!/usr/bin/perl
use strict;
use warnings;

my $CD_LENGTH = ( shift or die "Usage: $0 <length in minutes>\n" );
my $index = 1;
my %song_length;
while ( <DATA> )
{
    /(.*)\s+(\d+)'\s*(\d+)"/ or next;
    my ($title, $minutes, $seconds) = ($1, $2, $3);
    $song_length{$title} = $minutes + $seconds / 60;
}

my @songs = keys %song_length;
print "I have " . @songs . " MP3 files.\nTheir lengths in minutes are:\n";
foreach my $title ( sort keys %song_length )
{
    printf "#%2d: %-30s %5.2f\n", $index++, $title, $song_length{$title};
}
if ( total_length( %song_length ) > $CD_LENGTH)
{
    print "I can't fit all of these on a CD. Something needs to be removed.\n";
}
else
{
    print "I can fit all of these on one CD!\n";
}
sub total_length
{
    my %media = @_;
    my $total = 0;
    foreach my $length ( values %media )
    {
        $total += $length;
    }
    return $total;
}
__END__
Fixing a Hole      2' 2"
Lovely Rita        2' 4"
A Day in the Life  5' 33"
