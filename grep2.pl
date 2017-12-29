#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Std;

my $USAGE = "Usage: $0 -r regex [-v] [-i] [file...]\n";

my %Opt;
#getopts( 'iv', \%Opt );
getopts( 'ir:v', \%Opt ) or die $USAGE;

my ($negated, $case_insensitive) = @Opt{ qw(v i) };

#if ( $ARGV[0] eq '-v' )
#{
#    shift;
#    $negated = 1;
#}

#if ( $ARGV[0] eq '-i' )
#{
#    shift;
#    $case_insensitive = 1
#;
#}

#my $regex = shift;
my $regex = $Opt{r} or die $USAGE;
while ( <> )
{
    if ( $case_insensitive )
    {
	print if $negated xor /$regex/i;
    }
    else
    {
	print if $negated xor /$regex/
    }
}
