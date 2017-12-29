#!/usr/bin/perl -C2

use strict;
use warnings;

my @squares = map { $_ ** 2 } 1 .. 10;
print "@squares\n";

my %main_tank     = ( humvee => 30, voyager => 0, moped => 1 );
my %reserve_tank  = ( humvee =>  0, voyager => 400, moped => 0.1 );
my %mpg           = ( humvee =>  9, voyager => 25_000/1_100, moped => 80 );

my @vehicles      = qw(humvee voyager moped);

my @miles_left = map { $main_tank{$_} > 0
		       ? $mpg{$_} * $main_tank{$_}
                       : $mpg{$_} * $reserve_tank{$_}
                     } @vehicles; 
		       
print "@miles_left\n";

my @x_axis = map { $_ * 0.3 } -10 .. 10;
my @y_axis = map {cos $_ } @x_axis;
print map { '*' x (40 + 30 * $_), "\n" } @y_axis;

my %char = ( eacute => 233, cedilla => 231, agrave => 224 );

$_ = chr for values %char;
my @words = qw(caf_eacute_ gar_cedilla_on d_eacute_j_agrave_);
print map { s/_(.*?)_/$char{$1}/g; "$_\n" } @words;
