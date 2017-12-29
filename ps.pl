#!/usr/bin/perl

use strict;
use warnings;

my %pid_count;
for ( `ps -elf` )
{
    my $ppid = (split)[4];
    next if $ppid eq 'PPID'; # Header line
    $pid_count{$ppid}++;
}

print "Most popular parent process:\n";
for ( sort { $pid_count{$b} <=> $pid_count{$a} } keys %pid_count )
{
    print "\t$_ ($pid_count{$_} instances)\n";
    last;
}
