#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #15
# Starting in the top left corner in a 20 by 20 grid, how many 
# routes are there to the bottom right corner?
my $t0 = [gettimeofday()];

# using Pascal's triangle, formula for a given cell is n! / k!(n-k)!
# the row we need is 2 times the size of the grid

sub fact {
	my $num = shift;
	my $total = 1;
	$total *= $_ for (2..$num);
	return $total;
}

my $gridSize = shift || 20;
my $pascalRow = $gridSize * 2;

# because we know that the row has an even number of elements,
# we know the biggest one is at  the center (rowNumber / 2), 
# so we can just calculate it directly

my $cell = fact($pascalRow) / (fact($pascalRow/2) * fact($pascalRow - ($pascalRow/2)));
say "Biggest = $cell";


say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
