#!/usr/bin/perl
use strict;
use warnings;

$_ = join '', <DATA>;

my ($base) = /BASE\s+HREF="(.*?)"/ or die "Expecting a BASE";
while ( /A\s+            # Anchor tag
         HREF="(.*?)"    # Save the tagrget in $1 (assume quoted)    
         >               # Assume tag ends here
         (?:\s*          # Grab any white space around...
            <.*?>        # ... any tags around the text...
            \s*          # ... with optional white space after
         )*              # Those tags are optional
         (.*?)           # And now save text in $2
         \s*             # Ignoring any trailing white space
         <               # Terminated by begining of the "A" tag
         /gsx )
{
    my ($text, $url) = ($2, $1);
    $text =~ s/\n/ /g;
    print "$text: $base$url\n";
}

__END__
<HTML>
<HEAD>
<BASE HREF="http://www.oreillyschool.com/" />
</HEAD>
<BODY>
<A HREF="courses/">
<B>Course Listing</B>
</A>
<A
HREF="courses/perl1/"><I>Introduction to
Perl</I>
</A><A HREF="courses/perl2/">Intermediate Perl</A><A HREF="courses/perl3/">Advanced Perl
</A><A HREF="courses/perl4/"><DIV ID="Tantalize">Future Perl
course</DIV></A>
</BODY>
</HTML>
