#!/usr/bin/perl

use strict;
use warnings;

my $total = 0;
while ( <> )
{
   chomp;      
   while( (m!([\d\.\d{2}]+)\b!g )) 
   {

       my $token = $1;
       
       if ($token =~ /^\d+(\.\d{2})?$/)
       {
           $total = $total + $token;

       }
       else
       {
	   $token = "";
       }
       
        if( $token ne "" )
        {
            print "token=$token\n";

            my $matches = $_;

            $matches =~ s/^[\$]?($token)/\$$1/g;  
#            $matches =~ s/^($token)/\$$1/mg;
            print "New line : $matches\n";
        }
   }
#   print "$_\n";
}

print "total=$total\n";
