#!/usr/bin/perl

use strict;
use warnings;

my %state;
my @names;

while ( <> )
{
    chomp;
    my ($abbreviation, @fields) = split /\s*\|\s*/;
    @names = @fields and next if $abbreviation eq 'key';
    $state{$abbreviation} = \@fields;
}

my $count = 0;
my %index = map { $_ => $count++ } @names;
my $NAME = $index{name};
my ($attr, $abbr) = qw(capital AR);
print "the $attr of $state{$abbr}[ $NAME ] is $state{$abbr}[ $index{$attr} ]\n";
exit;

my $limit;
for my $abbr ( sort keys %state )
{
    print "$abbr: ";
    my @values = @{ $state{ $abbr} };
    print join( ', ', map { "$_ => " . shift @values } @names ), ".\n";
    exit if ++$limit >= 5;
}
