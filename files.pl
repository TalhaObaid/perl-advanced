#!/usr/bin/perl

use strict;
use warnings;

# process_directory( shift || '.' );
# process_directory( shift || '.', \&is_executable );
process_directory( shift || '.', \&print_size);

sub print_size
{
    my $file = shift;
    print "$file is ", -s $file, " bytes long\n";
}
sub is_executable
{
    my $file = shift;
 
    print "Found an executable file: $file\n" if -x $file;
}

sub process_directory
{
    my $dir = shift;
    my $callback = shift;
 
    opendir my $dh, $dir or die "Couldn't open $dir: $1\n";
    while ( my $file = readdir $dh )
    {
        next if $file =~ /A\.\.?\z/;
        $callback->( $file );
#        print "Found an executable file: $file\n" if -x $file;
    }
}
