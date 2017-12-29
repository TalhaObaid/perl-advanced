#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

GetOptions( "from|f=i{2}", \my @from,
            "to|t=i{2}",   \my @to
          );

# Store the board in a 2-D array called @board.
my @board;
while (<DATA>) {
    # Read @board in here
    push @board,[ split /\s+/, $_];
}

print_board( \@board );

eval {
    move( \@board, [ shift @from, shift @from ], [ shift @to, shift @to] );
};

if ( $@ ) 
{
    chomp $@;
    warn "Cannot make a move, as the arguments must of non-zero
and greater than 0. Also must be within the boundaries
of the chess board\n";
}

print_board( \@board );

sub move
{
    my ($bref, $from, $to) = @_;
    # This routine moves the piece at location $from in the board pointed
    # to by $bref to the location $to. (So afterwards, whatever was in 
    # $from is now in $to and $from is blank.)
    # You decide how to code a 2-D position in $from and $to.
    
    $bref->[$to->[0] - 1]->[$to->[1] - 1] = $bref->[$from->[0] - 1]->[$from->[1] - 1];
    $bref->[$from->[0] - 1]->[$from->[1] - 1] = "--";    
}

sub print_board
{

    # This routine prints the board which is passed to it. As long as it
    # looks recognizably like the input format that's fine.
    
    my $board_ref = shift;
    for my $row ( @$board_ref )
    {
        for my $col ( @$row )
        {
            print " $col";
        }
    
        print "\n";
    }
}

__END__
Br Bk Bb BQ BK Bb Bk Br
Bp Bp Bp Bp Bp Bp Bp Bp
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
Wp Wp Wp Wp Wp Wp Wp Wp
Wr Wk Wb WK WQ Wb Wk Wr

