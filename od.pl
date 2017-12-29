#!/usr/bin/perl
use strict;
use warnings;

open my $fh, '|-', 'od -c' or die "open: $!\n";
print {$fh} "Hello world! \e \a \b \r \n";
close $fh;
