#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

my $size = 8;

GetOptions( 'size:i' => \$size );

init( $size );
run ( $size );

my @Transforms;
my @Solutions;
my $String_Func;

sub run
{
    my $size = shift;
    my $solution = [];
    my $row = 0;
    try( $size-1, $solution, $row );
}

sub init
{
    my $size = shift;
    my $max = $size - 1;

    push @Transforms,
        sub { (        $_[1],        $_[0] ) },
        sub { ( $max - $_[1], $max - $_[0] ) },
        sub { ( $max - $_[0],        $_[1] ) },
        sub { (        $_[0], $max - $_[1] ) },
        sub { ( $max - $_[1],        $_[0] ) },
        sub { ( $max - $_[0], $max - $_[1] ) },
        sub { (        $_[1], $max - $_[0] ) };
    $String_Func = sub { string_of( $max, @_ ) };
}

sub try
{
    my ($max_cell, $solution, $row) = @_;
   
    if ( $row > $max_cell )
    {
        #print_solution( $max_cell, $solution ) if unique( $solution );
        return unless unique( $solution );
        #print_solution( $max_cell, $solution );
        print $String_Func->( $solution );


        #exit if $TEMP_COUNTER++ > 15;
        #print " *** ", ++$TEMP_COUNTER, "\n";
        #push @Solutions, $solution;
    }
    else
    {
        for my $column ( 0 .. $max_cell )
        {
            next if attacked( $solution, $row, $column );
            my $new_solution = copy( $solution );
            put_queen_at( $new_solution, $row, $column );
            try( $max_cell, $new_solution, $row + 1 );
	}
    }
}

sub unique
{
    my $solution = shift;
    for my $so_far ( @Solutions )
    {
        return 0 if is_like( $so_far, $solution );
    }
    return 1;
}

sub is_like
{
    my ($sol1, $sol2) = @_;
    
    for my $func ( @Transforms )
    {
        return 1 if same( $sol1, transform( $func, $sol2 ) )
    }
    return 0;
}

sub same
{
    my ($sol1, $sol2) = @_;
  
    return $String_Func->( $sol1 ); #string_of( $sol1 ) eq string_of( $sol2 );
}

sub transform
{
    my ($func, $solution) = @_;

    my $new_solution = [];
    for_row_col( $solution, sub {
        my ($row, $column) = @_;
        my ($new_row, $new_column) = $func->( $row, $column );
        put_queen_at( $new_solution, $new_row, $new_column );
    } );

#    for my $row ( 0 .. $#$solution )
#    {
#        my $elements_ref = $solution->[$row];
#        for my $column ( grep { defined $solution->[$row][$_] } 0 .. $#$elements_ref )
#	{
#            my ($new_row, $new_column) = $func->( $row, $column );
#            put_queen_at( $new_solution, $new_row, $new_column );
#	}
#    }
    return $new_solution;
}

sub for_row_col
{
    my ($solution, $callback) = @_;

    for my $row ( 0 .. $#$solution )
    {
	my $elements_ref = $solution->[$row];
	for my $column ( grep { defined $solution->[$row][$_] } 0 .. $#$elements_ref )
	{
	    $callback->( $row, $column );
	}
    }
}

sub string_of
{
    my ($max_cell, $solution) = @_;
    
    my $string = '';
    for my $row ( @$solution )
    {
	#$string .= join '', map { defined($_) ? 'Q' : ' ' } @$row;
	#$string .= "x";
	my @temp = @$row;
	$#temp = $max_cell;
	$string .= join '', map { defined($_) ? ' Q ' : ' . ' } @temp;
        $string .= "\n";
    }
    return "$string\n";
}

sub attacked
{
    my ($solution, $proposed_row, $proposed_column) = @_;
    
#    for my $row (0..$#$solution )
#    {
#        my $elements_ref = $solution->[$row];
#        for my $column ( grep { defined $solution->[$row][$_] } 0 .. $#$elements_ref )
#	{
#	    return 1 if attacks( $row, $column, $proposed_row, $proposed_column );
#	}
#    }
#    return 0;
    eval {
	for_row_col( $solution, sub {
	    my ($row, $column) = @_;
	    die 1 if attacks( $row, $column, $proposed_row, $proposed_column );
	} );
    };
    return $@;
}

sub attacks
{
    my ($r1, $c1, $r2, $c2) = @_;

    my $row_diff = abs( $r1 - $r2 );
    my $col_diff = abs( $c1 - $c2 );
    return $row_diff == $col_diff || $row_diff == 0 || $col_diff == 0;
}

sub put_queen_at
{
    my ($solution, $row, $column) = @_;
    $solution->[$row][$column] = 'Q';
}

sub copy
{
    my $solution = shift;
  
    my @rows;
    push @rows, [ @$_ ] for @$solution;
    return \@rows;
}

#sub print_solution
#{
#    my ($max_cell, $solution ) = @_;
    
#    for my $row ( @$solution )
#    {
#        for my $column ( 0 .. $max_cell )
#        {
#            print $row->[$column] ? " Q " : " . ";
#	}
#	print "\n";
#    }
#    print "\n"; # Extra blank line forspacing
#}
