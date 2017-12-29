#!/usr/bin/perl

use strict;
use warnings;

my @board = ( [ qw(O X O) ],
              [ qw(X O O) ],
              [ qw(O X X) ]);

print_board( \@board );

set_board( \@board, 2, 3, 'O' );

print_board( \@board );

sub set_board
{
    my ($board_ref, $row, $column, $piece) = @_;
#    $board_ref->[$row-1]->[$column-1] = $piece;
    $board_ref->[$row-1][$column-1] = $piece;
}

sub print_board
{

    my $board_ref = shift;
    print "-" x 13, "\n";
    for my $row ( @$board_ref )
    {
        for my $column ( @$row )
        {
            print "| $column ";
        }
        print "|\n";
    }
    print "-" x 13, "\n";
}
