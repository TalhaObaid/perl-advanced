#!/usr/bin/perl

use strict;
use warnings;

opendir my $dh, '.' or die "Can't open . $!\n";
my @files = grep { ! /\A\.\.?\z/ } readdir $dh;
print "$_\n" for sort @files;
