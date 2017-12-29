#!/usr/bin/perl
use strict;
use warnings;

if ( @ARGV && shift eq '-h' )
{
    exec "perldoc -t $0";
}

print "I guess you don't need any help...\n";
__END__

=head1 NAME
help.pl - Demonstration of perldoc

=head1 SYNOPSIS

./help.pl

=head1 DESCRIPTION

This program runs C<exec> to invoke perldoc on I<ourselves>.

=cut
