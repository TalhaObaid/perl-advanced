#!/usr/bin/perl

use strict;
use warnings;

my %country = ( us => 'USA',     uk => 'United Kingdom', fr => 'France',
                de => 'Germany', es => 'Spain',          mx => 'Mexico',
                jp => 'Japan',   in => 'India',          th => 'Thailand' );

my $hispanic_ref = \$country{mx};
$$hispanic_ref = 'United Mexican States'; # http://en.wikipedia.ord/wikiMexico

print "$_ = $country{$_}\n" for sort keys %country;
