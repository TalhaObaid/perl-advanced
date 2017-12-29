#!/usr/bin/perl

use strict;
use warnings;

use Carp qw(cluck);

$SIG{__DIE__} = sub { cluck shift };

#init( shift || 'nonesuch.conf' );
#print "Cell at (4,2) = ", field_value(4,2), "\n";

while ( my $config = shift )
{
    eval {
    init( $config );
    print "Cell at (4,2) = ", field_value(4,2), "\n";
    };

    if ( $@ )
    {
	chomp $@;
	warn "Caught exception '$@', continuing...\n";
    }
}

{
    my $data_ref;

    sub init
    {
	handle_file( config => shift );
        $data_ref = handle_file( data => config( 'datafile' ) );
    }

    sub field_value
    {
	my ($row, $column) = @_;
	$data_ref or die "No data collected yet";
        return $data_ref->[$row-1][$column-1];
    }
}

{
    my $conf_ref;
    sub handle_file
    {
	my ($file_type, $file_name) = @_;
        
	if ( $file_type eq 'config' )
	{
	    $conf_ref = read_config( $file_name, '=' );
	}
	elsif ( $file_type eq 'data' )
	{
#	    return read_data( $file_name, $conf_ref->{separator} );
#           return eval { read_data( $file_name, $conf_ref->{separator} ) } 
#	    || [ 0, 0, 0, [0, 42]];
	    my $ref = eval { read_data( $file_name, $conf_ref->{separator} ) };
            if ( $@ )
	    {
		$@ =~ /separator/i and return [ 0,0,0,[0,42]];
		die;
	    }
	    return $ref;
	}
    }
     
    sub config { $conf_ref->{ shift() } }
}

sub read_config
{
    my ($file, $delimiter) = @_;

    open my $fh, '<', $file or die "Can't open $file: $!";
    my %config;
    while ( <$fh> )
    {
	chomp;
	/(.+)$delimiter(.+)/ or next;
	$config{$1} = $2;
    }
    return \%config;
}

sub read_data
{
    my ($file, $separator) = @_;

    open my $fh, '<', $file or die "Can't open $file: $!";

    my @output;

    while ( <$fh> )
    {
	chomp;
	my @fields = split /\Q$separator\E/;
	@fields > 1 or die "Separator not found at line $.";
	push @output, \@fields;
    }
    return \@output;
}

