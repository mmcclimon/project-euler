#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #12
# What is the value of the first triangle number to have over five hundred divisors?
my $t0 = [gettimeofday()];

my $numTriangles = shift || 15_000;

# get an arbitrary number of triangle numbers
my @triangles = (1);
my $num = 2;
while (@triangles < $numTriangles) {
	push @triangles, $triangles[-1] + $num;
	$num++;
}

# using a Sieve of Eratosthenes
# fill a $limit-element array with 1's, mark them as 0's if they're multiples

my $limit = sqrt($triangles[-1]);
my @list = map {$_ = 1} 0..$limit;
my @primes;
for my $i (2..sqrt($limit)) {
	if ($list[$i]) {
		#say "$i is true";
		for (my $j = $i**2; $j < @list; $j += $i) {
			$list[$j] = 0;
		}
	}
}
for (2..$#list) {
	push @primes, $_ if $list[$_];
}

# find prime factors for triangles
for my $triangle (@triangles) {
	my @factors;
	my $comp = $triangle;
	for (@primes) {
		last if $_ > $comp;
		if ($comp % $_ == 0) {
			push @factors, $_;
			$comp /= $_;
			redo;
		}
	}
	
	# figure out number of divisors, based on prime factorization
	my %histo;
	my $divisors = 1;
	$histo{$_}++ for @factors;
	$divisors *= ($histo{$_} + 1) for (keys %histo);
	say "$triangle has $divisors divisors" if ($divisors > 475);
	
}

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
