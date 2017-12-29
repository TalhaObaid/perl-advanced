#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

my $USAGE = "Usage: $0 --regex regex [--invert] [--ignore-case] [file...]\n";

my ($regex, $negated, $case_insensitive);

GetOptions( 'regex=s'      => \$regex,
            'invert'       => \$negated,
            'ignore-case'  => \$case_insensitive
          ) or die $USAGE;

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
