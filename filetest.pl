#!/usr/bin/perl
use strict;
use warnings;

my $file = shift || $0;
print "$file exists\n" if -e $file;
print "$file is a regular file\n" if -f $file;
print "$file is a directory\n" if -d $file;
print "$file is a symbolic link\n" if -l $file;
print "$file is empty\n " if -z $file;

my $size = -s $file;
print "$file has size $size\n" if $size;
my $old = -M $file;
print "$file is $old days old\n" if defined $old;
print "$file is readable\n" if -r $file;
print "$file is executable\n" if -x $file;
print "$file is special\n" if -b $file;
print "Perl version is $]\n";
if ( $] >= 5.010 )
{
    print "$file is text, writable (chaining is allowed)\n" if -w -T $file;
}
else
{
    print "$file is text, writable (chaining is not allowed)\n" if -w $file && -T $file;
}
