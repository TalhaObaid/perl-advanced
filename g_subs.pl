#!/usr/bin/perl

use strict;
use warnings;

while ( <DATA> )
{
    print "Before: $_";
    my @result = s/(['"])(\w+)\1/{$2}/g; 
    
    print "   Made @result change(s)\n";
    
    print "After: $_";
}

__END__
In this text, "sone" words are "qouted", like this: 'qouted'.
That means they're surrounded by either 'single' qoutes
or "double" quotes. But an "apostrophe" in a word like "don't"
doesn't "count".
