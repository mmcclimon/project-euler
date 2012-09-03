#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #67
# Using an efficient algorithm find the maximal sum in the triangle
my $t0 = [gettimeofday()];

sub max {
	return ($_[0] > $_[1]) ? $_[0] : $_[1];
}

open(my $fh, "<", "triangle.txt") or die "cannot open triangle.txt";

# push a bunch of array refs into a list
my @triangle;
push @triangle, [ map {/^0/ ? substr($_, 1) : $_ } split /\s/ ] while (<$fh>);

# transform each element into the sum of the greatest path to get there
@triangle = reverse @triangle;
for my $row (1..$#triangle) {
	my @thisRow = @{$triangle[$row]};
	$thisRow[$_] += max($triangle[$row-1][$_], $triangle[$row-1][$_+1]) for (0..$#thisRow);
	$triangle[$row] = \@thisRow;
}

say "Greatest sum: $triangle[-1][0]";


say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
