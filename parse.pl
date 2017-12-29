#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

my (@numbers, @operators);

my $exp = join '', <DATA>;
chomp $exp;

my $tree = parse( $exp );
print Dumper $tree;

my %VARIABLES = ( '$x' => 8 );

my $result = evaluate( $tree );

$exp =~ s/\Q$_\E/$VARIABLES{$_}/ for keys %VARIABLES;
print "$exp = $result\n";

sub parse
{
    local $_ = shift;
  
    if ( my ($left, $op, $right) = /(.+)([+-])(.+)/ )
    {
        return make_node( OP => parse($left), $op, parse($right) );
    }
    elsif ( ($left, $op, $right) = m!(.*[^*])([*/])([^*].*)! )
    {
        return make_node( OP => parse($left), $op, parse($right) );
    }
    elsif ( ($left, $op, $right) = /(.+)(\*\*)(.+)/ )
    {
        return make_node( OP => parse($left), $op, parse($right) );
    }
    elsif ( my ($const) = /\A\s*(\d+)\s*\z/ )
    {
        return make_node( CONST => $const );
    }
    elsif ( my ($var) = /\A\s*(\$\w+)\s*\z/ )
    {
        return make_node( VAR => $var );
    }
    else
    {
        die "Error parsing '$_'\n";
    }
}

sub make_node
{
    my $type = shift;
    
#    if ( $type =~ /CONST|VAR/ )
#    {
#        return { type => $type, value => shift };
#    }

    if ( $type eq 'CONST' )
    {
        return shift;
    }
    elsif ( $type eq 'VAR' )
    {
        return [ shift ];
    }
    
    my ($left, $op, $right) = @_;
    return { type => $type, left => $left, right => $right, op => $op };
}

sub evaluate
{
    my $node = shift;

    if ( ! ref $node )
    {
        return $node;
    }
    elsif ( ref $node eq 'ARRAY' )
    {
        return $VARIABLES{ $node->[0] };
    }
   
#    if ( $node->{type} eq 'CONST' )
#    {
#        return $node->{value};
#    }
#    elsif ( $node->{type} eq 'VAR' )
#    {
#	return $VARIABLES{ $node->{value} };
#    }
    elsif ( $node->{type} eq 'OP' )
    {
        my ($left, $right) = map { evaluate( $node->{$_} ) } qw(left right);
        if ( $node->{op} eq '+' )
	{
            return $left + $right;
	}
        elsif ( $node->{op} eq '-' )
        {
            return $left - $right;
        }
        elsif ( $node->{op} eq '*' )
        {
            return $left * $right;
        }
        elsif ( $node->{op} eq '/' )
        {
            return $left / $right;
        }
        elsif ( $node->{op} eq '**' )
        {
            return $left ** $right;
        }
        die "Unknown operator $node->{op}\n";
    }
    else
    {
        die "Unknown node type $node->{type}\n";
    }
}
__END__
5 + 17 * $x - 3 ** 2
   


