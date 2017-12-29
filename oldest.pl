#!/usr/bin/perl
use strict;
use warnings;

my $dir = shift || '.';
opendir my $dh, $dir or die "opendir $dir: $!\n";
my %age;
while ( my $file = readdir $dh )
{
    next if $file =~ /\A\.\.?\z/;
    $age{$file} = -M "$dir/$file";
}

print "The older 50% of files are:\n";
my $index = 0;
for my $file ( sort { $age{$b} <=> $age{$a} } keys %age )
{
    print "$file ($age{$file} days)\n";
    $index++;
    last if $index >= (keys %age) / 2;
}
