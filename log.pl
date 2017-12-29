#!/usr/bin/perl
use strict;
use warnings;

@ARGV or die "Usage: $0 long [...]\n";

my (%remote, %method, %path, %status, %length);
my $count;
while ( <> )
{
    next unless /\A(\S+)[^"]+"([A-Z]+)\s+(\S+)[^"]+"\s+(\d+)\s+(\d+)/;
    $remote{$1}++;
    $method{$2}++;
    $path{$3}++;
    $status{$4}++;
    $length{$5}++;
    $count++;
}

print "Parsed $count records out of $. total\n";
for ( my ($what, $count) = prompt(); $what ne 'q'; ($what, $count) = prompt() )
{
    my @top = top( $count, $what eq 'r' ? %remote
                         : $what eq 'm' ? %method
                         : $what eq 'p' ? %path
                         : $what eq 's' ? %status
                         :                %length
	);
    print "Top $count:\n";
    print "$top[0]: $top[1]\n" and splice @top, 0, 2 while @top;
}

sub prompt
{
    {
        print "(q)uit or (r)emote/(m)ethod/(p)ath/(s)tatus/(l)ength <count>: ";
        chomp( $_ = <STDIN> );
        /\A(?:(q)|([rmpsl])\s+(\d+))\z/i or redo;
        return defined $1 ? lc $1 : (lc $2, $3);
    }
}

sub top
{
    my ($count, %data) = @_;
  
    my @keys = sort { $data{$b} <=> $data{$a} } keys %data;

    my @top;
    while ( my $key = shift @keys)
    {
        push @top, $key, $data{$key};
        last if @top == 2 * $count;
    }
    return @top;
}
