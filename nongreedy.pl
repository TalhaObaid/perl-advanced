#!/usr/bin/perl
use strict;
use warnings;

$_ = "abc123def 456ghi7";

print "Greedy:    ";
print for /(c.*[def])/;
print "\nNongreedy: ";
print for /(c.*?[def])/;
print "\n";
