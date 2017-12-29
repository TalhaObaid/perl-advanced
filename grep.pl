#!/usr/bin/perl

use strict;
use warnings;

my $string = shift or die "Usage:$0 string [file]\n";
my $file   = shift || $0;
system "grep $string $file >/dev/null 2>&1";
print "$string ", $? == 0 ? "was" : "wasn't", " found in $file\n";

