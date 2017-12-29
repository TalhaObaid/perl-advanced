#!/usr/bin/perl

use strict;
use warnings;

my @countries = qw(Sudan Sweden Switzerland Surinam Singapore);
my $countries_ref = \@countries;

print "Array     in scalar context: " . @countries      . "\n";
print "Array ref in scalar context: " . @$countries_ref . "\n";

print "Array in list context:      ", @countries, "\n";
print "Array ref in list context : ", @$countries_ref, "\n";

print "Third member of array:     $countries[2]\n";
print "Third membervia array ref: $$countries_ref[2]\n";
  
print "Index of last element of array:      $#countries\n";
print "Index of last element via array ref: $#$countries_ref\n";
