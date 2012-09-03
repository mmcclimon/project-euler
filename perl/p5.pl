#!/usr/bin/perl
use warnings;
use strict;
use Time::HiRes qw(gettimeofday tv_interval);
use v5.10;

# Euler Project #5
# What is the smallest number divisible by each of the numbers 1 to 20?
my $t0 = [gettimeofday()];

# prime factorization solution

my $limit = 20;

# create an array of primes less than the limit
my @primes = (2);
for my $num (3..$limit) {
	my $found;
	for (@primes) {
		if ($num % $_ == 0) { $found = 1; last;}
	}
	push @primes, $num unless $found;
}
#say "@primes";

# go through the primes, find the greatest exponent of each
# that's less than the limit
my @factors;
for my $prime (@primes) {
	for (1..10) {				# if extended, this upper limit will need to be changed
		if ($prime ** $_ > $limit) {
			push (@factors, $prime ** ($_-1));
			last;
		}
	}
}
#say "@factors";

# multiply all the factors together to get the least common multiple
my $lcm = 1;
$lcm *= $_ for @factors;
say "Least common multiple = $lcm";

print "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.\n";


=pod

#brute force solution, much slower

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
