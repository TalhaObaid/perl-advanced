#!/usr/bin/perl

use strict;
use warnings;

my $file = shift || $0;
my ($mode, $uid, $mtime) = (stat $file)[2,4,9];
printf "Mode of %s is %o\n", $file, $mode;
my $owner = getpwuid $uid;
print  "Owner of $file is $owner\n";
print "Modification time of $file is ". localtime( $mtime) . "\n";
