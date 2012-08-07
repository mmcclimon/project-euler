#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);
#

# Euler Project #7
# Find the 10,001st prime
my $t0 = [gettimeofday()];

my @primes = (2);
my $num = 3;
while (@primes < 10001) {
	my $found = 0;
	for (@primes) {
		if ($num % $_ == 0) {
			$found = 1;
			last;
		}
	}
	push(@primes, $num) unless $found;
	$num++; #+= 2;
}


say "$primes[10000]";


say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";