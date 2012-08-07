#!/usr/bin/perl
use warnings;
use strict;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #5
# What is the smallest number divisible by each of the numbers 1 to 20?
my $t0 = [gettimeofday()];

# brute force solution
my @factors = reverse(3..20);
print "@factors";
my $num = 20;
my $smallestFactor = my $inc = 2;

while (1) {
	my $found = 1;
	#print $num;
	if ($inc == 20) {
		for (@factors) {
			if ($num % $_ != 0 ) {
				#print " isn't divisible by $_";
				$found = 0;
				last;
			}
		}
		last if ($found || $num > 500_000_000);
	} elsif ($num % $smallestFactor == 0) {
		#print " divisible by $smallestFactor";
		$inc = $smallestFactor;
		$smallestFactor++ if $smallestFactor < 20;
	}
	$num += $inc;
	#print "\n";
}

print "\nfound at $num";

print "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.\n"