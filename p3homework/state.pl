#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $HEADER_FILE = "/software/Perl3/state_header.key";

my %state;
my @names;

my ($fn, $abbr, $attr) = @ARGV;

#die "Invalid argument" unless defined $fn;

open my $fh, '<', $fn or die "Couldn't open $fn file. $!\n";

open my $key, '<', $HEADER_FILE or die "Couldn't open $HEADER_FILE file. $!\n";

while ( <$key> )
{    
    chomp; 
    push @names, $_; 
}

shift @names; # as first is key

while ( <$fh> )
{
    chomp;
    my ($abbreviation, @fields) = split /\s*\|\s*/;
    @{ $state{$abbreviation} }{@names} = @fields;
}

die "Couldn't find the requested state abbreviation $abbr\n" unless $state{$abbr};

unless ( $attr ) {
    for my $att ( sort keys %{ $state{$abbr} } ) 
    {
        print "$att => $state{$abbr}{$att}\n";
    } 
}
else
{
    die "Couldn't find the state $abbr having requested attribute $attr\n" unless $state{$abbr}{$attr};
    print "$attr => $state{$abbr}{$attr}\n";
}


