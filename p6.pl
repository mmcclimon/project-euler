#!/usr/bin/perl
use warnings;
use strict;
use Time::HiRes qw(gettimeofday tv_interval);
use v5.10;

# Euler Project #6
# What is the difference between the sum of the squares and the square of the sums?
my $t0 = [gettimeofday()];

my $sumSquares = 0;
my $squareSums = 0;
for (1..100) {
	$sumSquares += $_**2;
	$squareSums += $_;
}

say "The difference is ", $squareSums**2 - $sumSquares;

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";


