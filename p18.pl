#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #18
# Find the maximum sum travelling from the top of the triangle to the base.
my $t0 = [gettimeofday()];

sub max {
	my $x = shift;
	my $y = shift;
	return ($x > $y) ? $x : $y;
}


my @triangle = (
	'75',
	'95 64',
	'17 47 82',
	'18 35 87 10',
	'20 04 82 47 65',
	'19 01 23 75 03 34',
	'88 02 77 73 07 63 67',
	'99 65 04 28 06 16 70 92',
	'41 41 26 56 83 40 80 70 33',
	'41 48 72 33 47 32 37 16 94 29',
	'53 71 44 65 25 43 91 52 97 51 14',
	'70 11 33 28 77 73 17 78 39 68 17 57',
	'91 71 52 38 17 14 91 43 58 50 27 29 48',
	'63 66 04 68 89 53 67 30 73 16 69 87 40 31',
	'04 62 98 27 23 09 70 98 73 93 38 53 60 04 23'
);

# make a bunch of array refs with a fun one-liner
$triangle[$_] = [ map {/^0/ ? substr($_, 1) : $_} split /\s/, $triangle[$_] ] for (0..$#triangle);

# transform each element into the sum of the greatest path to get there
@triangle = reverse @triangle;
for my $row (1..$#triangle) {
	my @thisRow = @{$triangle[$row]};
	$thisRow[$_] += max($triangle[$row-1][$_], $triangle[$row-1][$_+1]) for (0..$#thisRow);
	$triangle[$row] = \@thisRow;
}

say "Greatest sum: $triangle[-1][0]";


say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
