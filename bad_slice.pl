#!/usr/bin/perl
use strict;
use warnings;

my @array;
$array[0] = localtime;
print "\$array[0] = $array[0]\n";
@array[0] = localtime;
print "\$array[0] = $array[0]\n";
