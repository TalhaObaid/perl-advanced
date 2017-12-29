#!/usr/bin/perl

use strict;
use warnings;
my $file = shift || $0;
print "$file is executable" if -X $file;
print "$file is non-executable" unless -X $file;
