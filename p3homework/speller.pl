#!/usr/bin/perl

use strict;
use warnings;

open my $fh, '<', '/usr/share/dict/words' or die "Couldn't open file: $!\n";

my %words = map { $_, 1 } grep { chomp; $_ = lc; /\A[a-z]+\z/ } <$fh>;

print "Verification: the following words should be in the hash:\n";
print "$_: ", $words{$_} ? 'PASS' : 'FAIL', "\n" for qw(wolf schumpeter saltpeter);
print "Verification: the following words should not be in the hash:\n";
print "$_:", $words{$_} ? 'FAIL' : 'PASS', "\n" for qw(wolfsmilk Schumpeter peter-penny);
