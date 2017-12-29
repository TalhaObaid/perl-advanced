#!/usr/bin/perl
use strict;
use warnings;

my $temp_file = "$ENV{'HOME'}/.edit.pl.$$";
unlink $temp_file; # In case I left one lying around

my $date = localtime;
{
    open my $fh, '>', $temp_file or die "open $temp_file: $!\n";
    print {$fh} << "END_OF_TEXT";
This file was written on $date by $0.
Here's your chance  to customize it!
END_OF_TEXT
}

print "Stand by to edit!\n";
my $editor = $ENV{EDITOR} || 'vi';
system "$editor $temp_file";

print "Contents of $temp_file are now:\n";
{
    open my $fh, '<', $temp_file or die "open $temp_file: $!\n";
    print while <$fh>;
}
unlink $temp_file;
