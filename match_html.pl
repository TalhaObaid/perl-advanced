#!/usr/bin/perl

use strict;
use warnings;

$_ = join '', <DATA>;
s/\n//g;
length and print " - $_ -\n" for split /<([^>]+)>/;

__END__
<HTML>
<HEAD><TITLE>Lesson 4</TITLE></HEAD>
<BODY>
<H1>Lesson 4: Global Matches</H1>
<P>Here we will learn about the <B>/g</B> modifier.
</P>
</BODY>
</HTML>
