#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #10
# Find the sum of all the primes below two million.
my $t0 = [gettimeofday()];

my $limit = 2_000_000;

my @list = map {$_ = 1} 0..$limit;
my @primes;

# using a Sieve of Eratosthenes
# fill a $limit-element array with 1's, mark them as 0's if they're multiples
for my $i (2..sqrt($limit)) {
	if ($list[$i]) {
		#say "$i is true";
		for (my $j = $i**2; $j < @list; $j += $i) {
			$list[$j] = 0;
		}
	}
}
my $sum = 0;
# push prime indexes onto a list
for (2..$#list) {
	#push @primes, $_ if $list[$_];
	$sum += $_ if $list[$_];
}

say "Sum of all primes below $limit = $sum";
#say "@primes";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";