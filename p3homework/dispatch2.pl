#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
my %verb = ( give => \&give, drop => \&drop, go => \&go,
             take => \&take, kill => \&dispatch, slay => \&dispatch,
             look => \&look, have => \&inventory, quit => sub { exit } );

my %inventory     ;
my %room_contents ;
my %location      ;
my %exit          ;

while ( <> )
{
    chomp;
    $inventory{$1}{$2} = 1 if /(\w+)\s+has\s+(\w+)/;
    $location{$1} = $2 if /(\w+)\s+is\s+in\s+(\w+)/;
    $exit{$1}{$2} = $3 if /(\w+)\s+(\w+)\s+goes\s+to\s+(\w+)/;
    $room_contents{$1}{$2} = 1 if /(\w+)\s+contains\s+(\w+)/;
}
#print "Inventory:\n", Dumper(\%inventory), "\nRoom Contents:\n", Dumper(\%room_contents), "\nExit:\n", Dumper(\%exit), "\nLocation:\n", Dumper(\%location), "\n" ;

for ( prompt(); <STDIN>; prompt() )
{
    chomp;
    next unless /(\S+)(?:\s+(.+))?/;
    $verb{$1} or warn "\tI don't know how to $1\n" and next;
    $verb{$1}->($2, $1);
}

sub prompt { print "Command: " }

sub give
{
    local $_ = shift;
    /(\S+)\s+to\s+(\S+)/ or return warn "\tGive what to who?\n";
    delete $inventory{me}{$1} or return warn "\tYou don't have a $1\n";
    $inventory{$2}{$1}++;
    print "\tGiven\n";
}

sub drop
{
    my $what = shift;
    delete $inventory{me}{$what} or return warn "\tYou don't have a $what\n";
    my $here = $location{me};
    $room_contents{$here}{$what}++;
    print "\tDropped\n";
}

sub go
{
    my $direction = shift;
    my $here = $location{me};
    
    if (defined $exit{$here}->{$direction})
    {
        $location{me} = $exit{$here}->{$direction};
    }
    else
    {
	print "\tCan't go $direction from here\n";
    }
    
}
sub take
{
    my $what = shift;
    my $here = $location{me};
    delete $room_contents{$here}{$what} or return warn "\tThere's no $what here\n";
    $inventory{me}{$what}++;
    print "\tTaken\n";
}

sub inventory
{
    for my $have ( keys %{ $inventory{me} } )
    {
        print "\tYou have a $have\n";
    }
}

sub look
{
    my $here = $location{me};
    print "\tYou are in the $here\n";
    for my $around ( keys %{ $room_contents{$here} } )
    {
        print "\tThere is $around on the ground\n";
    }
    for my $actor ( keys %location )
    {
        next if $actor eq 'me';
        print "\tThere is a $actor here\n" if $location{$actor} eq $here;
    }

    print "\tThere are exits leading ", join (', ', keys %{$exit{$here}}), "\n" if defined $exit{$here};
}

sub dispatch
{
    local $_ = shift;
    my $verb = shift;

    /(\S+)\s+with\s+(\S+)/ or return warn "\t\u$verb who with what?\n";
    $inventory{me}{$2} or return warn "\tYou don't have a $2\n";
    my $here = $location{me};
    my $its_at = $location{$1} or return warn "\tNo $1 to \u$verb\n";
    $its_at eq $here or return warn "\tThe $1 isn't here\n";
    delete $location{$1};
    my $had_ref = delete $inventory{$1};
    $room_contents{$here}{$_}++ for keys %$had_ref;
    print "\u${verb}ed!\n";
}
