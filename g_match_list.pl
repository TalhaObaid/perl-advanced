#!/usr/bin/perl

use strict;
use warnings;

$_ = join ' ', split /\n/, <<'END_OF_TEXT';
This text is embedded in the program in multiple
lines, but our program splits the heredoc into
a list of lines (which don't contain the newline
characters themselves, because those were what was
split on), and t hen joines them with single spaces
to form a single long string. All in one expression, too!
END_OF_TEXT

my @words = /\s(\w+)\s/g;
print " - $_ - \n" for @words;
