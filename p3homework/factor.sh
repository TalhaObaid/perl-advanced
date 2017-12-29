#!/bin/sh
perl -le '$dividend = $ARGV[0]; @factors; $divisor = 2; $remainder = $dividend % $divisor; $result = $dividend / $divisor; while ( $result != 1 ) { if ( $remainder != 0 ) { $divisor++; } else { push @factors, $divisor; $dividend = $result; } $remainder = $dividend % $divisor; $result = $dividend / $divisor; } push @factors, $divisor;print join( "\n", @factors);' 7

perl -le '$dividend = $ARGV[0]; @factors; $divisor = 2; $remainder = $dividend % $divisor; $result = $dividend / $divisor; while ( $result != 1 ) { if ( $remainder != 0 ) { $divisor++; } else { push @factors, $divisor; $dividend = $result; } $remainder = $dividend % $divisor; $result = $dividend / $divisor; } push @factors, $divisor;print join( "\n", @factors);' 12

perl -le '$dividend = $ARGV[0]; @factors; $divisor = 2; $remainder = $dividend % $divisor; $result = $dividend / $divisor; while ( $result != 1 ) { if ( $remainder != 0 ) { $divisor++; } else { push @factors, $divisor; $dividend = $result; } $remainder = $dividend % $divisor; $result = $dividend / $divisor; } push @factors, $divisor;print join( "\n", @factors);' 69

perl -le '$dividend = $ARGV[0]; @factors; $divisor = 2; $remainder = $dividend % $divisor; $result = $dividend / $divisor; while ( $result != 1 ) { if ( $remainder != 0 ) { $divisor++; } else { push @factors, $divisor; $dividend = $result; } $remainder = $dividend % $divisor; $result = $dividend / $divisor; } push @factors, $divisor;print join( "\n", @factors);' 5544
