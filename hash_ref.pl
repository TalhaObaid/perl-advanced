#!/usr/bin/perl

use strict;
use warnings;

my %country = ( us => 'USA',     uk => 'United Kingdom', fr => 'France',
                de => 'Germany', es => 'Spain',          mx => 'Mexico',
                jp => 'Japan',   in => 'India',          th => 'Thailand' );

my $country_ref = \%country;

print "\$country_ref = $country_ref\n";

print "$_ = $$country_ref{$_}\n" for keys %$country_ref;
