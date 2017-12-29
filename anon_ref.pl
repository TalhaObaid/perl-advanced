#!/usr/bin/perl

use strict;
use warnings;

my $day_ref = make_day_ref( 'German' );

print "Der dritte tag der woche ist $$day_ref[2]\n";

sub make_day_ref
{
    my $language = shift;
#    my @english_names = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
#    my @french_names  = qw(Dimanche Lundi Mardi Mercredi Jeudi Vendredi Samedi);
#    my @german_names  = qw(Sonntag Montag Dienstag Mittwoch Donnerstag Freitag Samstag);
    if ( $language eq 'English' )
    {
	return  [ qw(Sunday Monday Tuesday Wednesday Thursday Friday Sat\
urday) ]; #\@english_names;
    }
    elsif ( $language eq 'French' )
    {
        return [ qw( Dimanche Lundi Mardi Mercredi Jeudi Vendredi Samedi) ]; #\@french_names;
    }
    elsif ( $language eq 'German' )
    {
        return [ qw( Sonntag Montag Dienstag Mittwoch Donnerstag Freitag\
 Samstag) ]; #\@german_names;
    }
    else
    {
        die "Unrecognized language $language"; 
    }
}
