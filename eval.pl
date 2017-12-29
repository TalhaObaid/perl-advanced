#!/usr/bin/perl
use strict;
use warnings;

while ( <DATA> )
{
    s!(http://.*?)(\s|$)!visit($1).$2!ge or next;
    print;
}
sub visit
{
    my $url = shift;

    my $content = `curl -s $url 2>&1`;
    $? and return "[$url: Couldn't fetch]";
    return "[$url: " . length($content) . " bytes]";
}

__END__
Today I visited http://www.oreillyschool.com/ and logged in to my courses, then I hopped over to http://www.cnn.com/ for some general news, and http://perlbuzz.com/ for the latest cool news about Perl. The I tried the address http://xyz.liklkvsj.xx/ that someone I didn't know emailed me about, but I couldn't reach it.
