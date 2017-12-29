#!/usr/bin/perl

use strict;
use warnings;

my $trans_ref = make_trans_ref( 'French' );

print "J'ai un rendez-vous $$trans_ref{Friday} soir\n";

sub make_trans_ref
{
    my $language = shift;
    if ( $language eq 'French' )
    {
#        return 
        { Sunday    => 'dimanche', Monday    => 'lundi', Tuesday => 'mardi',
          Wednesday => 'mercredi', Thursday  => 'jeudi',
          Friday    => 'vendredi', Saturdday => 'samedi' };
    }
    elsif ( $language eq 'German' )
    {
        return 
        { Sunday    => 'Sonntag',  Monday   => 'Montag', Tuesday => 'Dienstag',
          Wednesday => 'Mittwoch', Thursday => 'Donnerstag',
          Friday    => 'Freitag',  Saturday => 'Samstag' };
    }
    else
    {
        die "Unknown language $language";
    }
}
   
