#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my %state;
my @names;

populate();

for ( prompt(); <STDIN>; prompt() )
{
   
    last if /^Q$/mi;

    dumpit($1) and next if /^           # Begin the line just like that of \A
                             D          # Find the 'D'
                             \s+        # one or more spaces
                             (\w{2})    # get exactly two characters
                             $          # end the match just like that of \Z
                             /mix;     

    if (  s/^       # Begin the line just like that of \A
          I         # Match the 'I'
          \s+       # Any number of spaces after I
          (\w{2}?)  # Match exactly two characters for abbr 
          \s+?      # Any number of spaces
          (.+)      # Any number of characters, EXCLUDING \n, if s is added it will match it. 
          $/
          uc($1)
          /mexi )   # m for ^ $, x for comments, e for execute uc and push in $_, i for case-insensitive
    {
        chomp;

        my $largest_city = $state{$_}{largest_city};

        $largest_city = [$largest_city] if ( ref $largest_city ne 'ARRAY' );

        push @{$largest_city}, $2;

        $state{$_}{largest_city} = $largest_city;

        dumpit($1);
    }
}

sub dumpit
{
    print Dumper( $state{uc(shift @_)} );
}
sub prompt
{
    print "(Q)uit, (D)ump <abbr>, (I)nput <abbr> <city>:";
}

sub populate
{
    my $fn = shift @ARGV;

    open my $fh, '<', $fn or die "Couldn't open file: $fn. $!\n";

    while ( <$fh> )
    {
        chomp;
        my ($abbreviation, @fields) = split /\s*\|\s*/;
        @names = @fields and next if $abbreviation eq 'key';

    
        $state{$abbreviation} = { map { $_, shift @fields } @names };
    }

}
