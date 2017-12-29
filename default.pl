#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my $supplied_ref = { @ARGV };
my $default_ref = { pants => 3, shirts => 6, ties => 10 };
my $merged_ref = { %$default_ref, %$supplied_ref };
print Dumper $merged_ref;

