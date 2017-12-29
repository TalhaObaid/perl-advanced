#!/usr/bin/perl

use strict;
use warnings;

my $DICTIONARY = "/usr/share/dict/words";

open my $fh, '<', $DICTIONARY or die "Couldn't open $DICTIONARY $!";

my %dict = map { $_, 1 } grep { chomp; /.*/ } <$fh>;

while ( <> ) {
    s/(\w+)/$dict{$1}?$1:"[$1]"/eg;
    print;
}

