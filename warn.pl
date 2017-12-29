#!/usr/bin/perl

use strict;
use warnings;

$SIG{__WARN__} = \&warn_handler;

sub warn_handler
{
    my $msg = shift;
    $msg =~ /uninitialized value (\S+)/ and return warn "Undef: $1\n";
    die "Exception: $msg";
}

my $x;
print $x;
my %x = (1);
print "Unreached\n";
