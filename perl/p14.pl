#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #14
# Find the longest sequence using a starting number under one million. (Collatz conjecture)
my $t0 = [gettimeofday()];

my $n;
my %results;
INT: for my $int (10..999999) {
	$n = $int;
	my $count = 1;
	next unless ($n % 2);
	while ($n != 1) {
		$n = ($n % 2) ? 3*$n+1 : $n/2;
		# if a number already exists in the results hash 
		# add its computed result to the count so far
		if (exists $results{$n}) {
			$results{$int} = $count + $results{$n};
			next INT;
		}
		$count++;
	}
	# add a key/value to the results hash
	$results{$int} = $count;
}

my $topKey = (sort { $results{$b} <=> $results{$a} } (keys %results))[0];
say "For longest chain ($results{$topKey}), starting number is $topKey.";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
