#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #19
# How many Sundays fell on the first of the month during the twentieth century?
my $t0 = [gettimeofday()];

my @months = qw(31 28 31 30 31 30 31 31 30 31 30 31);

my $startDay = 2;
my $numSundays = 0;

for my $year (1901..2000) {
	$months[1] = ($year % 4 == 0) ? 29 : 28;
	for (0..$#months) {
		$numSundays++ if (!$startDay);
		$startDay += $months[$_];
		$startDay %= 7;
	}
}

say "Number of months that start on sundays: $numSundays";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
