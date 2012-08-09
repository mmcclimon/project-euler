#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #23
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
my $t0 = [gettimeofday()];

my @abundants;

my $numCalcs = 0;
sub sum_divisors {
	my $sum = 0;
	my $composite = shift;
	for (1..sqrt($composite)) {
		if ($composite % $_ == 0) {
			$sum += $_;
			my $pair = $composite / $_;
			$sum += $pair if ($_ > 1 && $_ != $pair );
		}
	}
	$sum;
}

for (2..28123) {
	push @abundants, $_ if (sum_divisors($_) > $_);
}

# hash table of sums of abundants
my %sums;
for my $i (0..$#abundants) {
	$sums{$abundants[$i] + $abundants[$_]} = 0 for ($i..$#abundants);
}

# go through all the numbers and add them up if they aren't in the sum hash
my $sum = 0;
for (1..28123) {
	$sum += $_ unless (exists $sums{$_});
}

say "Sum of non-summable abundant numbers: $sum";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
