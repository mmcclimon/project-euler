#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

use List::Permutor;

# Euler Project #24
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
my $t0 = [gettimeofday()];

my $perm = new List::Permutor (0..9);
my $count = 0;
my @perms;
while (my @set = $perm->next) {
	$count++;
	last if $count > 1_000_000;
	push @perms, "@set";
}

say "Total number of permutations: $count";
#say for @perms;
say "Millionth permutation: $perms[999_999]";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";