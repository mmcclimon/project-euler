#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #9
# Find the only Pythagorean triple, {a, b, c}, for which a + b + c = 1000.
my $t0 = [gettimeofday()];

# Euler's formula: a = m^2 - n^2, b = 2mn, c = m^2 + n^2 
# so calculating m^2 + mn = 500 will find them.

my ($a, $b, $c);

M: for my $m (reverse(2..sqrt(500))) {
	say "m = $m";
	for my $n (1..$m-1) {
		say "\tn = $n";
		my $prod = ($m**2 + $m*$n);
		last if ($prod > 500);
		if ($prod == 500) {
			#say "found one!";
			$a = $m**2 - $n**2;
			$b = 2 * $m * $n;
			$c = $m**2 + $n**2;
			last M;
		}
	}
}

say "Pythagorean triple {$a, $b, $c}, sum = ", $a + $b + $c, ", product = ", $a * $b * $c;


say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";