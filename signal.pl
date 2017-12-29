#!/usr/bin/perl

use strict;
use warnings;

$SIG{INT} = $SIG{QUIT} = sub { die "Caught $_[0] signal" };

sleep 10;

print "Normal termination\n";
